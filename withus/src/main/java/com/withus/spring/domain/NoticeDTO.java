package com.withus.spring.domain;

import lombok.Data;

@Data
public class NoticeDTO {

	private int num;	// nt_num
	private String title;	// nt_title
	private String content;	// nt_content
	private String regDate;	// nt_regdate
	private String userEmail;	// nt_useremail
	private String category;	// nt_category
}
