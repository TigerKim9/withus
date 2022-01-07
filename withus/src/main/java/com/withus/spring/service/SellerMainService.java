package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withus.spring.domain.SellerMainDAO;
import com.withus.spring.domain.SellerMainDTO;

@Service
public class SellerMainService {

	SellerMainDAO dao;

	@Autowired
	public void setDao(SellerMainDAO dao) {
		this.dao = dao;
	}

	public List<SellerMainDTO> untilMonth() {
		// TODO Auto-generated method stub
		return dao.untilMonth();
	}

	public List<SellerMainDTO> untilToday() {
		// TODO Auto-generated method stub
		return dao.untilToday();
	}

	public List<SellerMainDTO> untilWeek() {
		// TODO Auto-generated method stub
		return dao.untilWeek();
	}

	public List<SellerMainDTO> comingsoonProject() {
		// TODO Auto-generated method stub
		return dao.comingsoonProject();
	}

	public List<SellerMainDTO> openingProject() {
		// TODO Auto-generated method stub
		return dao.openingProject();
	}

	public List<SellerMainDTO> seller_untilToday(String selid) {
		return dao.seller_untilToday(selid);
	}

	public List<SellerMainDTO> seller_untilWeek(String selid) {
		return dao.seller_untilWeek(selid);
	}

	public List<SellerMainDTO> seller_untilMonth(String selid) {
		return dao.seller_untilMonth(selid);
	}
	
	public List<SellerMainDTO> seller_comingsoonProject(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_comingsoonProject(selid);
	}

	public List<SellerMainDTO> seller_openingProject(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_openingProject(selid);
	}
	public List<SellerMainDTO> seller_likeCount(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_likeCount(selid);
	}
	public List<SellerMainDTO> seller_totalPrice(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_totalPrice(selid);
	}
	public List<SellerMainDTO> seller_category(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_category(selid);
	}
	public List<SellerMainDTO> seller_monthPrice(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_monthPrice(selid);
	}

	public List<SellerMainDTO> seller_firstQuarter(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_firstQuarter(selid);
	}

	public List<SellerMainDTO> seller_secondQuarter(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_secondQuarter(selid);
	}

	public List<SellerMainDTO> seller_thridQuarter(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_thridQuarter(selid);
	}

	public List<SellerMainDTO> seller_fourthQuarter(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_fourthQuarter(selid);
	}
	public List<SellerMainDTO> seller_lastTotalPrice(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_lastTotalPrice(selid);
	}
	public List<SellerMainDTO> seller_visitorCount(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_visitorCount(selid);
	}

	public List<SellerMainDTO> seller_supportCount(String selid) {
		// TODO Auto-generated method stub
		return dao.seller_supportCount(selid);
	}
	public List<SellerMainDTO> seller_inquiryCount(String selEmail) {
		// TODO Auto-generated method stub
		return dao.seller_inquiryCount(selEmail);
	}
	public List<SellerMainDTO> seller_payFinshed(String selEmail) {
		// TODO Auto-generated method stub
		return dao.seller_payFinshed(selEmail);
	}
	
	public List<SellerMainDTO> seller_popularArticle() {
		// TODO Auto-generated method stub
		return dao.seller_popularArticle();
	}
	public List<SellerMainDTO> adminNtList() {
		// TODO Auto-generated method stub
		return dao.adminNtList();
	}

}
