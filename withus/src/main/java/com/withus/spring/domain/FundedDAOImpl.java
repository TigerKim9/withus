package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundedDAOImpl implements FundedDAO {

	private FundedDAO mapper;

	@Autowired
	public FundedDAOImpl(SqlSession sqlSession) {
		System.out.println("FundDAOImpl()호출");
		mapper = sqlSession.getMapper(FundedDAO.class);
	}

	@Override
	public int fund(FundedDTO dto) {
		System.out.println("fund-mapper 들어옴");
//		System.out.println(dto.getF_prnum());
//		System.out.println(dto.getF_userid());
		System.out.println(dto.getPrnum());
		System.out.println(dto.getUseremail());
		return mapper.fund(dto);
	}

	@Override
	public List<FundedDTO> myfundedlist(String useremail) {
		System.out.println("메퍼값 들어옴" + mapper.myfundedlist(useremail));
		return mapper.myfundedlist(useremail);
	}
	
	//
	@Override
	public List<String> myprnumlist(String useremail) {
		return mapper.myprnumlist(useremail);
	}

	@Override
	public Integer allFundedPrice() {
		return mapper.allFundedPrice();
	}
	
	@Override
	public List<ProjectFundingDTO> getcnt(String useremail) {
		return mapper.getcnt(useremail);
}
}
