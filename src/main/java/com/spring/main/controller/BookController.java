package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BookService;


@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BookService service;
	
	@RequestMapping(value = "/normalBookManage", method = RequestMethod.GET)
	public ModelAndView normalBookManage(Model model) {
		logger.info("일반도서 리스트");
		
		return service.bookManageList();
	}
	
	@RequestMapping(value = "/normalBookFilter", method = RequestMethod.POST)
	public ModelAndView normalBookFilter(@RequestParam ArrayList<String> filter) {
		logger.info("일반도서 필터");
		
		return service.normalBookFilter(filter);
	}
	
	@RequestMapping(value = "/bookStateChange", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> bookStateChange(@RequestParam HashMap<String, String> params) {
		logger.info("도서 상태 변환 : {}",params);
		
		return service.bookStateChange(params);
	}
	
	@RequestMapping(value = "/reserveApproval", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reserveApproval(@RequestParam HashMap<String, String> params) {
		logger.info("예약 승인 : {}",params);
		
		return service.reserveApproval(params);
	}
	@RequestMapping(value = "/userReserveNotification", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> userReserveNotification(@RequestParam HashMap<String, String> params) {
		logger.info("유저 예약 알림 : {}",params);
		
		return service.userReserveNotification(params);
	}
	
	@RequestMapping(value = "/bookManageDetail", method = RequestMethod.GET)
	public  ModelAndView bookManageDetail(@RequestParam String bookIdx) {
		logger.info("도서 관리 상세보기 : " + bookIdx);
		
		return service.bookManageDetail(bookIdx);
	}
	
	@RequestMapping(value = "/recommendBook", method = RequestMethod.GET)
	public  String bookManageDetail(@RequestParam HashMap<String,String> params, Model model) {
		logger.info("사서의 추천도서 페이지 이동 : " + params);
		model.addAttribute("params", params);
		return "/BookManage/recommendBookManage";
	}
	
	@RequestMapping(value = "/insertRecommendBook", method = RequestMethod.POST)
	public  String insertRecommendBook(@RequestParam HashMap<String,String> params, Model model) {
		logger.info("사서의 추천도서 추가 : " + params);
		return service.insertRecommendBook(params);
	}
	
}
