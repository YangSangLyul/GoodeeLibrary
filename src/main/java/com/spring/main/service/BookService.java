package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BookDAO;
import com.spring.main.dto.BookDTO;
import com.spring.main.dto.ReserveBookDTO;

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
		mav.addObject("list", filterList);
		mav.setViewName("/BookManage/normalBookManage");
		
		return mav;
	}

	public HashMap<String, Object> bookStateChange(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = dao.bookStateChange(params);
		map.put("success", success);
		
		
		return map;
	}

	public HashMap<String, Object> reserveApproval(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = dao.reserveApproval(params);
		map.put("success", success);
		return null;
	}

	public HashMap<String, Object> userReserveNotification(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = dao.userReserveNotification(params);
		map.put("success", success);
		return map;
	}

}
