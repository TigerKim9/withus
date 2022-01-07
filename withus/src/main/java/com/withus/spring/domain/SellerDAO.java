package com.withus.spring.domain;

import java.util.List;

public interface SellerDAO {
	
	public abstract int regSeller(SellerDTO dto);
	
	public abstract String existEmail(String useremail);
	
	// Seller 자신의 프로젝트가 있는지 확인 (없으면 null)
	public abstract Integer cntMyProj(String selid);
	
	// 프로젝트 전체 리스트 불러오기
	public abstract List<ProjectFundingDTO> myProjList(String selid);
	
	// 특정 프로젝트 쓰기
	public abstract Integer write_project(ProjectFundingDTO dto);
	
	// 특정 프로젝트 수정
	public abstract int updateProject(ProjectFundingDTO dto);
	
	// 특정 프로젝트 삭제
	public abstract int deleteByPrnum(int prnum);
	
	// 페이징

}
