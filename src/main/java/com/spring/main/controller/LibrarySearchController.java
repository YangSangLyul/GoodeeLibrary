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

import com.spring.main.service.LibrarySearchService;

@Controller
public class LibrarySearchController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LibrarySearchService service;
	
	@RequestMapping(value = "/reserveBook", method = RequestMethod.GET)
	public String reserveBook(@RequestParam HashMap<String, String> params, HttpSession session, RedirectAttributes rAttr) {
		logger.info("예약하기 : " + params);
		String loginId = (String) session.getAttribute("loginId");

		params.put("id", loginId);
		
		logger.info("아이디 : "+params.get("id"));
		String msg = "현재 예약된 도서입니다.";
		int success = service.reserveBook(params);
		logger.info("예약 성공 여부 : " + success);
		String bookIdx = params.get("bookIdx");
		logger.info("bookIdx : " + bookIdx);
		
		if(success > 0) {
			msg = "예약에 성공했습니다!";
			
		}
		rAttr.addFlashAttribute("msg",msg);
		return "redirect:/searchResultDetail?bookIdx="+bookIdx;
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
