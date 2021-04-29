package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ReserveSeatDAO;
import com.spring.main.dto.ReserveSeatDTO;

@Service
public class reserveSeatService {
	
	@Autowired ReserveSeatDAO reserveSeatDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView reserveSeatList() {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ReserveSeatDTO> numList = reserveSeatDAO.seatList();
		
		if(numList != null) {
			ArrayList<ReserveSeatDTO> reserveList = reserveSeatDAO.reserveList();
			logger.info("reserveList 개수 : "+reserveList.size());
			mav.addObject("reserveList",reserveList);
			mav.addObject("list",numList);
		}
		
		mav.setViewName("reserveSeatForm");
		
		return mav;
	}

}
