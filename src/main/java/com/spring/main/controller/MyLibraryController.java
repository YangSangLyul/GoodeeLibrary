package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MyLibraryController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("나의 문의 페이지");
		return "myLib_question";
	}
	
	@RequestMapping(value = "/question_detail", method = RequestMethod.GET)
	public String question_detail(Model model) {
		logger.info("나의 문의 상세페이지");
		return "myLib_question_detail";
	}
}
