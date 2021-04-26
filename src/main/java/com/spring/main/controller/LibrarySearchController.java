package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.main.service.LibrarySearchService;

@Controller
public class LibrarySearchController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibrarySearchService service;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "BookManage/test";
	}
	
	@RequestMapping(value = "/reserveBook", method = RequestMethod.GET)
	public String reserveBook(@RequestParam String bookIdx) {
		logger.info("예약하기");
		int success = service.reserveBook(bookIdx);
		logger.info("예약 성공 여부 : " + success);
		
		return "BookManage/test";
	}
	
	@RequestMapping(value = "/reserveBookCancel", method = RequestMethod.GET)
	public String reserveBookCancel(@RequestParam String reserveBookIdx) {
		logger.info("예약 취소하기 : " + reserveBookIdx);
		int success = service.reserveBookCancel(reserveBookIdx);
		logger.info("예약 취소 성공 여부 : " + success);
		
		return "BookManage/test";
	}
	
	@RequestMapping(value = "/rentalBook", method = RequestMethod.GET)
	public String rentalBook(@RequestParam String reserveBookIdx) {
		logger.info("대여하기 : " + reserveBookIdx);
		int success = service.rentalBook(reserveBookIdx);
		logger.info("대여 성공 여부 : " + success);
		
		return "BookManage/test";
	}
	
	@RequestMapping(value = "/returnBook", method = RequestMethod.GET)
	public String returnBook(@RequestParam String reserveBookIdx) {
		logger.info("반납하기 : " + reserveBookIdx);
		int success = service.returnBook(reserveBookIdx);
		logger.info("반납 성공 여부 : " + success);
		
		return "BookManage/test";
	}
}
