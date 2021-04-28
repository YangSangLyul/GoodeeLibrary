package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.QuestionDTO;
import com.spring.main.service.MyLibraryService;

//@Controller
@RestController
public class MyLibraryController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyLibraryService service;
	
	
	
	  @RequestMapping(value = "/MyLibrary")
	  public ModelAndView MyLibrary() { 
		  logger.info("나의 문의이동"); 
		  ModelAndView mav = new ModelAndView(); 
		  mav.setViewName("myLib_question"); 
		  return mav; 
	  }
	 
	/*
	  @RequestMapping(value = "/MyLibrary")
	  public ModelAndView question_list() {
		  logger.info("나의 문의 페이지1"); 
		  return service.question_list(); 
		  }*/
	 
	

	  @RequestMapping(value = "/myLib_question/5/{page}", method = RequestMethod.GET)
	  public HashMap<String,Object> question_list( 
			  @PathVariable int page) { 
		  logger.info("나의 문의 페이지2");
		  logger.info(" page : {}",  page);
	  
	  return service.page_list(page); 
	  }
	 
	
	@RequestMapping(value = "/question_detail")
	public ModelAndView question_detail(@RequestParam String idx) {
	//public HashMap<String, Object> question_detail(@RequestParam String idx) {	
		
		logger.info("나의 문의 상세페이지");
		return service.question_detail(idx);
	}
	
	@RequestMapping(value = "/question_edit")
	public ModelAndView question_edit(@RequestParam QuestionDTO dto) {
		logger.info("나의 문의 상세페이지 수정");
		logger.info(dto.getQueidx()+"/"+dto.getSubject()+"/"+dto.getContent()+"/"+dto.getType());
		
		return service.question_edit(dto);
	}

	@RequestMapping(value = "/question_delete")
	public ModelAndView question_delete(@RequestParam String idx) {
		logger.info("나의 문의내역 삭제");
		logger.info("삭제할 문의번호"+idx);
		
		return service.question_delete(idx);
	}
	
	/*
	@RequestMapping(value = "/question_write")
	public ModelAndView question_write(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("문의 작성하기");
		return service.question_write(params,session);
	}
	
	@RequestMapping(value = "/questionWrite", method = RequestMethod.GET)
	public String writeForm(HttpSession session) {
		logger.info("글쓰기 페이지로 이동");
		//업로드 할 파일 이름을 저장한 HashMap 을 생성해서 session 에 저장
		HashMap<String,String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return "questionWrite";
	}
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm(Model model) {
		logger.info("파일 업로드 페이지로 이동");
		return "uploadForm";
	}
	
	@RequestMapping(value = "/file_upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		logger.info("파일 업로드 요청");
		return service.file_upload(file,session);
	}
	*/
}
