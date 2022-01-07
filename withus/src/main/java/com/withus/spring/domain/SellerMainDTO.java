package com.withus.spring.domain;

import lombok.Data;

@Data
public class SellerMainDTO {
	private int prnum; //f_prnum
	private String fundingdate; //f_fundingdate
	private int itemprice; //pf_itemprice;
	private int sumprice;
	private int count;
	private String category;
	private int Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
}
