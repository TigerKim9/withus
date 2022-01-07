package com.withus.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.withus.spring.domain.InquiryanswerDTO;
import com.withus.spring.domain.PagingDTO;
import com.withus.spring.domain.ProjectFundingDTO;
import com.withus.spring.service.AdminService;
import com.withus.spring.service.InquiryService;
import com.withus.spring.service.InquiryanswerService;
import com.withus.spring.service.PagingService;
import com.withus.spring.service.ProjectFundingService;
import com.withus.spring.service.SellerMainService;
import com.withus.spring.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	private SellerService sellerService;

	private ProjectFundingService projService;
	
	private InquiryService InquiryService;
	
	private InquiryanswerService inquiryanswerService;

	private SellerMainService sellerMainService;
	
	private AdminService adminService;
	private PagingService pagingService;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	public void setService(SellerService sellerService, ProjectFundingService projService,
			InquiryService inquiryService, InquiryanswerService inquiryanswerService,
			SellerMainService sellerMainService, AdminService adminService,PagingService pagingService) {
		this.sellerService = sellerService;
		this.projService = projService;
		this.InquiryService = inquiryService;
		this.inquiryanswerService = inquiryanswerService;
		this.sellerMainService = sellerMainService;
		this.adminService = adminService;
		this.pagingService=pagingService;
	}

	@RequestMapping("/main")
	   public String sellerMainPage(Model model, Principal principal) {
	      String selid = sellerService.existEmail(printEmail(principal));
	      String selEmail = printEmail(principal);
	      
	      if(selid!=null) {
	         model.addAttribute("selid", selid);
	         model.addAttribute("untilMonth", sellerMainService.untilMonth());
	         model.addAttribute("untilToday", sellerMainService.untilToday());
	         model.addAttribute("untilWeek", sellerMainService.untilWeek());
	         model.addAttribute("comingsoon", sellerMainService.comingsoonProject());
	         model.addAttribute("open", sellerMainService.openingProject());
	         model.addAttribute("sellerToday", sellerMainService.seller_untilToday(selid));
	         model.addAttribute("sellerWeek", sellerMainService.seller_untilWeek(selid));
	         model.addAttribute("sellerMonth", sellerMainService.seller_untilMonth(selid));
	         model.addAttribute("seller_comingsoonProject", sellerMainService.seller_comingsoonProject(selid));
	         model.addAttribute("seller_openingProject", sellerMainService.seller_openingProject(selid));
	         model.addAttribute("seller_likeCount", sellerMainService.seller_likeCount(selid));
	         model.addAttribute("seller_totalPrice", sellerMainService.seller_totalPrice(selid));
	         model.addAttribute("seller_category", sellerMainService.seller_category(selid));
	         model.addAttribute("seller_monthPrice", sellerMainService.seller_monthPrice(selid));
	         model.addAttribute("seller_firstQuarter", sellerMainService.seller_firstQuarter(selid));
	         model.addAttribute("seller_secondQuarter", sellerMainService.seller_secondQuarter(selid));
	         model.addAttribute("seller_thridQuarter", sellerMainService.seller_thridQuarter(selid));
	         model.addAttribute("seller_fourthQuarter", sellerMainService.seller_fourthQuarter(selid));
	         model.addAttribute("seller_lastTotalPrice", sellerMainService.seller_lastTotalPrice(selid));
	         model.addAttribute("seller_visitorCount", sellerMainService.seller_visitorCount(selid));
	         model.addAttribute("seller_supportCount", sellerMainService.seller_supportCount(selid));
	         model.addAttribute("seller_inquiryCount", sellerMainService.seller_inquiryCount(selid));
	         model.addAttribute("seller_payFinshed", sellerMainService.seller_payFinshed(selEmail));
	         model.addAttribute("notice", sellerMainService.adminNtList()); 
			 model.addAttribute("popular",sellerMainService.seller_popularArticle());
	         return "seller/sellerMain";
	      }else {
	         return "redirect:/regSeller";
	      }
	      

	   }

	@RequestMapping("/myProject")
	public String myProjPage(Model model, Principal principal, PagingDTO dto,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage)
		
		 {
		//판매자 프로젝트 관리 페이징인데 본인 내용만 들어오는게 아니라 다른 사람의 내용도 들어오는거 같아서 확인필요
		String selid = sellerService.existEmail(printEmail(principal));
		int total = pagingService.countBoard(selid);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		dto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", dto);
		List<ProjectFundingDTO> selectBoard = pagingService.selectBoard(selid,dto.getStart(),dto.getCntPage());
		model.addAttribute("viewAll", selectBoard);
		
		
		String useremail = printEmail(principal);
		model.addAttribute("prc", useremail);
		
		
		if (sellerService.cntMyProj(selid) == 0) {	// 생성된 프로젝트가 없는 경우
			model.addAttribute("selid", selid);
			return "seller/write_project";
		} else {
			model.addAttribute("selid", selid);
			model.addAttribute("list", sellerService.myProjList(selid));
			return "seller/myProject";
		}
		
		
		
	}

	@RequestMapping("/sellerInfo")
	public String sellerInfoPage() {
		return "seller/sellerInfo";
	}
	
	@RequestMapping("/inquiryList")
	public String InquiryList(Principal principal, Model model) {
		String selEmail = sellerService.existEmail(printEmail(principal));
		String useremail = printEmail(principal);

		if (useremail != null) {
			model.addAttribute("selid", selEmail);
			model.addAttribute("quiry", InquiryService.selectInquiryToProj(selEmail));
			return "seller/InquiryList";
		} else {
			return "seller/InquiryList";
		}

	}
	
	@RequestMapping("inquiryBynum")
	public String selectBynum(Model model, Principal principal, int num) {
		String prc = printEmail(principal);
		String selEmail = sellerService.existEmail(printEmail(principal));
		if (prc != null) {
			model.addAttribute("prc", prc);
			model.addAttribute("selid", selEmail);
			model.addAttribute("list", InquiryService.selectBynum(num));
			model.addAttribute("answer", inquiryanswerService.showAnswer(num));
			return "seller/InquiryBynum";
		} else {
			return "main/loginForm";
		}

	}
	
	@RequestMapping("writeAnswer")
	public String writeanswer(Model model, InquiryanswerDTO dto) {
		model.addAttribute("answer", inquiryanswerService.inquiryAnswer(dto));
		model.addAttribute("dto", dto);
		return "seller/writeAnswer";
	}
	
	@RequestMapping(value = "answerOk/{innum}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<InquiryanswerDTO>> answerOk(@PathVariable("innum") int innum, InquiryanswerDTO dto) {
		ResponseEntity<List<InquiryanswerDTO>> entity = null;

		try {
			List<InquiryanswerDTO> showAnswer = inquiryanswerService.showAnswer(innum);
			entity = new ResponseEntity<>(showAnswer, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	public String printEmail(Principal principal) {
		String regex = "^[0-9]*$"; // 숫자만 존재하는지 검증하는 정규표현식
		String emailRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]" + "([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"; // 이메일
																													// 검증
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

				String regprc = StringUtils.substringBetween(prc, "email=", ",");// email= 과 , 사이의 값을 가져옴.
				return regprc;
			}
		} catch (NullPointerException e) {
			return null;
		}
		return null;
	}
	
	@RequestMapping("/viewProject")
	public String viewProject(Model model, int prnum, Principal principal) {
		
		String selid = sellerService.existEmail(printEmail(principal));
		model.addAttribute("selid", selid );
		model.addAttribute("list", projService.selectByPrnum(prnum));
		return "seller/viewProject";
	}
	
	@RequestMapping("/write_project")
	public String write_project(Model model, Principal principal) {
		String selid = sellerService.existEmail(printEmail(principal));
		model.addAttribute("selid", selid);
		return "seller/write_project";
	}

	@PostMapping("/write_projectOk")
	public String write_projectOk(@Valid ProjectFundingDTO dto, @RequestParam("filename") MultipartFile file, BindingResult result, Model model) {
		try {
			System.out.println("서버경로" + servletContext.getRealPath(""));//서버경로 servletContext.getContextPath
			file.transferTo(new File(System.getProperty("user.dir")+ "\\src\\main\\resources\\static\\images/" +file.getOriginalFilename()));
			String filepath = file.getOriginalFilename();
			dto.setFilePath(filepath);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result.hasErrors()) {
			System.out.println("error 들어옴");
			System.out.println(result.getAllErrors());
			return "seller/write_project";
		}
		model.addAttribute("dto", dto);
		model.addAttribute("result", sellerService.write_project(dto));
		return "seller/write_projectOk";
	}
	
	@GetMapping("/deleteProject")
	public String deleteProject(int prnum, Model model) {
		model.addAttribute("result", sellerService.deleteByPrnum(prnum));
		return "seller/deleteProject";
	}
	
	@RequestMapping("/updateProject")
	public String updateProject(int prnum, Model model, Principal principal) {
		String selid = sellerService.existEmail(printEmail(principal));
		model.addAttribute("selid", selid );
		model.addAttribute("list", projService.selectByPrnum(prnum));
		return "seller/updateProject";
	}
	
	@PostMapping("/updateOkProject")
	public String updateOkProject(ProjectFundingDTO dto, @RequestParam("filename") MultipartFile file,  Model model) {	
		try {
			file.transferTo(new File(System.getProperty("user.dir")+ "\\src\\main\\resources\\static\\images/" +file.getOriginalFilename()));
			String filepath = file.getOriginalFilename();
			dto.setFilePath(filepath);
		}catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", sellerService.updateProject(dto));
		return "seller/updateOkProject";
	}

	// write_project 시 파일 업로드 관련
	@RequestMapping(value = "imageUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFIle)
			throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFIle.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && com.nimbusds.oauth2.sdk.util.StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/img");

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						resp.setContentType("text/html");
						String fileUrl = req.getContextPath() + "/img/" + fileName;

						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}

		return null;
	}
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		binder.setValidator(new SellerWriteProjectValidator());
//	}	
}


