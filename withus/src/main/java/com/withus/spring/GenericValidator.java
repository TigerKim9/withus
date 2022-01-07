package com.withus.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.withus.spring.domain.PagingDTO;
import com.withus.spring.domain.SellerDTO;
import com.withus.spring.domain.UserDTO;
import com.withus.spring.service.SellerService;
import com.withus.spring.service.UserService;

public class GenericValidator implements Validator {
	
		private UserService userService;
		private SellerService sellerService;
	
		public GenericValidator(UserService userSerivce, SellerService sellerService) {
			this.userService = userSerivce;
			this.sellerService = sellerService;
		}
		
	
	// 이  Validator 가 제공된 Class의 인스턴스(clazz) 를 유효성 검사 할수 있나?
		@Override
		public boolean supports(Class<?> clazz) {
			System.out.println("supports(" + clazz.getName() + ")");
			// 검증할 객체의 클래스 타입인지 확인 : WriteDTO = class; 가능여부
			return UserDTO.class.isAssignableFrom(clazz) 
					|| SellerDTO.class.isAssignableFrom(clazz)
					|| PagingDTO.class.isAssignableFrom(clazz)
					;
		}
		
		// 주어진 객체(target)에 유효성검사를 하고 
		// 유효성검사에 오류가 있는 경우 주어진 객체에 이 오류들을 errors 에 등록 한다.
		// 아래 validate() 는 Spring 이 기본적인 binding이 수행한 이후에 호출된다.
		// 따라서, errors 에는 Spring이 수행한 binding 에러 들이 이미 담겨 있고
		// target 에는 binding 이 완료한 커맨드 객체가 전달된다.
		@Override
		public void validate(Object target, Errors errors) {
			
		     if (target instanceof UserDTO) {
	             ValidationUtils.invokeValidator(new UserValidator(userService), target, errors);
	         }
	         if (target instanceof SellerDTO) {
	             ValidationUtils.invokeValidator(new SellerValidator(sellerService), target, errors);
	         }
		}
}
