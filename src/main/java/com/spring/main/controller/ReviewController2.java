package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	// 전체 리뷰 가져오기
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView review_All() {
		logger.info("전체 리뷰 최신순 요청");
		return service.reviewList();
	}

	@RequestMapping(value = "/reviewCom", method = RequestMethod.GET)
	public ModelAndView reviewCom() {
		logger.info("리뷰 추천순 정렬 요청");
		return service.reviewCom();
	}

	// 특정아이디의 리뷰 가져오기
	@RequestMapping(value = "/reviewIdList", method = RequestMethod.GET)
	public ModelAndView reviewIdList(@RequestParam String id) {
		logger.info(id + " 의 리뷰 목록");
		return service.reviewIdList(id);
	}

	// 리뷰 상세보기
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(Model model, @RequestParam String reviewIdx) {
		logger.info("상세보기할 리뷰번호: " + reviewIdx);

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
			logger.info("신고할 리뷰번호: " +reviewIdx);
			page = "reviewReportForm";
			model.addAttribute("dto", service.reviewReportForm(reviewIdx));
			return page;
		}
	
		   //리뷰 신고
		  @RequestMapping(value = "/reviewReport", method = RequestMethod.POST) 
		  public @ResponseBody HashMap<String, Object> reviewReport(Model model,@ModelAttribute ReviewDTO dto,HttpSession session){
			 String loginId = (String) session.getAttribute("loginId");
			 logger.info("신고할 리뷰 정보: "+dto.getReviewIdx()+"/"+dto.getReportId()+"/"+dto.getReportReason()+" / "+"신고자 :"+loginId); 
			 return service.reviewReport(dto,loginId);
		}	
		  
		  @RequestMapping(value = "/clickLike", method = RequestMethod.POST) 
		  public @ResponseBody HashMap<String, Object> clickLike(HashMap<String, Object> map,HttpSession session){
			logger.info("리뷰 추천 요청");
			 return null;
		}	
		  


}
