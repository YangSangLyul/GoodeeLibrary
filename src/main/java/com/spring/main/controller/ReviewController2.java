package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.AdminService;
import com.spring.main.service.ReviewService2;

@Controller
public class ReviewController2 { //리뷰모아보기용 (추후 합칠예정)
		
		private Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired ReviewService2 service;
		
		//전체 리뷰 가져오기 
		@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
		public ModelAndView review_All(Model model) {
			logger.info("전체 리뷰요청");
			return service.reviewList();
		}
}
