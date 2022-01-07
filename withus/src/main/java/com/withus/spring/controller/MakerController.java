package com.withus.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withus.spring.service.MakerService;

@Controller
@RequestMapping("/withus/maker")
public class MakerController {
	
	private MakerService makerService;
	
	@Autowired
	public void setMakerService(MakerService makerService) {
		this.makerService = makerService;
	}

}
