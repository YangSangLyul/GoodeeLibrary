package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	public String reserveSeatReq(String[] seatTime, int seatNum, String loginId, RedirectAttributes rAttr) {
		
		ModelAndView mav = new ModelAndView();
		
		String start = seatTime[0]+":00";
		String end = seatTime[seatTime.length-1]+":00";
		String msg = "";
		
		logger.info("시작시작 "+start+" , 종료시간 : "+end);
		
		ArrayList<ReserveSeatDTO> id = reserveSeatDAO.reserSeatChk(loginId);
		
		if(id.size() > 0) {
			msg = "이미 좌석 예약을 하셨습니다...";
		}else {
			int success = reserveSeatDAO.reserveSeatReq(start,end,seatNum,loginId);
			
			if(success > 0) {
				msg = "좌석 예약에 성공했습니다!";
			}
			
		}
			
			

		rAttr.addFlashAttribute("msg",msg);
		return "redirect:/reserveSeatForm";
	}

}
