package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withus.spring.domain.UserDAO;
import com.withus.spring.domain.UserDTO;

@Service
public class UserService {

	@Autowired
	UserDAO dao;

	public UserService() {
		System.out.println("UserService() 생성");
	}

	// 회원 가입
	// ROLE_USER 권한 부여
	@Transactional
	public int addUser(UserDTO user) {
		int cnt = dao.addUser(user);
//		dao.addAuth(user.getEmail(), "ROLE_MEMBER");
		return cnt;
	}

	// 회원 삭제
	@Transactional
	public int deleteUser(UserDTO user) {
//		dao.deleteAuths(user.getEmail()); // 권한(들) 먼저 삭제
		int cnt = dao.deleteUser(user);
		return cnt;
	}
	
	// 판매자(Seller) 등록
	// ROLE_MEMBER 권한 부여
	@Transactional
	public int addSeller(String email) {
		int cnt = dao.addSeller(email);
		return cnt;
	}
	
	// 판매자(Seller) 등록 해제
	@Transactional
	public int deleteSeller(UserDTO user) {
		int cnt = dao.deleteSeller(user);
		return cnt;
	}

	// 특정 id(username) 의 정보 가져오기
	public UserDTO findById(String id) {
		return dao.findById(id);
	}

	// 특정 id 의 권한(들) 정보 가져오기
	public List<String> selectAuthoritiesById(String id) {
		return dao.selectAuthoritiesById(id);
	}
	
	public String duplicateEmail(String email) {
		return dao.duplicateEmail(email);
	}
	
	public UserDTO selectByEmail(String email) {
		return dao.selectByEmail(email);
	}
	
	public int updateProfile(UserDTO dto) {
		return dao.updateProfile(dto);
	}
	
	public int allUsers() {
		return dao.allUsers();
	}
	
	public int todayUsers() {
		return dao.todayUsers();
	}
	
	//펀딩하기 주소 확인
	public List<UserDTO> checkAddr(String userEmail) {
		return dao.checkAddr(userEmail);
	}
	
	public int insertAddr(String addr, String useremail) {
		return dao.insertAddr(addr, useremail);
	}
}