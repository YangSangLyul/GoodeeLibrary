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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(value = "/FAQSearch", method = RequestMethod.GET)
	public ModelAndView noticeFAQsearch(@RequestParam HashMap<String, Object> params,RedirectAttributes rAttr) {	
		
		return service.faqSearch_infoNotice(params,rAttr);
	}
	
	//전체 or 이동해올때는 이걸 탄다.
	@RequestMapping(value = "/QuestionAll", method = RequestMethod.GET)
	public ModelAndView noticeQuestionAll() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Question");
		return mav;
	}
	
	@RequestMapping(value = "/Question/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeQuestionPageing(@PathVariable int page) {
		logger.info("여기옴?"+page);
		
		return service.question_pageing(page);
	}
	
	@RequestMapping(value = "/QuestionRoom", method = RequestMethod.GET)
	public ModelAndView noticeQuestionRoom() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QuestionRoom");
		return mav;
	}
	
	@RequestMapping(value = "/QuestionRoom/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeQuestionRoomPageing(@PathVariable int page) {
		logger.info("여기옴?"+page);
		
		return service.question_roomPageing(page);
	}
	
	
	@RequestMapping(value = "/QuestionBook", method = RequestMethod.GET)
	public ModelAndView noticeQuestionBook() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QuestionBook");
		return mav;
	}
	
	@RequestMapping(value = "/QuestionBook/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeQuestionBookPageing(@PathVariable int page) {
		logger.info("여기옴?"+page);
		
		return service.question_bookPageing(page);
	}
	
	@RequestMapping(value = "/QuestionService", method = RequestMethod.GET)
	public ModelAndView noticeQuestionService() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QuestionService");
		return mav;
	}
	
	@RequestMapping(value = "/QuestionService/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeQuestionServicePageing(@PathVariable int page) {
		logger.info("여기옴?"+page);
		
		return service.question_servicePageing(page);
	}
	
	@RequestMapping(value = "/QuestionGuitar", method = RequestMethod.GET)
	public ModelAndView noticeQuestionGuitar() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QuestionGuitar");
		return mav;
	}
	
	@RequestMapping(value = "/QuestionGuitar/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeQuestionGuitarPageing(@PathVariable int page) {
		logger.info("여기옴?"+page);
		
		return service.question_guitarPageing(page);
	}
	
}
