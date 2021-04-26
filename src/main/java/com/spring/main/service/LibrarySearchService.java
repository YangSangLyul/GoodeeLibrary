package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.LibrarySearchDAO;
import com.spring.main.dto.BookDTO;


@Service
public class LibrarySearchService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired LibrarySearchDAO dao;
	
	
	public int reserveBook(String bookIdx) {
		return dao.reserveBook(bookIdx);
	}
	
	public int reserveBookCancel(String reserveBookIdx) {
		return dao.reserveBookCancel(reserveBookIdx);
	}
	
	public int rentalBook(String reserveBookIdx) {
		return dao.rentalBook(reserveBookIdx);
	}
	
	public int returnBook(String reserveBookIdx) {
		return dao.returnBook(reserveBookIdx);
	}
	
	public ModelAndView searchResult(HashMap<String, String> params){
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<BookDTO> books = dao.searchResult(params);
		
		logger.info("검색된 수 : {}",books.size());
		
		mav.addObject("searchList",books);
		mav.addObject("searchText",params.get("searchContent"));
		mav.addObject("searchCount",books.size());
		
		mav.setViewName("booksSearchResult");
		
		return mav;
	}

}
