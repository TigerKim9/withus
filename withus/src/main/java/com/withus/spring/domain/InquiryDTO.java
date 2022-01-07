package com.withus.spring.domain;

import lombok.Data;

@Data
public class InquiryDTO {
	private int num; //in_num
	private int prnum; //in_prnum
	private String title; //in_title
	private String content; //in_content
	private String regdate; //in_regdate
	private String useremail; //in_useremail
}
