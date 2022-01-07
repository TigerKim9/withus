package com.withus.spring.domain;

import java.util.List;

public interface InquiryDAO {
	//문의글 작성
	public int writeQuiry(InquiryDTO dto);
	
	// 문의글 리스트 보기 1 -> WHERE useremail -> 글 쓴 User가 보는 것
	public List<InquiryDTO> selectQuiryAll(String useremail);
	
	// 문의글 리스트 보기 2 -> WHERE selid -> Seller가 보는 것
	public List<InquiryDTO> selectInquiryToProj(String selid);
	
	// 문의글 리스트 보기 3 -> WHERE prnum -> 프로젝트 글에서 보이는 문의
	public List<InquiryDTO> selectByPrnum(int prnum);
	
	// 특정 문의 글 보기
	public List<InquiryDTO> selectBynum(int num);
	
	public List<InquiryDTO> selectLastNum();
}
