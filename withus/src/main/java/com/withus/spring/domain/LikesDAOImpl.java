package com.withus.spring.domain;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikesDAOImpl implements LikesDAO {
	
	private LikesDAO mapper;
	
	@Autowired
	public LikesDAOImpl(SqlSession sqlSession) {
		this.mapper = sqlSession.getMapper(LikesDAO.class);
	}

	@Override
	public Integer likesCnt(int prnum) {
		return mapper.likesCnt(prnum);
	}

	@Override
	public int insertLike(LikesDTO dto) {
		return mapper.insertLike(dto);
	}

	@Override
	public int updateLike(LikesDTO dto) {
		return mapper.updateLike(dto);
	}

	@Override
	public int deleteLike(String useremail) {
		return mapper.deleteLike(useremail);
	}

	@Override
	public int chkLikeCnt(LikesDTO dto) {
		return mapper.chkLikeCnt(dto);
	}

	@Override
	public int getLikeCnt(LikesDTO dto) {
		return mapper.getLikeCnt(dto);
	}

}
