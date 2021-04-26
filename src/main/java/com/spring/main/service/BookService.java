package com.spring.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BookDAO;
import com.spring.main.dto.BookDTO;

@Service
public class BookService {

	@Autowired BookDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView bookManageList() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<BookDTO> list = dao.bookManageList(); 
		logger.info("list size : " + list.size());
		mav.addObject("list", list);
		mav.setViewName("/BookManage/normalBookManage");
		return mav;
	}

	public ModelAndView normalBookFilter(ArrayList<String> filter) {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<BookDTO> filterList = dao.normalBookFilter(filter);
		mav.addObject("filterList", filterList);
		mav.setViewName("/BookManage/normalBookManage");
		
		return mav;
	}

}
