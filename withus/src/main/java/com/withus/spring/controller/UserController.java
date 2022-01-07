package com.withus.spring.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withus.spring.GenericValidator;
import com.withus.spring.domain.InquiryDTO;
import com.withus.spring.domain.PagingDTO;
import com.withus.spring.domain.SellerDTO;
import com.withus.spring.domain.UserDTO;
import com.withus.spring.service.InquiryService;
import com.withus.spring.service.InquiryanswerService;
import com.withus.spring.service.PagingService;
import com.withus.spring.service.SellerService;
import com.withus.spring.service.UserService;

@Controller
public class UserController {

	private UserService userService;
	private SellerService sellerService;
	private InquiryService inquiryService;
	private InquiryanswerService inqAnsService;
	private PagingService pagingService;

	@Autowired
	public void setService(UserService userService, SellerService sellerService, InquiryService inquiryService,
			InquiryanswerService inqAnsService, PagingService pagingService) {
		this.userService = userService;
		this.sellerService = sellerService;
		this.inquiryService = inquiryService;
		this.inqAnsService = inqAnsService;
		this.pagingService=pagingService;
		
	}

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/join")
	public String join() {
		return "main/joinForm";
	}

	@PostMapping("/joinOk")
	public String joinOk(@ModelAttribute("w") @Valid UserDTO user, BindingResult result,
			RedirectAttributes redirectAttributes, Model model) {
		System.out.println("듀플 반환 값    " + userService.duplicateEmail(user.getEmail().trim()));

		String rawPassword = user.getPw();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPw(encPassword);

		model.addAttribute("user", user);
		redirectAttributes.addFlashAttribute("w", user);// redirect는 새로운 리퀘스트다.
		if (result.hasErrors()) {
			// 에러가능 추가적인 model attribute 지정 가능
			if (result.getFieldError("email") != null) {
				System.out.println("리절트값 : " + result.getFieldError("email").getCode());
				if (result.getFieldError("email").getCode().equals("noValue")) {
					Map<String, Object> map = new HashMap<>();
					map.put("EMAIL", "이메일을 입력해주세요.");
					redirectAttributes.addFlashAttribute("ERROR1", map);
				} else {
					Map<String, Object> map = new HashMap<>();
					map.put("DUPLEMAIL", "중복된 이메일입니다.");
					redirectAttributes.addFlashAttribute("ERROR1", map);
				}
			}
			if (result.getFieldError("pw") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("PW", "비밀번호를 입력해주세요.");
				redirectAttributes.addFlashAttribute("ERROR3", map);
			}
			if (result.getFieldError("name") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("NAME", "이름을 입력해주세요.");
				redirectAttributes.addFlashAttribute("ERROR4", map);
			}
			return "redirect:/join";
		}

		int cnt = userService.addUser(user);
		return "redirect:/loginForm";
	}

	@RequestMapping("/loginForm/**") // 추후 GUEST (로그인하지 않은 사용자)만 접근할 수 있게 변경
	public String login() {
		return "main/loginForm";
	}

	@RequestMapping(value = "/main/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	@RequestMapping("/profileForm/**")
	public String profileForm(Model model, Principal principal) {
		String email = printEmail(principal);
		model.addAttribute("prc", email);
		return "main/profileForm";
	}

	@RequestMapping("/profileMgt/**")
	public String profileMgt(Model model, Principal principal, UserDTO user) {
		String email = printEmail(principal);
		userService.findById(email);

		model.addAttribute("prc", email);
		model.addAttribute("user", userService.selectByEmail(email));
		return "main/profileMgt";
	}

	@RequestMapping("/profileUpdateOk")
	public String profileUpdateOk(UserDTO user, HttpServletRequest request, @RequestParam(value = "pw") String pw) {
		String p1 = request.getParameter("password1");
		String p2 = request.getParameter("password2");
		if (p1.equals("") && p2.equals("")) {
			return "redirect:/profileForm";
		} else if (p1.equals(p2)) {
			pw = p1;
		}

		/* 회원 비밀번호를 암호화 인코딩 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		/* 비밀번호 암호화하여 다시 user객체에 저장. */
		pw = encoder.encode(pw);
		user.setPw(pw); // DB에 넘겨주기위해 암호화 된 비밀번호를 user 객체에 저장
		userService.updateProfile(user);
		System.out.println(userService.updateProfile(user));
		System.out.println("수정성공");
		return "redirect:/profileForm";
	}

