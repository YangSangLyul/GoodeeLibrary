package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.reserveSeatService;

@Controller
public class SeatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired reserveSeatService reserve;
	
	@RequestMapping(value = "/reserveSeatForm", method = RequestMethod.GET)
	public ModelAndView reserveSeat() {
		
		logger.info("도서관 서비스 메뉴(좌석 예약) 진입");
		return reserve.reserveSeatList();
	}
	
	@RequestMapping(value = "/reserveSeatReq", method = RequestMethod.POST)
	public String reserveSeatReq(@RequestParam String[] seatTime, @RequestParam int seatNum, @RequestParam String loginId, RedirectAttributes rAttr) {
		
		logger.info("좌석 예약 요청 : 좌석 ->"+seatNum+" 예약시간 ->"+seatTime[0]+" 종료시간 ->"+seatTime[seatTime.length-1]+" 요청대상 : "+loginId);
		
		
		return reserve.reserveSeatReq(seatTime,seatNum,loginId, rAttr);
	}
	
	
	@RequestMapping(value = "/myLib_reserveSeatInOut", method = RequestMethod.GET)
	public ModelAndView myLib_reserveSeatInOut(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
			
		logger.info("내 예약 좌석 확인 메뉴 진입 + 예약좌석 존재여부 확인 대상 아이디 : "+loginId);
		
		return reserve.myReserveSeat(loginId);
	}
	
	//ajax 요청
	@RequestMapping(value = "/seatEnterReq", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object>seatEnterReq(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("입실요청 대상 : "+loginId);
		
		return reserve.seatEnterReq(loginId);
	}
	
	//ajax 요청	
	@RequestMapping(value = "/seatExitReq", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object>seatExitReq(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("퇴실요청 대상 : "+loginId);
		
		return reserve.seatExitReq(loginId);
	}
	
	
	//ajax 요청	
	@RequestMapping(value = "/reserveCancelReq", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object>reserveCancelReq(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("예약취소 요청 대상 : "+loginId);
		
		return reserve.reserveCancelReq(loginId);
	}
	
	@RequestMapping(value = "/seatEnterExitHistory", method = RequestMethod.GET)
	public String seatEnterExitHistory(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
			
		logger.info("내 입/퇴실 히스토리 요청 : "+loginId);
		
		return "/seatEnterExitHistory";
	}
	
	
	@RequestMapping(value = "/seatEnterExitHistoryReq/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object>seatEnterExitHistoryReq(HttpSession session, @PathVariable int page) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("내 입/퇴실 히스토리  리스트 요청 : "+loginId);
		
		return reserve.mySeatEnterExitHistory(loginId,page);
	}
	
	
}
