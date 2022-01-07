package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	private NoticeDAO mapper;
	
	@Autowired
	public NoticeDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(NoticeDAO.class);
	}

	@Override
	public List<NoticeDTO> noticeList(String category) {
		return mapper.noticeList(category);
	}

	@Override
	public List<NoticeDTO> selectByNum(int num) {
		return mapper.selectByNum(num);
	}

	@Override
	public int noticeInsert(NoticeDTO dto) {
		return mapper.noticeInsert(dto);
	}

	@Override
	public int noticeUpdate(NoticeDTO dto) {
		return mapper.noticeUpdate(dto);
	}

	@Override
	public int deleteByNum(int num) {
		return mapper.deleteByNum(num);
	}

	@Override
	public List<NoticeDTO> adminNtList() {
		return mapper.adminNtList();
	}

}
