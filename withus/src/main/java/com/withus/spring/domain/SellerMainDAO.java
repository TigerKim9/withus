package com.withus.spring.domain;

import java.util.List;

public interface SellerMainDAO {
	//오늘
	public abstract List<SellerMainDTO> untilToday();
	//1주일
	public abstract List<SellerMainDTO> untilWeek();
	//한달
	public abstract List<SellerMainDTO> untilMonth();
	
	//오픈예정 프로젝트 수 
	public abstract List<SellerMainDTO> comingsoonProject();
	
	//오픈한 프로젝트 수
	public abstract List<SellerMainDTO> openingProject();
	
	
	//판매자별 오늘 매출 
	public abstract List<SellerMainDTO> seller_untilToday(String selid); 
	//판매자별 1주 매출 
	public abstract List<SellerMainDTO>seller_untilWeek(String selid); 
	//판매자별 한달 매출 
	public abstract List<SellerMainDTO> seller_untilMonth(String selid);
	
	//판매자별 오픈예정 프로젝트 수
	public abstract List<SellerMainDTO> seller_comingsoonProject(String selid);
	//판매자별 오픈한 프로젝트 수
	public abstract List<SellerMainDTO> seller_openingProject(String selid);
	
	//판매자별 좋아요 수
	public abstract List<SellerMainDTO> seller_likeCount(String selid);
	
	//판매자별 전체 금액
	public abstract List<SellerMainDTO> seller_totalPrice(String selid);
	
	//판매자별 작년 총 금액
	public abstract List<SellerMainDTO> seller_lastTotalPrice(String selid);
	
	//판매자별 카테고리 비율
	public abstract List<SellerMainDTO> seller_category(String selid); 
	
	//판매자별 매달 매출
	public abstract List<SellerMainDTO> seller_monthPrice(String selid);
	
	//1~4분기 매출
	public abstract List<SellerMainDTO> seller_firstQuarter(String selid);
	public abstract List<SellerMainDTO> seller_secondQuarter(String selid);
	public abstract List<SellerMainDTO> seller_thridQuarter(String selid);
	public abstract List<SellerMainDTO> seller_fourthQuarter(String selid);
	
	//방문자 수
	public abstract List<SellerMainDTO> seller_visitorCount(String selid);
	//서포터 수
	public abstract List<SellerMainDTO> seller_supportCount(String selid);
	//문의글 수 
	public abstract List<SellerMainDTO> seller_inquiryCount(String selEmail);
	//결제완료 수
	public abstract List<SellerMainDTO> seller_payFinshed(String selEmail);
	//셀러메인페이지 인기프로젝트
	public abstract List<SellerMainDTO> seller_popularArticle();
	//셀러메인 공지사항
	public abstract List<SellerMainDTO> adminNtList();
	
	
	
}
