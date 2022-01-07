package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	private UserDAO mapper;

	@Autowired
	public UserDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(UserDAO.class);
	}

	@Override
	public int addUser(UserDTO user) {
		return mapper.addUser(user);
	}

	@Override
	public int deleteUser(UserDTO user) {
		return mapper.deleteUser(user);
	}

	@Override
	public int addSeller(String email) {
		return mapper.addSeller(email);
	}

	@Override
	public int deleteSeller(UserDTO user) {
		return mapper.deleteSeller(user);
	}

	@Override
	public UserDTO findById(String id) {
		return mapper.findById(id);
	}

	@Override
	public List<String> selectAuthoritiesById(String id) {
		return mapper.selectAuthoritiesById(id);
	}

	@Override
	public UserDTO findByEmail(String email) {
		return mapper.findByEmail(email);
	}
	
	@Override
	public int allUsers() {
		return mapper.allUsers();
	}

	@Override
	public int todayUsers() {
		return mapper.todayUsers();
	}

	// admin page에서 이용
	@Override
	public List<UserDTO> select() {
		return mapper.select();
	}

	@Override
	public List<UserDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public List<UserDTO> selectByAiid(int aiid) {
		return mapper.selectByAiid(aiid);
	}

	@Override
	public int updateUser(UserDTO dto) {
		return mapper.updateUser(dto);
	}

	@Override
	public int deleteByAiid(int[] aiids) {
		return mapper.deleteByAiid(aiids);
	}

	@Override
	public String duplicateEmail(String email) {
		System.out.println("DAO 듀플 : " + mapper.duplicateEmail(email));
		return mapper.duplicateEmail(email);
	}

	@Override
	public UserDTO selectByEmail(String email) {
		return mapper.selectByEmail(email);
	}

	@Override
	public int updateProfile(UserDTO dto) {
		return mapper.updateProfile(dto);
	}


	@Override
	public List<UserDTO> checkAddr(String userEmail) {
		return mapper.checkAddr(userEmail);
	}

	@Override
	public int insertAddr(String addr, String useremail) {
		return mapper.insertAddr(addr, useremail);
	}

}
