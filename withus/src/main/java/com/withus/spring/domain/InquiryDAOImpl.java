package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	private InquiryDAO mapper;

	@Autowired
	public InquiryDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(InquiryDAO.class);
	}

	@Override
	public int writeQuiry(InquiryDTO dto) {
		return mapper.writeQuiry(dto);
	}

	@Override
	public List<InquiryDTO> selectQuiryAll(String useremail) {
		return mapper.selectQuiryAll(useremail);
	}

	@Override
	public List<InquiryDTO> selectBynum(int num) {
		return mapper.selectBynum(num);
	}

	@Override
	public List<InquiryDTO> selectLastNum() {
		return mapper.selectLastNum();
	}

	@Override
	public List<InquiryDTO> selectInquiryToProj(String selid) {
		return mapper.selectInquiryToProj(selid);
	}

	@Override
	public List<InquiryDTO> selectByPrnum(int prnum) {
		return mapper.selectByPrnum(prnum);
	}

}
