package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectFundingDAOImpl implements ProjectFundingDAO {

	private ProjectFundingDAO mapper;

	@Autowired
	public ProjectFundingDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(ProjectFundingDAO.class);
	}

	@Override
	public List<ProjectFundingDTO> select() {
		return mapper.select();
	}

	@Override
	public List<ProjectFundingDTO> selectByPrnum(int prnum) {
		return mapper.selectByPrnum(prnum);
	}

	@Override
	public int sumFund(int prnum) {
		return mapper.sumFund(prnum);
	}

	@Override
	public String fundingdateByPrnum(int prnum) {
		return mapper.fundingdateByPrnum(prnum);
	}

	@Override
	public int incViewCnt(int prnum) {
		return mapper.incViewCnt(prnum);
	}

	@Override
	public List<ProjectFundingDTO> fundedPrice(int prnum) {
		return mapper.fundedPrice(prnum);
	}

	@Override
	public int countsupport(int prnum) {
		return mapper.countsupport(prnum);
	}

	@Override
	public List<ProjectFundingDTO> selectCategory(String category) {
		return mapper.selectCategory(category);
	}

	@Override
	public int write_project(ProjectFundingDTO dto) {
		return mapper.write_project(dto);
	}

	@Override
	public int allProjects() {
		return mapper.allProjects();
	}

	@Override
	public int todayProjects() {
		return mapper.todayProjects();
	}

	@Override
	public List<ProjectFundingDTO> comingsoon() {
		return mapper.comingsoon();
	}

	@Override
	public List<ProjectFundingDTO> opening() {
		return mapper.opening();
	}


	@Override
	public List<ProjectFundingDTO> popularArticle() {
		// TODO Auto-generated method stub
		return mapper.popularArticle();
	}
	@Override
	public List<ProjectFundingDTO> viewcount() {
		// TODO Auto-generated method stub
		return mapper.viewcount();
	}

	@Override
	public List<ProjectFundingDTO> support() {
		// TODO Auto-generated method stub
		return mapper.support();
	}

}
