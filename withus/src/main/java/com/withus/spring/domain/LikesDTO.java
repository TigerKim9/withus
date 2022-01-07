package com.withus.spring.domain;

import lombok.Data;

@Data
public class LikesDTO {

	private int prnum;	// lk_prnum
	private String userEmail;	// lk_useremail
	private int likeCnt;	// lk_likecnt
	private int count;
}
