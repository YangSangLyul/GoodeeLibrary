package com.spring.main.controller;

import java.util.ArrayList;
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
	
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public String bookList() {
		logger.info("도서 관리 페이지 이동");
		return "/BookManage/normalBookManage";
	}
	
	@RequestMapping(value = "/normalBookManage/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> normalBookManage(@PathVariable int page) {
		logger.info("page : " + page);
		return service.bookList(page);
	}
	
	@RequestMapping(value = "/normalBookFilter/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> normalBookFilter(
			@RequestParam HashMap<String, Object> params, 
			@PathVariable int page) {
		//logger.info("일반도서 필터 : " + filter + " / reserve : " + reserve);
		
		logger.info("일반도서 필터 : " + params);
		logger.info("일반도서 필터 : " + params.get("filter[]"));
		logger.info("일반도서 필터 : " + params.get("filter[0]"));
		logger.info("일반도서 필터 : " + params.get("filter[1]"));
		
		/*
		 * ArrayList list = (ArrayList)params.get("filter"); logger.info("list : " +
		 * list.size());
		 */
		
		//logger.info("일반도서 필터 : " + params.get("reserve"));
		
		logger.info("page : " + page);
 		return null;
	}
	
	@RequestMapping(value = "/bookStateChange", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> bookStateChange(@RequestParam HashMap<String, String> params) {
		logger.info("도서 상태 변환 : {}",params);
		
		return service.bookStateChange(params);
	}
	
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
	
	@RequestMapping(value = "/bookManageInsert", method = RequestMethod.GET)
	public  String bookManageInsert() {
		logger.info("도서 추가 페이지 이동");
		return "/BookManage/bookManageInsert";
	}
	
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
