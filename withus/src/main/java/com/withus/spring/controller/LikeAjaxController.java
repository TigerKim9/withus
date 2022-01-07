package com.withus.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withus.spring.domain.LikesDTO;
import com.withus.spring.service.FundedService;

@RestController
@RequestMapping("/**")
public class LikeAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeAjaxController.class);
	
	@Autowired
	FundedService fundedService;

	@PostMapping("/updateLike")
	public Map<String, String> updateLike(@RequestBody LikesDTO dto) throws Exception{
		logger.info("updateLike");
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			fundedService.updateLike(dto);
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
}
