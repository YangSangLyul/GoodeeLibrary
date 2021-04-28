package com.spring.main.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.LibraryInfoService;

@Controller
public class LibraryInfoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibraryInfoService service;
	
	@RequestMapping(value = "/LibraryInfo", method = RequestMethod.GET)
	public ModelAndView index() {
		// 길찾기 로 이동한다 .. 라이브러리 인포의 기본 위치 (길찾기는 java에서 할게 없다.)
		ModelAndView mav = new ModelAndView();
		mav.setViewName("wayFind");
		return mav;
	}

	 @RequestMapping(value = "/noticeA", method = RequestMethod.GET) public
	 ModelAndView notice(){ // 길찾기 로 이동한다 .. 라이브러리 인포의 기본 위치 (길찾기는 java에서 할게 없다.)
	 ModelAndView mav = new ModelAndView(); 
	 mav.setViewName("notice"); 
	 return mav;
	 }
	
	
		
    @RequestMapping(value = "/notice/{page}", method =RequestMethod.GET )  
    public @ResponseBody HashMap<String, Object> noticepage(@PathVariable int page,@RequestParam HashMap<String, Object> params) {
		  int pagePerCnt =10;
		  logger.info(""+pagePerCnt+page);
		  logger.info(""+params);
		  
		  return service.list_infoNotice(pagePerCnt,page,params); 
		  
    }
		
	
	@RequestMapping(value = "/noticeDetail/{idx}", method = RequestMethod.GET)
	public ModelAndView noticeDetail(@PathVariable String idx) {
		logger.info(idx);

		return service.detail_infoNotice(idx);
	}
	
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeSearch(@RequestParam HashMap<String, Object> params) {
			
		logger.info("이거 파람 "+params);

		
		return service.noticeSearch(params);
	}
	
	/*
	 * @RequestMapping(value = "/FAQ", method = RequestMethod.GET) public
	 * ModelAndView noticeFAQ() { logger.info(idx);
	 * 
	 * return service.detail_infoNotice(idx); }
	 */
	
	
}
