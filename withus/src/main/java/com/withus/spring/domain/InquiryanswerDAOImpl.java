package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryanswerDAOImpl implements InquiryanswerDAO {

	private InquiryanswerDAO mapper;

	@Autowired
	public InquiryanswerDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(InquiryanswerDAO.class);
	}

	@Override
	public int inquiryAnswer(InquiryanswerDTO dto) {
		return mapper.inquiryAnswer(dto);
	}

	@Override
	public List<InquiryanswerDTO> showAnswer(int innum) {
		return mapper.showAnswer(innum);
	}
}
