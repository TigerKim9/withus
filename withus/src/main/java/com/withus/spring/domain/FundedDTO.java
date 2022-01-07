package com.withus.spring.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class FundedDTO {
	private int prnum; //f_prnum
	private String useremail;//f_useremail
	private String fundingdate;//f_fundingdate
	
}	