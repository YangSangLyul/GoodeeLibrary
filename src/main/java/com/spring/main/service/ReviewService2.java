package com.spring.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ReviewDao2;
import com.spring.main.dto.ReviewDTO;

@Service
public class ReviewService2 { //리뷰 모아보기용

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReviewDao2 dao;

	public ModelAndView reviewList() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReviewDTO> reviewList = dao.reviewList();
		mav.addObject("review", reviewList);
		mav.setViewName("reviewList");
		return mav;
	}
	
	public ModelAndView reviewCom() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReviewDTO> reviewList = dao.reviewCom();
		mav.addObject("review", reviewList);
		mav.setViewName("reviewList");
		return mav;
	}

	public ModelAndView reviewIdList(String id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReviewDTO> reviewIdList = dao.reviewIdList(id);
		mav.addObject("review", reviewIdList);
		mav.setViewName("reviewIdList");
		return mav;
	}

	public ReviewDTO reviewDetail(String reviewIdx) {
		return dao.reviewDetail(reviewIdx);
	}




	
	
}
