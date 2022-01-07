package com.withus.spring;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.withus.spring.domain.ProjectFundingDTO;
import com.withus.spring.domain.SellerDTO;
import com.withus.spring.service.SellerService;
import com.withus.spring.service.UserService;


public class SellerWriteProjectValidator implements Validator {

	
	// 이  Validator 가 제공된 Class의 인스턴스(clazz) 를 유효성 검사 할수 있나?
	@Override
	public boolean supports(Class<?> clazz) {
		System.out.println("supports(" + clazz.getName() + ")");
		// 검증할 객체의 클래스 타입인지 확인 : WriteDTO = class; 가능여부
		return ProjectFundingDTO.class.isAssignableFrom(clazz);
	}
	
	// 주어진 객체(target)에 유효성검사를 하고 
	// 유효성검사에 오류가 있는 경우 주어진 객체에 이 오류들을 errors 에 등록 한다.
	// 아래 validate() 는 Spring 이 기본적인 binding이 수행한 이후에 호출된다.
	// 따라서, errors 에는 Spring이 수행한 binding 에러 들이 이미 담겨 있고
	// target 에는 binding 이 완료한 커맨드 객체가 전달된다.
	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");
		ProjectFundingDTO dto = (ProjectFundingDTO)target;
		
		String title = dto.getTitle();
		if(title == null || title.trim().isEmpty()) {
			System.out.println("title : 제목을 입력해주세요.");
			errors.rejectValue("title", "제목을 입력해주세요.");
		}
		try {
		DateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
		String regDate = dto.getRegDate();
		Date regDates = dateformat.parse(regDate);
		String startDate = dto.getStartDate();
		Date startDates = dateformat.parse(startDate);
		String endDate = dto.getEndDate();
		Date endDates = dateformat.parse(endDate);
		if(startDates.before(regDates) ) {  // binding 실패하면 null 로 남아 있을 것이다.
			System.out.println("시작일이 오늘보다 전입니다.");
			// 에러 등록 rejectValue(field, errorCode);
			errors.rejectValue("startDate", "오늘보다 후의 날이어야합니다.");
		}else if(startDates.after(endDates)) {
			errors.rejectValue("startDate", "마감일은 시작일보다 미래여야합니다.");
		}else if(startDates.equals(endDates)) {
			errors.rejectValue("endDate","시작한 당일에 끝날 순 없습니다.");
		}
		}catch(ParseException p) {
			
		}
		
	
		int itemprice = dto.getItemprice();
		int targetprice = dto.getPrice();
		if(itemprice == 0 || targetprice == 0) {
			errors.rejectValue("price", "가격은 1원 이상을 입력해주세요");
		}else if(itemprice > targetprice) {
			errors.rejectValue("price", "목표금액은 아이템 가격보다 커야합니다.");
		}
		
	

	}

}

















