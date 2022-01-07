package com.withus.spring.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserShpDTO {
	private int prnum; // 프로젝트번호
	private String num; // 배송번호
	private String addr; // 배송지
	private int check; // 배송확인
	private String useremail; // 구매자id
	private String content; // 요청사항


//	@Override
//	public String toString() {
//		return String.format("[UserShpDTO]\t%s : %s : %d : %s : %d : %s",
//				num, addr, check, useremail, prnum, content);
//	}
}
