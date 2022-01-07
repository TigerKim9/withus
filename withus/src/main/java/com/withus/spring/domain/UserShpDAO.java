package com.withus.spring.domain;

import java.util.List;

import org.springframework.data.repository.query.Param;


public interface UserShpDAO {
	
	
	// 배송 목록 글 읽어오기 
	public abstract List<UserShpDTO> selectByShp();

	// 배송 수정
	public abstract int updateShp(UserShpDTO dvud); 
	
	// 배송 작성
	public abstract int writeShp(UserShpDTO dv_prnum);
	
	// 전체 배송 글 개수
	public abstract int countshp();
	
	// 배송dvnum
	public abstract UserShpDTO dvnumByShp(String prnum);
	
}
