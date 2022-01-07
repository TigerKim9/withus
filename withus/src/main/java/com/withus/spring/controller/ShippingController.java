package com.withus.spring.controller;

import java.security.Principal;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withus.spring.service.ShippingService;

@Controller
@RequestMapping("/**")
public class ShippingController {
	
	@Autowired
	ShippingService shippingService;
	
	@RequestMapping("/shippingForm/**")
	public String shippingForm() {
		return "main/popup/shippingForm";
	}
	
	@RequestMapping("/deliverForm/**")
	public String deleverForm(Model model, Principal principal) {
		System.out.println("deliverForm 확인용 접속");
		String prc = printEmail(principal);

	      model.addAttribute("prc", prc);
		model.addAttribute("list", shippingService.selectByShp());
//		model.addAttribute("delivery", shippingService.writeShp(dv_prnum));
//		model.addAttribute("update", shippingService.updateShp(dv_prnum)); 
		System.out.println(model.toString());
		return "main/deliverForm";
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
	
//	// 페이지 출력
//	@GetMapping("/{dvpage}/{dvpageRows}")   
//	public UserShpWriteList list(
//			@PathVariable int page, 
//			@PathVariable int pageRows) {
//		List<UserShpDTO> list = null;
//		
//		// message 
//		StringBuffer message = new StringBuffer();
//		String status = "FAIL";
//		
//		// 페이징 관련 세팅 값들
//		//page : 현재 페이지
//		//pageRows : 한 '페이지'에 몇개의 글을 리스트 할것인가?
//		int writePages = 10;    // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
//		int totalPage = 0; // 총 몇 '페이지' 분량인가? 
//		int totalCnt = 0;  // 글은 총 몇개인가?
//		
//		
//		try {			
//			// 글 전체 개수 구하기
//			totalCnt = shippingService.count();
//			
//			// 총 몇페이지 분량?
//			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
//			
//			// from: 몇번째 row 부터?
//			int from = (page - 1) * pageRows;  
//			
//			list = shippingService.list(from, pageRows);
//			
//			if(list == null) {
//				message.append("[리스트할 데이터가 없습니다]");
//			} else {
//				status = "OK";
//			}
//		} catch(Exception e) {
//			e.printStackTrace();
//			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
//		}
//		
//		UserShpWriteList result = new UserShpWriteList();
//		
//		result.setStatus(status);
//		result.setMessage(message.toString());
//		
//		if(list != null) {
//			result.setCount(list.size());
//			result.setList(list);
//		}
//		
//		result.setPage(page);
//		result.setTotalPage(totalPage);
//		result.setWritePages(writePages);
//		result.setPageRows(pageRows);
//		result.setTotalCnt(totalCnt);
//		
//		return result;
//	}
//	
//	

//		
//		// 배송 작성
//		@PostMapping("/shippingwrite/**")  
//		public UserShpWriteResult writeOk(UserShpDTO dvwr) {
//			int count = 0;
//					
//			// message 
//			StringBuffer message = new StringBuffer();
//			String status = "FAIL";
//			
//			try {
//				count = shippingService.writeShp(dvwr);
//				if(count == 0) {
//					message.append("[트랜잭션 실패 : 0 insert]");
//				} else {
//					status = "OK";
//				}
//			} catch(Exception e) {
//				e.printStackTrace();
//				message.append("[트랜잭션 에러: " + e.getMessage() + "]");
//			}
//			
//			UserShpWriteResult result = new UserShpWriteResult();
//			result.setStatus(status);
//			result.setMessage(message.toString());
//			result.setCount(count);
//			return result;
//		}
//		
//		// 배송 수정
//		@PutMapping("/shippingupdate/**") 
//		public UserShpWriteResult updateOk(UserShpDTO dvud) {
//			int count = 0;
//				
//			// message 
//			StringBuffer message = new StringBuffer();
//			String status = "FAIL";
//			
//			try {
//				count = shippingService.updateShp(dvud);
//				if(count == 0) {
//					message.append("[트랜잭션 실패 : 0 update]");
//				} else {
//					status = "OK";
//				}
//			} catch(Exception e) {
//				e.printStackTrace();
//				message.append("[트랜잭션 에러: " + e.getMessage() + "]");
//			}
//			
//			UserShpWriteResult result = new UserShpWriteResult();
//			result.setStatus(status);
//			result.setMessage(message.toString());
//			result.setCount(count);
//			return result;
//		}

	
}