	@RequestMapping("/myInquiryList")
	public String myInpuiry(Model model, Principal principal,
			Integer num,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage
			) {
		
		
		if(num == null)
		{
			num=1;
		}
		
		String email = printEmail(principal);

		if (email != null) {
			model.addAttribute("prc", email);
		} else {
			model.addAttribute("", email);
		}
		
		int total = pagingService.countInquiry(email);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		PagingDTO dto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", dto);
		List<InquiryDTO> selectBoard = pagingService.selectInquiry(email, dto.getStart(), dto.getCntPage());
		model.addAttribute("inList", selectBoard);
		
		return "main/myInquiryList";
	}


	@RequestMapping("/viewInquiry")
	public String viewInquiry(Model model, int innum, Principal principal) {
		String email = printEmail(principal);

		if (email != null) {
			model.addAttribute("prc", email);
		} else {
			model.addAttribute("", email);
		}
		String prc = printEmail(principal);
		
		model.addAttribute("prc", prc);
		model.addAttribute("inList", inquiryService.selectBynum(innum));
		model.addAttribute("ansList", inqAnsService.showAnswer(innum));
		return "main/viewInquiry";
	}

	@RequestMapping("/deleteUser")
	public String userDelete(Model model, Principal principal, UserDTO user) {
		String email = printEmail(principal);
		userService.findById(email);

		model.addAttribute("prc", email);
		model.addAttribute("decodepw", userService.selectByEmail(email).getPw());
		model.addAttribute("user", userService.selectByEmail(email));

		return "main/deleteUser";
	}

	@RequestMapping("/deleteUserOk")
	public String userDeleteOk(Model model, Principal principal, UserDTO user, HttpServletRequest request) {
		String email = printEmail(principal);
		userService.findById(email);
		String pw = request.getParameter("pw");

		if (passwordEncoder.matches(pw, userService.selectByEmail(email).getPw())) {
			userService.deleteUser(user);
			model.addAttribute("msg", "회원탈퇴 되었습니다. 감사합니다.");
			model.addAttribute("url", "/logout");
			return "main/deleteUserOk";
		}
		return "redirect:/deleteUser";
	}

	@RequestMapping("/regSeller")
	public String regSeller(Model model, Principal principal, SellerDTO seller, Authentication authentication,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String email = printEmail(principal);
		session.setAttribute("sessionId", email);
		String id = (String) session.getAttribute("sessionId");

		if (sellerService.existEmail(id) != null) {
			return "redirect:/seller/main";
		} else {
			model.addAttribute("prc", email);
			return "main/regSeller";
		}
	}

	@RequestMapping("/regSellerOk")
	public String regSellerOk(@ModelAttribute("s") @Valid SellerDTO seller, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal, Model model, HttpSession session,
			SessionStatus status) throws Exception {

		String email = printEmail(principal);
		redirectAttributes.addFlashAttribute("s", seller);// redirect는 새로운 리퀘스트다.
		if (result.hasErrors()) {
			// 에러가능 추가적인 model attribute 지정 가능
			if (result.getFieldError("name") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("NAME", "이름을 입력해주세요.");
				redirectAttributes.addFlashAttribute("ERROR1", map);
			}
			if (result.getFieldError("business") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("BUSINESS", "사업자번호를 입력해주세요.");
				redirectAttributes.addFlashAttribute("ERROR2", map);
			}
			if (result.getFieldError("jumin") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("JUMIN", "주민번호를 입력해주세요.");
				redirectAttributes.addFlashAttribute("ERROR3", map);

			}
			return "redirect:/regSeller";
		}
//		model.addAttribute("seller", seller);
		sellerService.regSeller(seller);
		userService.addSeller(email);
		model.addAttribute("msg", "판매자 등록이 완료되었습니다! 다시 로그인해주세요");
		model.addAttribute("url", "/loginForm");
		session.invalidate();
		status.setComplete();
		return "main/regSellerOk";
	}

	public String printEmail(Principal principal) {
		String regex = "^[0-9]*$"; // 숫자만 존재하는지 검증하는 정규표현식
		String emailRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]" + "([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"; // 이메일
																													// 검증
																													// //
																													// 정규표현식
		try {
			String prc = principal.getName();
			if (prc != null) {
				if (Pattern.matches(emailRegex, prc)) { // 자체 로그인시
					return prc;
				}
				if (Pattern.matches(regex, prc)) { // 구글, 카카오 로그인이라면
					prc = principal.toString();
					prc = StringUtils.remove(prc, "has_email=true,"); // 카카오 이메일 추출하기 위해서 없애야함
				}
				System.out.println("원 API : " + prc);

				String regprc = StringUtils.substringBetween(prc, "email=", ",");// email= 과 , 사이의 값을 가져옴.
				return regprc;
			}
		} catch (NullPointerException e) {

			return null;
		}

		return null;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new GenericValidator(userService, sellerService));
	}

}