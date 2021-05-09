package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
		
		String bookIdx = params.get("bookIdx");
		String id = params.get("id");
		
		int success = 0;
		
		//현재 예약하려는 사람이 몇개 예약했는지 체크(리뷰왕이냐 아니냐도 포함)
		
		int chk = dao.reserveChkId(bookIdx,id);
		
		if(chk == 0) {
			success = dao.reserveBook(params);
		}
		
		logger.info("");

		return success;

	}
	
	public int reserveBookCancel(String reserveBookIdx) {
		return dao.reserveBookCancel(reserveBookIdx);
	}
	
	public int rentalBook(String reserveBookIdx, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		//이달의 베스트 리뷰왕인지 체크
		int success = dao.maximumRentalChk(loginId);
		int rentalSuccess = 0;
		int cnt = 0;
		
		//베스트 리뷰왕이므로 대여 3번가능
		if(success > 0) {
			cnt = dao.RentalChk(loginId);
			//최대 3권인지 확인
			if(cnt >= 3) {
				logger.info("현재 3권 대여되었으므로 더이상 대여 불가능");
			}else {
				rentalSuccess = dao.rentalBook(reserveBookIdx);
			}
		//베스트 리뷰왕이 아니므로 대여 2번 가능
		}else {
			cnt = dao.RentalChk(loginId);
			//최대 2권인지 확인
			if(cnt >= 2) {
				logger.info("현재 2권 대여되었으므로 더이상 대여 불가능");
			}else {
				rentalSuccess = dao.rentalBook(reserveBookIdx);
			}
		}
		
		return rentalSuccess;
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

	public void notificationRead(String noticeIdx) {
		
		int success = dao.notificationRead(noticeIdx);
		
		if(success > 0) {
			logger.info("성공적으로 알림을 읽음처리 했습니다!!!");
		}
		
	}

}
