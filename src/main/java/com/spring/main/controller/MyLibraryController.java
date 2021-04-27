package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.QuestionDTO;
import com.spring.main.service.MyLibraryService;

@Controller
public class MyLibraryController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyLibraryService service;
	
	/*
	 * @RequestMapping(value = "/MyLibrary", method = RequestMethod.GET) public
	 * String home(Model model) { logger.info("나의 문의 페이지");
	 * 
	 * return "myLib_question"; }
	 */
	
	@RequestMapping(value = "/MyLibrary", method = RequestMethod.GET)
	public ModelAndView question() {
		logger.info("나의 문의 페이지");
		return service.question_list();
	}
	
	@RequestMapping(value = "/question_detail")
	public ModelAndView question_detail(@RequestParam String idx) {
		logger.info("나의 문의 상세페이지");
		return service.question_detail(idx);
	}
	
	@RequestMapping(value = "/question_edit", method = RequestMethod.POST)
	public ModelAndView question_edit(@RequestParam QuestionDTO dto) {
		logger.info("나의 문의 상세페이지 수정");
		logger.info(dto.getQueidx()+"/"+dto.getSubject()+"/"+dto.getContent()+"/"+dto.getType());
		
		return service.question_edit(dto);
	}

	@RequestMapping(value = "/question_delete", method = RequestMethod.POST)
	public ModelAndView question_delete(@RequestParam String idx) {
		logger.info("나의 문의내역 삭제");
		logger.info("삭제할 문의번호"+idx);
		
		return service.question_delete(idx);
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String uploadForm(Model model) {
		logger.info("파일 업로드 페이지로 이동");
		return "uploadForm";
	}
	

}
