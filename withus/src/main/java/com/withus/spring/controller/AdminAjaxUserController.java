package com.withus.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withus.spring.domain.AjaxUserList;
import com.withus.spring.domain.AjaxUserResult;
import com.withus.spring.domain.UserDTO;
import com.withus.spring.service.AdminService;

@RestController
@RequestMapping("/admin")
public class AdminAjaxUserController {
	
	@Autowired
	AdminService ajaxService;
	
	@GetMapping("/{page}/{pageRows}")	// URI : /withus/admin/managingUser/{page}/{pagwRows}
	public AjaxUserList list(@PathVariable int page, @PathVariable int pageRows) {
		List<UserDTO> list = null;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		int userPages = 30;
		int totalPage = 0;
		int totalCnt = 0;
		
		try {
			totalCnt = ajaxService.count();
			totalPage = (int) Math.ceil(totalCnt / (double) pageRows);
			int from = (page - 1) * pageRows;
			
			list = ajaxService.list(from, pageRows);
			
			if (list == null) {
				message.append("[리스트할 데이터가 없습니다.]");
			}
			else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러 : " + e.getMessage() + "]");
		}
		
		AjaxUserList result = new AjaxUserList();
		
		result.setStatus(status);
		result.setMessage(message.toString());
		
		if (list != null) {
			result.setCount(list.size());
			result.setList(list);
		}

		result.setPage(page);
		result.setTotalPage(totalPage);
		result.setUserPages(userPages);
		result.setPageRows(pageRows);
		result.setTotalCnt(totalCnt);
		
		return result;
	}

	// 특정 uid 글 읽기
	@GetMapping("/{aiid}") // URI : /board/{uid}
	public AjaxUserList view(@PathVariable int aiid) {
		List<UserDTO> list = null;

		// message
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			list = ajaxService.selectByAiid(aiid);

			if (list == null || list.size() == 0) {
				message.append("[해당 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}

		AjaxUserList result = new AjaxUserList();

		result.setStatus(status);
		result.setMessage(message.toString());

		if (list != null) {
			result.setCount(list.size());
			result.setList(list);
		}

		return result;
	}
	
	// 글 수정
	@PutMapping("") // URI : /board
	public AjaxUserResult updateOk(UserDTO dto) { // validation 생략
		int count = 0;

		// message
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			count = ajaxService.updateUser(dto);
			if (count == 0) {
				message.append("[트랜잭션 실패 : 0 update]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}

		AjaxUserResult result = new AjaxUserResult();
		result.setStatus(status);
		result.setMessage(message.toString());
		result.setCount(count);
		return result;
	}

	// 글 삭제
	@DeleteMapping("") // URI : /board
	public AjaxUserResult deleteOk(int[] aiid) {
		int count = 0;

		// message
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {

			if (aiid != null) {
				count = ajaxService.deleteByAiid(aiid);
				status = "OK";
			}

		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}

		AjaxUserResult result = new AjaxUserResult();
		result.setStatus(status);
		result.setMessage(message.toString());
		result.setCount(count);
		return result;
	}
}
