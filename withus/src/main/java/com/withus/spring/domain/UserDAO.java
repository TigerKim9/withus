package com.withus.spring.domain;

import java.util.List;

import org.springframework.data.repository.query.Param;

public interface UserDAO {

	//이메일 중복여부를 위한 
	String duplicateEmail(String email);
	
	//프로필 관리용
	UserDTO selectByEmail(String email);
	
	int updateProfile(UserDTO dto);
	
	// 사용자 추가
	int addUser(UserDTO user);

	// 사용자 삭제
	int deleteUser(UserDTO user);

	// 판매자 등록
	int addSeller(String email);

	// 판매자 등록 해제
	int deleteSeller(UserDTO user);

	// 특정 id (username) 의 사용자 찾기
	UserDTO findById(String id);

	// 특정 id (username) 의 권한(들) 뽑기
	List<String> selectAuthoritiesById(String id);

	// 특정 email의 사용자 찾기
	UserDTO findByEmail(String email);

	// admin 이용 // --> 모든 사용자 정보 불러오기
	public abstract List<UserDTO> select();
	
	// 전체 사용자 수
	public abstract int allUsers();
	
	// 오늘 가입한 사용자 수
	public abstract int todayUsers();

	/********** REST API 사용 **********/
	// 페이징용 SELECT
	// from : 몇 번째 row 부터 ~ pageRows : 몇 개의 데이터
	public List<UserDTO> selectFromRow(@Param("from") int from, @Param("pageRows") int pageRows);

	// 전체 글 개수
	public int countAll();

	// 특정 user 정보 읽어오기
	public List<UserDTO> selectByAiid(int aiid);

	// 특정 user 정보 수정
	public int updateUser(UserDTO dto);

	// 특정 user 정보(들) 삭제
	public int deleteByAiid(int[] aiids);

	public List<UserDTO> checkAddr(String userEmail);
	
	public int insertAddr(String addr, String useremail);
}