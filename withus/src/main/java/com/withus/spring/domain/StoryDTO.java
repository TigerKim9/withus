package com.withus.spring.domain;

import java.time.LocalDateTime;

public class StoryDTO {
	private int wr_uid;
	private String wr_title;
	private String wr_content;
	private int wr_viewcnt;
	private LocalDateTime wr_regdate;
	private String wr_prnum;
	
	public StoryDTO() {
		super();
		System.out.println("storyDTO() 호출");
	}
	
	public StoryDTO(int wr_uid, String wr_title, String wr_content, int wr_viewcnt, LocalDateTime wr_regdate,
			String wr_prnum) {
		super();
		this.wr_uid = wr_uid;
		this.wr_title = wr_title;
		this.wr_content = wr_content;
		this.wr_viewcnt = wr_viewcnt;
		this.wr_regdate = wr_regdate;
		this.wr_prnum = wr_prnum;
	}

	public int getWr_uid() {
		return wr_uid;
	}
	public void setWr_uid(int wr_uid) {
		this.wr_uid = wr_uid;
	}
	public String getWr_title() {
		return wr_title;
	}
	public void setWr_title(String wr_title) {
		this.wr_title = wr_title;
	}
	public String getWr_content() {
		return wr_content;
	}
	public void setWr_content(String wr_content) {
		this.wr_content = wr_content;
	}
	public int getWr_viewcnt() {
		return wr_viewcnt;
	}
	public void setWr_viewcnt(int wr_viewcnt) {
		this.wr_viewcnt = wr_viewcnt;
	}
	public LocalDateTime getWr_regdate() {
		return wr_regdate;
	}
	public void setWr_regdate(LocalDateTime wr_regdate) {
		this.wr_regdate = wr_regdate;
	}
	public String getWr_prnum() {
		return wr_prnum;
	}
	public void setWr_prnum(String wr_prnum) {
		this.wr_prnum = wr_prnum;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "title = " + wr_title + " content = " + wr_content + " prnum = "+ wr_prnum;
	}
	
}
