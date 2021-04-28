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
	
	
	public int reserveBook(HashMap<String, String> params) {
		return dao.reserveBook(params);
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

	public ModelAndView searchResultDetail(String bookIdx) {
		ModelAndView mav = new ModelAndView();
		
		int reserveCnt = 0;
		
		BookDTO book = dao.searchResultDetail(bookIdx);
		if(book != null) {
			mav.addObject("searchDetail",book);
			if(dao.reserveChk(bookIdx) != null) {
				reserveCnt = dao.reserveChk(bookIdx);
			}
			
			logger.info("현재 예약 인원 수 : {} 명",reserveCnt);
			
			mav.addObject("reserveCnt",reserveCnt);
		}
		
		logger.info("상세도서 불러오기 결과ㅣ : {}",book);
		
		mav.setViewName("booksDetail");
		
		return mav;
	}

}
