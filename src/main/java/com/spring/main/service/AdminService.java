package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;

@Service
public class AdminService {
	
	@Autowired AdminDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView reviewkingList() {
		logger.info("리뷰왕 쿼리 요청");
		ModelAndView mav = new ModelAndView();		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AdminDTO> manyUp = dao.manyUp();
		ArrayList<AdminDTO> manyReview = dao.manyReview();
		map.put("manyUp", manyUp);
		map.put("manyReview", manyReview);
		
		mav.addObject("king", map);		
		mav.setViewName("adminReviewKing");

		return mav;
	}

	public int selectKing(HashMap<String, Object> params) {
		logger.info("리뷰왕 INSERT 쿼리 요청");
		ModelAndView mav = new ModelAndView();
	    int success = dao.selectKing(params);
	    //map.put("map", dao.selectKing(params));
	    if(success>0) {
	    	mav.setViewName("redirect:/ReviewKing");	    	
	    }	     
	    return success;
	}
	
	
}
