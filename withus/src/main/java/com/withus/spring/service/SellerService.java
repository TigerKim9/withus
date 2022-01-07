package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withus.spring.domain.ProjectFundingDAO;
import com.withus.spring.domain.ProjectFundingDTO;
import com.withus.spring.domain.SellerDAO;
import com.withus.spring.domain.SellerDTO;

@Service
public class SellerService {

	SellerDAO dao;
	ProjectFundingDAO projDao;

	@Autowired
	public void setDao(SellerDAO dao, ProjectFundingDAO projDao) {
		this.dao = dao;
		this.projDao = projDao;
	}
	
	public SellerService() {}
	
	public int regSeller(SellerDTO seller) {
		return dao.regSeller(seller);
	}
	
	public String existEmail(String useremail) {
		return dao.existEmail(useremail);
	}
	
	public Integer cntMyProj(String selid) {
		return dao.cntMyProj(selid);
	}
	
	public List<ProjectFundingDTO> myProjList(String selid) {
		return dao.myProjList(selid);
	}
	
	public List<ProjectFundingDTO> viewMyProj(int prnum) {
		return projDao.selectByPrnum(prnum);
	}
	
	public Integer write_project(ProjectFundingDTO dto) {
		return dao.write_project(dto);
	}
	
	public int updateProject(ProjectFundingDTO dto) {
		return dao.updateProject(dto);
	}
	
	public int deleteByPrnum(int prnum) {
		return dao.deleteByPrnum(prnum);
	}
}
