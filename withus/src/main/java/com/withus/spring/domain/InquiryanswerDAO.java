package com.withus.spring.domain;

import java.util.List;

public interface InquiryanswerDAO {
	public int inquiryAnswer(InquiryanswerDTO dto);
	
	public List<InquiryanswerDTO> showAnswer(int innum);
}
