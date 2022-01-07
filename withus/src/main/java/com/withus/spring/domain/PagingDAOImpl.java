package com.withus.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PagingDAOImpl implements PagingDAO {
	
	private PagingDAO pgdao;
	
	@Autowired
	public PagingDAOImpl(SqlSession sqlSession) {
		System.out.println("PagingDAOImpl생성");
		pgdao = sqlSession.getMapper(PagingDAO.class);
	}

	@Override
	public int countBoard(String selid) {
		return pgdao.countBoard(selid);
	}

	@Override
	public List<ProjectFundingDTO> selectBoard(String selid, int start,int cntPage) {
		return pgdao.selectBoard(selid,start,cntPage);
	}

	@Override
	public int cuserevent(String event) {
		return pgdao.cuserevent(event);
	}

	@Override
	public int cusernotice(String notice) {
		return pgdao.cusernotice(notice);
	}

	@Override
	public List<NoticeDTO> userNotice(String notice, int start, int cntPage) {
		return pgdao.userNotice(notice, start, cntPage);
	}

	@Override
	public List<NoticeDTO> userEvent(String event, int start, int cntPage) {
		return pgdao.userEvent(event, start, cntPage);
	}

	@Override
	public int countnotice() {
		return pgdao.countnotice();
	}

	@Override
	public List<NoticeDTO> selectNotice(int start, int cntPage) {
		return pgdao.selectNotice(start, cntPage);
	}

	@Override
	public int countMfl(int prnum) {
		return pgdao.countMfl(prnum);
	}

	@Override
	public List<FundedDTO> selectMfl(String useremail, int start, int cntPage) {
		return pgdao.selectMfl(useremail, start, cntPage);
	}

	@Override
	public int countInquiry(String useremail) {
		return pgdao.countInquiry(useremail);
	}

	@Override
	public List<InquiryDTO> selectInquiry(String useremail, int start, int cntPage) {
		return pgdao.selectInquiry(useremail, start, cntPage);
	}

	@Override
	public int adntcount() {
		return pgdao.adntcount();
	}

	@Override
	public List<NoticeDTO> ntcList(int start, int cntPage) {
		return pgdao.ntcList(start, cntPage);
	}

	@Override
	public int adAllProj() {
		return pgdao.adAllProj();
	}

	@Override
	public List<ProjectFundingDTO> adProjList(int start, int cntPage) {
		return pgdao.adProjList(start, cntPage);
	}

	
	

	


	

	
	

}
