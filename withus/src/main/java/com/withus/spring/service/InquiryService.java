package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withus.spring.domain.InquiryDAO;
import com.withus.spring.domain.InquiryDTO;

@Service
public class InquiryService {

	private InquiryDAO dao;

	@Autowired
	public void setDao(InquiryDAO dao) {
		this.dao = dao;
	}

	public int writeQuiry(InquiryDTO dto) {
		return dao.writeQuiry(dto);
	}

	public List<InquiryDTO> selectQuiryAll(String useremail) {
		return dao.selectQuiryAll(useremail);
	}

	public List<InquiryDTO> selectBynum(int num) {
		return dao.selectBynum(num);
	}

	public List<InquiryDTO> selectLastNum() {
		return dao.selectLastNum();
	}
	
	public List<InquiryDTO> selectInquiryToProj(String selid) {
		return dao.selectInquiryToProj(selid);
	}
	
	public List<InquiryDTO> selectByPrnum(int prnum) {
		return dao.selectByPrnum(prnum);
	}

}
