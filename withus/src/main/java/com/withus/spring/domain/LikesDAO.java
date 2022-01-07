package com.withus.spring.domain;

public interface LikesDAO {
	
	// 프로젝트의 좋아요 개수 가져오기
	public abstract Integer likesCnt(int prnum);
	
	// 특정 user의 좋아요 여부 select
	public abstract int chkLikeCnt(LikesDTO dto);
	
	// likeCnt 값 가져오기
	public abstract int getLikeCnt(LikesDTO dto);
	
	// 펀딩하기 프로젝트 상세보기에 들어가는 경우 데이터 생성
	public abstract int insertLike(LikesDTO dto);
	
	// 좋아요 toggle
	public abstract int updateLike(LikesDTO dto);
	
	// user 회원탈퇴 시
	public abstract int deleteLike(String useremail);

}
