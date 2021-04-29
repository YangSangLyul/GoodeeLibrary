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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/noticea", method = RequestMethod.GET)
	public ModelAndView noticea(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice");
		return mav;
	}
	
	
	@RequestMapping(value = "/notice/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> notice(@PathVariable int page ,@RequestParam HashMap<String, Object> params) {
		int pagePerCnt = 10;
		logger.info(""+page);
		logger.info(""+params);
		return service.list_infoNotice(pagePerCnt, page, params);
	}
	
	@RequestMapping(value = "/noticeDetail/{idx}", method = RequestMethod.GET)
	public String noticeDetail(Model model , @PathVariable String idx) {
		logger.info(idx);
		
		service.detail_infoNotice(model,idx);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String noticeFAQ(Model model) {
		
		service.faq_infoNotice(model);
		return "FAQ";
	}
	
	

	
}
