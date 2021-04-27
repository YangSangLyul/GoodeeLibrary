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
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BookService;
import com.spring.main.service.LibrarySearchService;


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
	
}
