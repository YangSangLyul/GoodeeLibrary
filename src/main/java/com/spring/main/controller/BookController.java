package com.spring.main.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.BookDTO;
import com.spring.main.service.BookService;


@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BookService service;
	
	// 도서 관리 페이지로 이동
	// 관리자 네비가 있는지 잘 모르니 bookList 입력해서 이동
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public String bookList() {
		logger.info("도서 관리 페이지 이동");
		return "/BookManage/normalBookManage";
	}
	
	// 일반 도서 관리 - 페이징
	@RequestMapping(value = "/normalBookManage/{page}/{filter}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> normalBookManage(@PathVariable int page,@PathVariable String filter) {
		logger.info("page : " + page);
		return service.bookList(page,filter);
	}
	
	// 희망 도서 페이지로 이동
	@RequestMapping(value = "/hopeBookList", method = RequestMethod.GET)
	public String hopeBookList() {
		logger.info("도서 관리 페이지 이동");
		return "/BookManage/hopeBookList";
	}
	
	// 희망 도서 관리 - 페이징
	@RequestMapping(value = "/hopeBookManage/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> hopeBookManage(@PathVariable int page) {
		logger.info("hopeBookManage page : " + page);
		return service.hopeBookList(page);
	}
	
	// 희망 도서 상세보기
	@RequestMapping(value = "/hopeBookDetail", method = RequestMethod.GET)
	public ModelAndView hopeBookDetail(@RequestParam String hopeBooksNumber) {
		logger.info("hopeBooksNumber : " + hopeBooksNumber);
		return service.hopeBookDetail(hopeBooksNumber);
	}
	
	// 희망 도서 수락
	@RequestMapping(value = "/hopeBookApprove", method = RequestMethod.GET)
	public String hopeBookApprove(@RequestParam String hopeBooksNumber) {
		logger.info("hopeBookApprove : " + hopeBooksNumber);
		return service.hopeBookApprove(hopeBooksNumber);
	}
	
	// 희망 도서 거절 사유 페이지 이동
	@RequestMapping(value = "/hopeBookReject", method = RequestMethod.GET)
	public String hopeBookReject(Model model, @RequestParam String hopeBooksNumber) {
		logger.info("hopeBookReject : " + hopeBooksNumber);
		model.addAttribute("hopeBooksNumber", hopeBooksNumber);
		return "/BookManage/hopeBookRejectReason";
	}
	
	// 희망도서 거절 및 사유 받는 메서드
	@RequestMapping(value = "/hopeBookRejectReason", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> hopeBookRejectReason(@RequestParam HashMap<String, String> params) {
		logger.info("hopeBookRejectReason : {}", params);
		return service.hopeBookRejectReason(params);
	}
	
	@RequestMapping(value = "/bookFilter", method = RequestMethod.GET)
	public  @ResponseBody HashMap<String, Object> bookFilter(
			@RequestParam(value="filter[]") String[] filter, Model model, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("도서 필터 페이지 이동 : " + filter);
		session.setAttribute("filter", filter);
		map.put("success","true");
		return map;
	}
	@RequestMapping(value = "/bookManageFilter", method = RequestMethod.GET)
	public String bookManageFilter() {
		logger.info("도서 필터 페이지 이동");
		return "/BookManage/bookManageFilter";
	}
	
	// 50번 슬라이드 2번 기능 필터 골라서 나온 값 페이징 처리 해야하는데 아직 미완성
	@RequestMapping(value = "/normalBookFilter/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> normalBookFilter(
			@RequestParam(value="filter[]") String[] filter,
			@PathVariable int page,
			HttpSession session) {
		session.removeAttribute("filter");
		logger.info("page : " + page);
 		return service.normalBookFilter(filter, page);
	}
	
	// bookList에서 책 상태 변환
	@RequestMapping(value = "/bookStateChange", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> bookStateChange(@RequestParam HashMap<String, String> params) {
		logger.info("도서 상태 변환 : {}",params);
		
		return service.bookStateChange(params);
	}
	
	// bookList에서 예약 승인
	@RequestMapping(value = "/reserveApproval", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reserveApproval(@RequestParam HashMap<String, String> params) {
		logger.info("예약 승인 : {}",params);
		
		return service.reserveApproval(params);
	}
	@RequestMapping(value = "/userReserveNotification", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> userReserveNotification(@RequestParam HashMap<String, String> params) {
		logger.info("유저 예약 알림 : {}",params);
		
		return service.userReserveNotification(params);
	}
	
	// bookList에서 도서 상세보기
	@RequestMapping(value = "/bookManageDetail", method = RequestMethod.GET)
	public  ModelAndView bookManageDetail(@RequestParam String bookIdx) {
		logger.info("도서 관리 상세보기 : " + bookIdx);
		
		return service.bookManageDetail(bookIdx);
	}
	
	@RequestMapping(value = "/recommendBook", method = RequestMethod.GET)
	public  String bookManageDetail(@RequestParam HashMap<String,String> params, Model model) {
		logger.info("사서의 추천도서 페이지 이동 : " + params);
		model.addAttribute("params", params);
		return "/BookManage/recommendBookManage";
	}
	
	@RequestMapping(value = "/insertRecommendBook", method = RequestMethod.POST)
	public  String insertRecommendBook(@RequestParam HashMap<String,String> params, Model model) {
		logger.info("사서의 추천도서 추가 : " + params);
		return service.insertRecommendBook(params);
	}
	
	// bookList에서 도서 추가 페이지로 이동 가능
	@RequestMapping(value = "/bookManageInsert", method = RequestMethod.GET)
	public  String bookManageInsert() {
		logger.info("도서 추가 페이지 이동");
		return "/BookManage/bookManageInsert";
	}
	
	// bookList에서 도서 추가 가능
	@RequestMapping(value = "/bookInsert", method = RequestMethod.POST)
	public  String bookInsert(@ModelAttribute BookDTO dto) {
		logger.info("도서 추가");
		logger.info(dto.getBookName() + " / " + dto.getBookImg() + " / " + dto.getPublisher() + " / " + dto.getStory() + " / " + dto.getWriter());
		return service.bookInsert(dto);
	}
	
	@RequestMapping(value = "/hopeBook", method = RequestMethod.GET)
	public  String hopeBook() {
		logger.info("희망도서 신청 페이지 이동");
		
		return "/hopeBook";
	}
	
	@RequestMapping(value = "/hopeBookReq", method = RequestMethod.POST)
	public  String hopeBookReq(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		logger.info("희망도서 신청 요청 : "+params);
		
		return service.hopeBookInsert(params,rAttr);
	}
	
	@RequestMapping(value = "/newBooksList", method = RequestMethod.GET)
	public  String newBooksList() {
		logger.info("신착도서 안내 페이지 이동");
		
		return "/newBooks";
	}
	
	@RequestMapping(value = "/newBooks/{month}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> newBooks(@PathVariable int month, @PathVariable int page) {
		logger.info("신착도서 리스트 요청 : "+month+" 월의 페이지번호 : "+page);
		
		return service.newBooks(month,page);
	}
	
	@RequestMapping(value = "/recommendBooks", method = RequestMethod.GET)
	public  String recommendBooks() {
		logger.info("사서도서 안내 페이지 이동");
		
		return "/recommendBooks";
	}
	
	@RequestMapping(value = "/recommendBooksList/{month}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> recommendBooksList(@PathVariable int month, @PathVariable int page) {
		logger.info("사서도서 리스트 요청 : "+month+" 월의 페이지번호 : "+page);
		
		return service.recommendBooksList(month,page);
	}
	
	
	@RequestMapping(value = "/mainRecommendBooksList/{month}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> recommendBooksList(@PathVariable int month) {
		logger.info("메인 사서도서 리스트 요청 : "+month);
		
		return service.mainRecommendBooksList(month);
	}
	
	@RequestMapping(value = "/reviewRecommendBooksList/{month}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reviewRecommendBooksList(@PathVariable int month) {
		logger.info("메인 리뷰추천도서 리스트 요청 : "+month);
		
		return service.reviewRecommendBooksList(month);
	}
	
	
	@RequestMapping(value = "/authorRecommendBooksList/{month}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> authorRecommendBooksList(@PathVariable int month) {
		logger.info("메인 사서추천도서 리스트 요청 : "+month);
		
		return service.authorRecommendBooksList(month);
	}
	
}
