package com.withus.spring.domain;

import java.util.List;

public interface NoticeDAO {

	// list select
	public abstract List<NoticeDTO> noticeList(String category);
	
	// 특정 글 select
	public abstract List<NoticeDTO> selectByNum(int num);
	
	// 글 작성 insert
	public abstract int noticeInsert(NoticeDTO dto); 
	
	// 글 수정 update 
	public abstract int noticeUpdate(NoticeDTO dto);
	
	// 글 삭제 delete
	public abstract int deleteByNum(int num);
	
	// admin list select
	public abstract List<NoticeDTO> adminNtList();
}
