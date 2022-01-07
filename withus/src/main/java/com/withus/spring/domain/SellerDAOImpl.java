package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAOImpl implements SellerDAO {

	private SellerDAO mapper;
	
	@Autowired
	public SellerDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(SellerDAO.class);
	}

	@Override
	public int regSeller(SellerDTO dto) {
		return mapper.regSeller(dto);
	}

	@Override
	public String existEmail(String useremail) {
		if (mapper.existEmail(useremail) != null) {
			return mapper.existEmail(useremail);
		} else {
			return null;
		}
	}

	@Override
	public Integer cntMyProj(String selid) {
		return mapper.cntMyProj(selid);
	}

	@Override
	public List<ProjectFundingDTO> myProjList(String selid) {
		return mapper.myProjList(selid);
	}

	@Override
	public Integer write_project(ProjectFundingDTO dto) {
		return mapper.write_project(dto);
	}

	@Override
	public int updateProject(ProjectFundingDTO dto) {
		return mapper.updateProject(dto);
	}

	@Override
	public int deleteByPrnum(int prnum) {
		return mapper.deleteByPrnum(prnum);
	}

}
