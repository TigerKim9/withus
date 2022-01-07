package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerMainDAOImpl implements SellerMainDAO {

	SellerMainDAO mapper;

	@Autowired
	public SellerMainDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(SellerMainDAO.class);
	}

	@Override
	public List<SellerMainDTO> untilMonth() {
		// TODO Auto-generated method stub
		return mapper.untilMonth();
	}

	@Override
	public List<SellerMainDTO> untilToday() {
		// TODO Auto-generated method stub
		return mapper.untilToday();
	}

	@Override
	public List<SellerMainDTO> untilWeek() {
		// TODO Auto-generated method stub
		return mapper.untilWeek();
	}

	@Override
	public List<SellerMainDTO> comingsoonProject() {
		// TODO Auto-generated method stub
		return mapper.comingsoonProject();
	}

	@Override
	public List<SellerMainDTO> openingProject() {
		// TODO Auto-generated method stub
		return mapper.openingProject();
	}

	@Override
	public List<SellerMainDTO> seller_untilToday(String selid) {
		return mapper.seller_untilToday(selid);
	}

	@Override
	public List<SellerMainDTO> seller_untilWeek(String selid) {
		return mapper.seller_untilWeek(selid);
	}

	@Override
	public List<SellerMainDTO> seller_untilMonth(String selid) {
		return mapper.seller_untilMonth(selid);
	}

	@Override
	public List<SellerMainDTO> seller_comingsoonProject(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_comingsoonProject(selid);
	}

	@Override
	public List<SellerMainDTO> seller_openingProject(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_openingProject(selid);
	}

	@Override
	public List<SellerMainDTO> seller_likeCount(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_likeCount(selid);
	}

	@Override
	public List<SellerMainDTO> seller_totalPrice(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_totalPrice(selid);
	}

	@Override
	public List<SellerMainDTO> seller_category(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_category(selid);
	}

	@Override
	public List<SellerMainDTO> seller_monthPrice(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_monthPrice(selid);
	}

	@Override
	public List<SellerMainDTO> seller_firstQuarter(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_firstQuarter(selid);
	}

	@Override
	public List<SellerMainDTO> seller_secondQuarter(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_secondQuarter(selid);
	}

	@Override
	public List<SellerMainDTO> seller_thridQuarter(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_thridQuarter(selid);
	}

	@Override
	public List<SellerMainDTO> seller_fourthQuarter(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_fourthQuarter(selid);
	}

	@Override
	public List<SellerMainDTO> seller_lastTotalPrice(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_lastTotalPrice(selid);
	}

	@Override
	public List<SellerMainDTO> seller_visitorCount(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_visitorCount(selid);
	}

	@Override
	public List<SellerMainDTO> seller_supportCount(String selid) {
		// TODO Auto-generated method stub
		return mapper.seller_supportCount(selid);
	}

	@Override
	public List<SellerMainDTO> seller_inquiryCount(String selEmail) {
		// TODO Auto-generated method stub
		return mapper.seller_inquiryCount(selEmail);
	}

	@Override
	public List<SellerMainDTO> seller_payFinshed(String selEmail) {
		// TODO Auto-generated method stub
		return mapper.seller_payFinshed(selEmail);
	}

	@Override
	public List<SellerMainDTO> seller_popularArticle() {
		// TODO Auto-generated method stub
		return mapper.seller_popularArticle();
	}

	@Override
	public List<SellerMainDTO> adminNtList() {
		// TODO Auto-generated method stub
		return mapper.adminNtList();
	}

}
