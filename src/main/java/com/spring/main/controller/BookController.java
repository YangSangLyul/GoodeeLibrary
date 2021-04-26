package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BookService;

@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BookService service;
	
	@RequestMapping(value = "/normalBookManage", method = RequestMethod.GET)
	public ModelAndView normalBookManage(Model model) {
		logger.info("일반도서 리스트");
		
		//"/BookManage/normalBookManage"
		return service.bookManageList();
	}
	
}
