package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
			  @PathVariable int page,HttpSession session) { 
		  logger.info("나의 문의 페이지2");
		  logger.info(" page : {}, session Id: {}",  page,session);
	  
	  return service.page_list(page,session); 
	  }
	 
  //전체 or 이동해올때는 이걸 탄다.
	@RequestMapping(value = "/QAll", method = RequestMethod.GET)
	public ModelAndView noticeQAll(Model model) {
		service.question_infoNotice(model);
		logger.info("전체보여주기");
		ModelAndView mav = new ModelAndView(); 
	  mav.setViewName("myLib_question"); 
	  return mav; 
	}
  
	//방
	@RequestMapping(value = "/QRoom", method = RequestMethod.GET)
	public ModelAndView noticeQRoom(Model model) {
		service.questionRoom_infoNotice(model);
		logger.info("열람실 문의 보여주기");
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("myLib_question"); 
		return mav; 
	}
  
	//책
	@RequestMapping(value = "/QBook", method = RequestMethod.GET)
	public ModelAndView noticeQBook(Model model) {
		service.questionBook_infoNotice(model);
		logger.info("도서 문의 보여주기");
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("myLib_question"); 
		return mav; 
	}
	
	//서비스
	@RequestMapping(value = "/QService", method = RequestMethod.GET)
	public ModelAndView noticeQService (Model model) {
		logger.info("서비스 문의 보여주기");
		service.questionService_infoNotice(model);
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("myLib_question"); 
		return mav; 
	}
	
	//기타
	@RequestMapping(value = "/QOthers", method = RequestMethod.GET)
	public ModelAndView noticeQOthers(Model model) {
		service.questionOthers_infoNotice(model);
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("myLib_question"); 
		return mav; 
	}

	@RequestMapping(value = "/myLib_question_detail")
	public ModelAndView question_detail(@RequestParam HashMap<String, Object> params) {
	//public HashMap<String, Object> question_detail(@RequestParam String idx) {	
		
		logger.info("나의 문의 상세페이지");
		logger.info("params:{}",params);
		return service.myLib_question_detail(params);
	}
	
	@RequestMapping(value = "/editForm")
	public ModelAndView question_edit(Model model,HttpSession session,@RequestParam HashMap<String, Object> params) {
		
		logger.info("나의 문의 수정페이지");
		logger.info("params:{}",params);
		return service.question_editForm(params);
	  }
	
	
	@RequestMapping(value = "/question_edit")
	//public HashMap<String, Object> question_edit(@RequestParam HashMap<String, Object> params) {
	public ModelAndView question_edit(@RequestParam HashMap<String, Object> params) {
		
		logger.info("나의 문의 상세페이지 수정");
		logger.info("params:{}",params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("", value)
		return service.question_edit(params);
		
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
