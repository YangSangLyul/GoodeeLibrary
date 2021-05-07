package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.LibrarySearchDAO;
import com.spring.main.service.LibrarySearchService;

@Controller
public class LibrarySearchController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibrarySearchService service;
	@Autowired LibrarySearchDAO dao;
	
	@RequestMapping(value = "/reserveBook", method = RequestMethod.GET)
	public String reserveBook(@RequestParam HashMap<String, String> params, HttpSession session, RedirectAttributes rAttr) {
		logger.info("예약하기 : " + params);
		String loginId = (String) session.getAttribute("loginId");

		params.put("id", loginId);
		
		logger.info("아이디 : "+params.get("id"));
		String msg = "현재 예약된 도서입니다.";
		String cantReserveMsg = "";
		
		//이달의 베스트 리뷰왕인지 체크
		int success = dao.maximumRentalChk(loginId);
		int reserveSuccess = 0;
		int cnt = 0;
		
		//베스트 리뷰왕이므로 대여 3번가능
		if(success > 0) {
			cnt = dao.RentalChk(loginId);
			//최대 3권인지 확인
			if(cnt >= 3) {
				logger.info("현재 3권 대여되었으므로 더이상 예약 불가능");
				cantReserveMsg = "더이상 대여가 가능한 상태가 아니므로 에약을 할 수 가 없습니다.";
				msg = "";
			}else {
				reserveSuccess = service.reserveBook(params);
			}
		//베스트 리뷰왕이 아니므로 대여 2번 가능
		}else {
			cnt = dao.RentalChk(loginId);
			//최대 2권인지 확인
			if(cnt >= 2) {
				logger.info("현재 2권 대여되었으므로 더이상 대여 불가능");
				cantReserveMsg = "더이상 대여가 가능한 상태가 아니므로 예약을 할 수 가 없습니다.";
				msg = "";
			}else {
				reserveSuccess = service.reserveBook(params);
			}
		}

		logger.info("예약 성공 여부 : " + reserveSuccess);
		String bookIdx = params.get("bookIdx");
		logger.info("bookIdx : " + bookIdx);
		
		if(reserveSuccess > 0) {
			msg = "예약에 성공했습니다!";
			
		}
		rAttr.addFlashAttribute("msg",msg);
		rAttr.addFlashAttribute("cantReserveMsg",cantReserveMsg);
		
		return "redirect:/searchResultDetail?bookIdx="+bookIdx;
	}
	
	@RequestMapping(value = "/reserveBookCancel", method = RequestMethod.GET)
	public String reserveBookCancel(@RequestParam String reserveBookIdx) {
		logger.info("예약 취소하기 : " + reserveBookIdx);
		int success = service.reserveBookCancel(reserveBookIdx);
		logger.info("예약 취소 성공 여부 : " + success);
		
		return "redirect:/MyBook";
	}
	
	@RequestMapping(value = "/rentalBook", method = RequestMethod.GET)
	public String rentalBook(@RequestParam String reserveBookIdx,@RequestParam String noticeIdx, HttpSession session) {
		logger.info("대여하기 : " + reserveBookIdx);
		int success = service.rentalBook(reserveBookIdx,session);
		
		if(success > 0) {
			//대여 성공 시 알림 읽음 처리 하는 작업
			service.notificationRead(noticeIdx);
		}
		logger.info("대여 성공 여부 : " + success);
		
		return "redirect:/MyBook";
	}
	
	@RequestMapping(value = "/returnBook", method = RequestMethod.GET)
	public String returnBook(@RequestParam String reserveBookIdx) {
		logger.info("반납하기 : " + reserveBookIdx);
		int success = service.returnBook(reserveBookIdx);
		logger.info("반납 성공 여부 : " + success);
		
		return "redirect:/userNotification";
	}
		
	@RequestMapping(value = "/booksSearch", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("도서 검색 화면 이동");
		return "booksSearch";
	}
	
	@RequestMapping(value = "/bookSearchReq")
	public ModelAndView search(@RequestParam HashMap<String, String> params) {
		
		logger.info("검색 대상 : {} , 검색 종류 : {}", params);
		
		
		
		return service.searchResult(params);
	}
	
	@RequestMapping(value = "/searchResultDetail", method = RequestMethod.GET)
	public ModelAndView searchResultDetail(@RequestParam String bookIdx) {
		
		logger.info("검색도서 상세보기 대상 : {}", bookIdx);
		
		
		
		return service.searchResultDetail(bookIdx);
	}

}
