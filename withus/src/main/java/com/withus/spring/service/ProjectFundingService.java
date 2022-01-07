package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withus.spring.domain.MyproPageDTO;
import com.withus.spring.domain.NoticeDAO;
import com.withus.spring.domain.NoticeDTO;
import com.withus.spring.domain.ProjectFundingDAO;
import com.withus.spring.domain.ProjectFundingDTO;

@Service
public class ProjectFundingService {
	private ProjectFundingDAO dao;
	private NoticeDAO ntDao;

	@Autowired
	public void setDao(ProjectFundingDAO dao, NoticeDAO ntDao) {
		this.dao = dao;
		this.ntDao = ntDao;
	}

	public ProjectFundingService() { }

	public List<ProjectFundingDTO> list() {
		return dao.select();
	}

	// 사용자 글 읽기 (+ 조회수 증가)
	public List<ProjectFundingDTO> viewByPrnum(int prnum) {
		dao.incViewCnt(prnum);
		return dao.selectByPrnum(prnum);
	}
	
	// 판매자 글 읽기
	public List<ProjectFundingDTO> selectByPrnum(int prnum) {
		return dao.selectByPrnum(prnum);
	}

	public int sumFund(int prnum) {
		return dao.sumFund(prnum);
	}

	public String fundingdateByPrnum(int prnum) {
		return dao.fundingdateByPrnum(prnum);
	}

	public List<ProjectFundingDTO> fundedPrice(int prnum) {
		return dao.fundedPrice(prnum);
	}

	public int countsupport(int prnum) {
		return dao.countsupport(prnum);
	}

	public List<ProjectFundingDTO> selectCategory(String category) {
		return dao.selectCategory(category);
	}
	
	public List<NoticeDTO> noticeList(String category) {
		return ntDao.noticeList(category);
	}
	
	public List<NoticeDTO> selectByNum(int num) {
		return ntDao.selectByNum(num);
	}
	public Integer write_project(ProjectFundingDTO dto) {
		return dao.write_project(dto);
	}
	
	public int allProjects() {
		return dao.allProjects();
	}
	
	public int todayProjects() {
		return dao.todayProjects();
	}
	
	public List<ProjectFundingDTO> comingsoon() {
		return dao.comingsoon();
	}

	public List<ProjectFundingDTO> opening() {
		return dao.opening();
	}
	
	public List<ProjectFundingDTO> popularArticle() {
		// TODO Auto-generated method stub
		return dao.popularArticle();
	}
	public List<ProjectFundingDTO> viewcount() {
		// TODO Auto-generated method stub
		return dao.viewcount();
	}
	public List<ProjectFundingDTO> support() {
		// TODO Auto-generated method stub
		return dao.support();
	}
	
}
