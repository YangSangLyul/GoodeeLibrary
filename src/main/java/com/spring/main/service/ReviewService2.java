package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ReviewDao2;
import com.spring.main.dto.ReviewDTO;

@Service
public class ReviewService2 { //리뷰 모아보기용

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	String page = "";
	String msg = "";
	
	@Autowired ReviewDao2 dao;
	
	public HashMap<String, Object> reviewList(int pagePerCnt,int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allCnt = dao.review_AllCount();
		logger.info("allCnt:"+allCnt);
	
		int range = allCnt/pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		logger.info("만들수있는 페이지~"+range);
		page = page>range? range:page;
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		
		ArrayList<ReviewDTO> reviewList = dao.reviewList(start,end);
		map.put("list",reviewList);
		map.put("range", range);
		map.put("currPage",page);
		return map;
	}
	
	public HashMap<String, Object> reviewCom(int pagePerCnt,int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allCnt = dao.review_AllCount();
		logger.info("allCnt:"+allCnt);
	
		int range = allCnt/pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		logger.info("만들수있는 페이지~"+range);
		page = page>range? range:page;
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		
		ArrayList<ReviewDTO> reviewList = dao.reviewCom(start,end);
		map.put("list",reviewList);
		map.put("range", range);
		map.put("currPage",page);
		return map;
	}
	
//	public ModelAndView reviewCom() {
//		ModelAndView mav = new ModelAndView();
//		ArrayList<ReviewDTO> reviewList = dao.reviewCom();
//		mav.addObject("review", reviewList);
//		mav.setViewName("reviewList");
//		return mav;
//	}

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
	
	public ReviewDTO reviewReportForm(String reviewIdx) {
		return dao.reviewReportForm(reviewIdx);
	}
	
	@Transactional
	public HashMap<String, Object> reviewReport(ReviewDTO dto, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		dto.setId(loginId);
		String id = dto.getId();
		logger.info("dto id 확인 : "+id);
	
		int reviewIdx = dto.getReviewIdx();
		int success;
		
		if(dao.overReport(dto)!=null) {
			success = 0;
		}else {
			success = dao.reviewReport(dto);
			if(success>0) {
				dao.reportCntUp(reviewIdx);
			}	
		}
		map.put("success", success);
		logger.info("신고성공여부: "+success);
		return map;
	}


	

}
