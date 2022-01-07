package com.withus.spring.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AjaxUserList extends AjaxUserResult {
	@JsonProperty("data")
	List<UserDTO> list;	// 데이터 목록
	
	int page;	//현재 페이지
	
	@JsonProperty("totalpage")
	int totalPage;
	
	@JsonProperty("totalcnt")
	int totalCnt;
	
	@JsonProperty("userpages")
	int userPages;
	
	@JsonProperty("pagerows")
	int pageRows;
}
