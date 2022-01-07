package com.withus.spring.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ProjectFundingDTO {

	private int prnum;
	private String selid;
	private String title;
	private String content;
	private int viewcnt;
	private int itemprice;
	private int price;
	private String category;
	private String filePath;
	private String regDate;
	private String startDate;
	private String endDate;
	private String newctn;
	private int popular; //인기글

}
