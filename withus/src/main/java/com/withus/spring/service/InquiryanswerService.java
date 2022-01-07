package com.withus.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withus.spring.domain.InquiryanswerDAO;
import com.withus.spring.domain.InquiryanswerDTO;

@Service
public class InquiryanswerService {

	private InquiryanswerDAO dao;

	@Autowired
	public void setDao(InquiryanswerDAO dao) {
		this.dao = dao;
	}

	public int inquiryAnswer(InquiryanswerDTO dto) {
		return dao.inquiryAnswer(dto);
	}

	public List<InquiryanswerDTO> showAnswer(int innum) {
		List<InquiryanswerDTO> showAnswer = dao.showAnswer(innum);
		return showAnswer;
	}
}
