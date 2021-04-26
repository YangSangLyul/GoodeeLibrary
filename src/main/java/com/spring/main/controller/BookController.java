package com.spring.main.controller;

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

import com.spring.main.service.LibrarySearchService;

@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibrarySearchService searchService;
	
	
	@RequestMapping(value = "/booksSearch", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("도서 검색 화면 이동");
		return "booksSearch";
	}
	
	@RequestMapping(value = "/bookSearchReq", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam HashMap<String, String> params) {
		
		logger.info("검색 대상 : {} , 검색 종류 : {}", params);
		
		
		
		return searchService.searchResult(params);
	}
}
