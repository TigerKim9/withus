package com.withus.spring.domain;

import java.util.List;

public interface ProjectFundingDAO {
	
	// 전체 list SELECT
	public abstract List<ProjectFundingDTO> select();
	
	// 특정 prnum 글 내용 읽기,
	public abstract List<ProjectFundingDTO> selectByPrnum(int prnum);
	
	// 특정 prnum 남은 기간
	public abstract int sumFund(int prnum);
	
	// 특정 prnum 글 조회수 증가
	public abstract int incViewCnt(int prnum);

	public abstract String fundingdateByPrnum(int prnum); 
	
	public List<ProjectFundingDTO> fundedPrice(int prnum);
	
	public int countsupport(int prnum);
	
	public List<ProjectFundingDTO> selectCategory(String category);
	
	
	public abstract int write_project(ProjectFundingDTO dto);
	
	// 전체 프로젝트 개수
	public abstract int allProjects();
	
	// 오늘 생성된 프로젝트 개수
	public abstract int todayProjects();
	
	//오픈예정 프로젝트
	public List<ProjectFundingDTO> comingsoon();
	//오픈한 프로젝트
	public List<ProjectFundingDTO> opening();
	
	
	//인기글 
	public abstract List<ProjectFundingDTO> popularArticle();
	//조회수 많은 글
	public abstract List<ProjectFundingDTO> viewcount();
	//서포터 많은 글
	public abstract List<ProjectFundingDTO> support();
	
}
