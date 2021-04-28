package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.LibraryInfoService;

@Controller
public class LibraryInfoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibraryInfoService service;
	
	@RequestMapping(value = "/LibraryInfo", method = RequestMethod.GET)
	public String Linfo(Model model) {
		// 길찾기 로 이동한다 .. 라이브러리 인포의 기본 위치 (길찾기는 java에서 할게 없다.)		
		return "wayFind";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		service.list_infoNotice(model);
		
		return "notice";
	}
	
	@RequestMapping(value = "/noticeDetail/{idx}", method = RequestMethod.GET)
	public String noticeDetail(Model model , @PathVariable String idx) {
		logger.info(idx);
		
		service.detail_infoNotice(model,idx);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value = "/noticeSearch", method = RequestMethod.GET)
	public ModelAndView noticeSearch(@RequestParam HashMap<String, Object> params) {
		logger.info("검색조건 파람 으로 받기"+params);
		
		return service.noticeSearch(params);
	}
	
}
