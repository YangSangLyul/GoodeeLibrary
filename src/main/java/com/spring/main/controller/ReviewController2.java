package com.spring.main.controller;

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

import com.spring.main.dto.ReviewDTO;
import com.spring.main.service.ReviewService2;

@Controller
public class ReviewController2 { // 리뷰모아보기용 (추후 합칠예정)

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	String page = "";
	String msg = "";
	@Autowired
	ReviewService2 service;

	// 전체 리뷰 가져오기(등록순)
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String review_All() {
		logger.info("전체 리뷰 최신순 요청");
		return "reviewList";
	}

	// 전체 리뷰 가져오기(페이징)
	@RequestMapping(value = "/reviewList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> review_All(@PathVariable int page) {
		int pagePerCnt = 5;
		logger.info("page: " + page);
		return service.reviewList(pagePerCnt, page);
	}

	// 추천순 리뷰 가져오기
	@RequestMapping(value = "/reviewCom", method = RequestMethod.GET)
	public String reviewCom() {
		logger.info("리뷰 추천순 정렬 요청");
		return "reviewList";
	}

	// 추천순 리뷰 가져오기(페이징)
	@RequestMapping(value = "/reviewCom/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reviewComList(@PathVariable int page) {
		int pagePerCnt = 5;
		logger.info("page: " + page);
		return service.reviewCom(pagePerCnt, page);
	}

	// 특정아이디의 리뷰 가져오기(최신순)
	@RequestMapping(value = "/reviewIdList", method = RequestMethod.GET)
	public ModelAndView reviewIdList(@RequestParam String id) {
		logger.info(id + " 의 리뷰 목록");
		return service.reviewIdList(id);
	}
	
	// 특정아이디의 리뷰 가져오기(추천순)
	@RequestMapping(value = "/reviewIdComm", method = RequestMethod.GET)
	public ModelAndView reviewIdComm(@RequestParam String id) {
		logger.info(id + " 의 리뷰 추천순 목록");
		return service.reviewIdComm(id);
	}
	
	// 리뷰 상세보기
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(Model model, @RequestParam String reviewIdx,HttpSession session) {
		logger.info("상세보기할 리뷰번호: " + reviewIdx);
		String loginId = (String) session.getAttribute("loginId");
		String page = "redirect:/reviewList";
		ReviewDTO dto = service.reviewDetail(reviewIdx);

		if (dto != null) {
			page = "reviewDetail";
			model.addAttribute("dto", dto);
		}
		return page;
	}

	// 리뷰 신고 페이지 이동
	@RequestMapping(value = "/reviewReportForm", method = RequestMethod.GET)
	public String reviewReportForm(Model model, @RequestParam String reviewIdx, HttpSession session) {
		logger.info("신고할 리뷰번호: " + reviewIdx);
		page = "reviewReportForm";
		model.addAttribute("dto", service.reviewReportForm(reviewIdx));
		return page;
	}

	// 리뷰 신고
	@RequestMapping(value = "/reviewReport", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> reviewReport(Model model, @ModelAttribute ReviewDTO dto,
			HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("신고할 리뷰 정보: " + dto.getReviewIdx() + "/" + dto.getReportId() + "/" + dto.getReportReason() + " / "
				+ "신고자 :" + loginId);
		return service.reviewReport(dto, loginId);
	}

	@RequestMapping(value = "/reviewLike", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> clickLike(@RequestParam int reviewIdx, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		logger.info("추천할 리뷰정보:"+reviewIdx+"/"+id);
		return service.clickLike(reviewIdx, id);
	}
	
	@RequestMapping(value = "/reviewLikeCnt", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reviewLikeCnt(@RequestParam int reviewIdx) {
		return service.reviewLikeCnt(reviewIdx);
	}

}
