package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.main.dto.LibraryInfoDTO;
import com.spring.main.service.LibraryInfoService;

@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibraryInfoService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		service.mainNoticeCall(model);
		LibraryInfoDTO dto = service.noticePopup();
		logger.info("메인 진입");
		model.addAttribute("pop", dto);
		return "main";
	}
}
