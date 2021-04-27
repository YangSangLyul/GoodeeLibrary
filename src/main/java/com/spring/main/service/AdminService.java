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
		ArrayList<AdminDTO> ReviewKing = dao.ReviewKing();
		//ArrayList<AdminDTO> manyUp = dao.manyUp();
		map.put("ReviewKing", ReviewKing);
		//map.put("manyUp", manyUp);
		
		mav.addObject("king", map);		
		mav.setViewName("adminReviewKing");

		return mav;
	}
	
	
}
