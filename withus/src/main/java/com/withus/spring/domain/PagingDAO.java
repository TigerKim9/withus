package com.withus.spring.domain;


import java.util.List;

public interface PagingDAO {
	
	// 판매자 프로젝트 관리 페이징 count(*)
	public abstract int countBoard(String selid);
	
	// 판매자 프로젝트 관리 페이징 List , WHERE pf_selid
	public abstract List<ProjectFundingDTO> selectBoard(String selid, int start,int cntPage);
	
	// event의 count 내용만 따로
	public abstract int cuserevent(String event);
	
	// notice의 count 내용만 따로
	public abstract int cusernotice(String notice);
	
	// notice의 내용 페이징
	public abstract List<NoticeDTO> userNotice(String notice,int start,int cntPage);
	
	// event의 내용 페이징
	public abstract List<NoticeDTO> userEvent(String event,int start,int cntPage);
	
	// notice 내용 전체적으로 count
	public abstract int countnotice();
	
	// 전체적인 카테고리 내용 ( 구분 없이 notice테이블 내용 전부 )
	public abstract List<NoticeDTO> selectNotice(int start,int cntPage);
	
	// myfundedlist의 count f_prnum
	public abstract int countMfl(int prnum);
	
	// myfundedlist의 페이징 WHERE f_useremail
	public abstract List<FundedDTO> selectMfl(String useremail,int start,int cntPage);
	
	// 나의 문의 목록 페이징 count
	public abstract int countInquiry(String useremail);
	
	// 나의 문의 목록 페이징 where in_useremail
	public abstract List<InquiryDTO> selectInquiry(String useremail,int start,int cntPage);
	
	// 관리자 단 notice 내용들 count 전체적으로 다
	public abstract int adntcount();
		
	// 관리자 단 notice 페이징 전체적으로
	public abstract List<NoticeDTO> ntcList(int start,int cntPage);

	// 관리자 단 count 프로젝트 펀딩 보이기
	public abstract int adAllProj();
	
	// 관리자단 프로젝트 펀딩 페이징
	public abstract List<ProjectFundingDTO> adProjList(int start,int cntPage);
	

	
}
