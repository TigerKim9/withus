package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMainDAOImpl implements AdminMainDAO {
	AdminMainDAO mapper;

	@Autowired
	public AdminMainDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(AdminMainDAO.class);
	}

	@Override
	public List<SellerMainDTO> admin_category() {
		return mapper.admin_category();
	}

	@Override
	public List<SellerMainDTO> admin_totalPrice() {
		return mapper.admin_totalPrice();
	}

	@Override
	public List<SellerMainDTO> admin_lastTotalPrice() {
		return mapper.admin_lastTotalPrice();
	}

}
