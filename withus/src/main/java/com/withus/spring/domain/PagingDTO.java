package com.withus.spring.domain;

import lombok.Data;

@Data
public class PagingDTO {
	
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
	
	public PagingDTO() {
		
	}
	
	public PagingDTO(int total,int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// DB 쿼리에서 사용할 시작,끝 값 계산
	private void calcStartEnd(int nowPage, int cntPerPage) {
		//        nowPage  | cntPerPage  | start | end 
		// p1 :      1           5    =>    1      5
		// p2 :      2           5    =>   6      10
		// p3 :      3           5    =>   11     15
		
		
		setEnd(nowPage * cntPerPage);
//		setEnd(cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
//		System.out.println("start"+start+"end"+end);
	}
	
	// 시작, 끝 페이지 계산
	private void calcStartEndPage(int nowPage, int cntPage) {
		
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
		
	}
	
	// 마지막 페이지 계산
	private void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
//	@Override
//	public String toString() {
//		return "MyproPageDTO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
//				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
//				+ ", cntPage=" + cntPage + "]";
//	}
	

}
