package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserShpDAOImpl implements UserShpDAO {

	private UserShpDAO mapper;

	@Autowired
	public UserShpDAOImpl(SqlSession sqlSession) {
		System.out.println("UserShpDAOImpl() 생성");
		mapper = sqlSession.getMapper(UserShpDAO.class);
	}
	


	@Override
	public List<UserShpDTO> selectByShp() {
		return mapper.selectByShp();
	}


	@Override
	public int countshp() {
		return mapper.countshp();
	}




	@Override
	public int updateShp(UserShpDTO dvud) {
		return mapper.updateShp(dvud);
	}




	@Override
	public int writeShp(UserShpDTO dv_prnum) {
		return mapper.writeShp(dv_prnum);
	}


	@Override
	public UserShpDTO dvnumByShp(String prnum) {
		return mapper.dvnumByShp(prnum);
	}

	
	
	

}
