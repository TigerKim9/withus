package com.withus.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.withus.spring.domain.FundedDAO;
import com.withus.spring.domain.FundedDTO;
import com.withus.spring.domain.LikesDAO;
import com.withus.spring.domain.LikesDTO;
import com.withus.spring.domain.ProjectFundingDTO;

@Service
public class FundedService {

	private FundedDAO dao;
	private LikesDAO lkDao;

	@Autowired
	public void setDao(FundedDAO dao, LikesDAO lkDao) {
		this.dao = dao;
		this.lkDao = lkDao;
	}

	public int fund(FundedDTO dto) {
		return dao.fund(dto);
	}
	
	public List<FundedDTO> myfundedlist(String useremail) {
		System.out.println("fundService 들어옴");
		return dao.myfundedlist(useremail);
	}
	
	public Integer likesCnt(int prnum) {
		return lkDao.likesCnt(prnum);
	}
	
	public int insertLike(LikesDTO dto) {
		return lkDao.insertLike(dto);
	}
	
	public int updateLike(LikesDTO dto) {
		return lkDao.updateLike(dto);
	}
	
	public int deleteLike(String useremail) {
		return lkDao.deleteLike(useremail);
	}
	
	public int chkLikeCnt(LikesDTO dto) {
		return lkDao.chkLikeCnt(dto);
	}
	
	public int getLikeCnt(LikesDTO dto) {
		return lkDao.getLikeCnt(dto);
	}
	
	//
	public List<String> myprnumlist(String useremail) {
		return dao.myprnumlist(useremail);
	}
	
	public Integer allFundedPrice() {
		return dao.allFundedPrice();
	}
	
	public List<ProjectFundingDTO> getcnt(String useremail) {
		return dao.getcnt(useremail);
	}

}
