package com.withus.spring.domain;

import java.util.List;

public interface FundedDAO {

	public abstract int fund(FundedDTO dto);
	
	// 특정 아이디의 펀딩한 내용 읽기
	public abstract List<FundedDTO> myfundedlist(String useremail);
	
	// 특정 아이디가 펀딩한 prnum 값 가져오기.
	public abstract List<String> myprnumlist(String useremail);
	
	// 펀딩된 전체 금액 가져오기
	public abstract Integer allFundedPrice();
	
	public abstract List<ProjectFundingDTO> getcnt(String useremail);
}
