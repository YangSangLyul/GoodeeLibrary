package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SeatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/reserveSeatForm", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("도서관 서비스 메뉴(좌석 예약) 진입");
		return "reserveSeatForm";
	}
}
