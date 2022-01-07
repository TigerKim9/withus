package com.withus.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeliveryDTO {
	private String dv_num; // 배송번호
	private String dv_addr; // 배송지
	private int dv_check; // 배송확인
	private String dv_userid; // 구매자id
	private String dv_prnum; // 프로젝트번호
	private String dv_content; // 요청사항

	public DeliveryDTO() {
		super();
	}

	public DeliveryDTO(String dv_num, String dv_addr, int dv_check, String dv_userid, String dv_prnum,
			String dv_content) {
		super();
		this.dv_num = dv_num;
		this.dv_addr = dv_addr;
		this.dv_check = dv_check;
		this.dv_userid = dv_userid;
		this.dv_prnum = dv_prnum;
		this.dv_content = dv_content;
	}

	@Override
	public String toString() {
		return String.format("[DeliveryDTO]\t%s : %s : %d : %s : %s : %s",
				dv_num, dv_addr, dv_check, dv_userid, dv_prnum, dv_content);
	}
}
