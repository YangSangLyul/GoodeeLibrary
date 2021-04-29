package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ReserveSeatDAO;
import com.spring.main.dto.ReserveSeatDTO;

@Service
public class reserveSeatService {
	
	@Autowired ReserveSeatDAO reserveSeatDAO;

	public ModelAndView reserveSeatList() {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ReserveSeatDTO> numList = reserveSeatDAO.seatList();
		
		if(numList != null) {
			
			mav.addObject("list",numList);
		}
		
		return null;
	}

}
