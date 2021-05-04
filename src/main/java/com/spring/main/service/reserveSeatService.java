package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.ReserveSeatDAO;
import com.spring.main.dto.BookDTO;
import com.spring.main.dto.MySeatHistoryDTO;
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
			msg = "이미 좌석 예약을 하셨거나 사용중인 좌석이 있습니다.";
		}else {
			int success = reserveSeatDAO.reserveSeatReq(start,end,seatNum,loginId);
			
			if(success > 0) {
				msg = "좌석 예약에 성공했습니다!";
			}
			
		}
			
			

		rAttr.addFlashAttribute("msg",msg);
		return "redirect:/reserveSeatForm";
	}

	public ModelAndView myReserveSeat(String loginId) {
		
		ModelAndView mav = new ModelAndView();
		
		if(loginId == null) {
			mav.setViewName("myLib_reserveSeatInOut");
			return mav;
		}
		
		
		ReserveSeatDTO mySeat = reserveSeatDAO.myReserveSeat(loginId);
		
		logger.info("내 좌석이 있는지 확인하기 : "+mySeat);
		
		if(mySeat != null) {
			mav.addObject("mySeat",mySeat);
		}
		
		mav.setViewName("myLib_reserveSeatInOut");
		
		return mav;
	}

	public HashMap<String, Object> seatEnterReq(String loginId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = 0;
		int reserveNum = 0;
		
		success = reserveSeatDAO.seatEnterReq(loginId);
		
		logger.info("입실 성공 여부 : "+success);
		
		if(success > 0) {
			reserveNum = reserveSeatDAO.mySeatNum(loginId);
			
			if(reserveNum > 0) {
				reserveSeatDAO.mySeatEnter(loginId,reserveNum);
			}
			
			
		}
		
		map.put("success", success);
		
		return map;
	}

	public HashMap<String, Object> seatExitReq(String loginId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = 0;
		int reserveNum = 0;
		

		reserveNum = reserveSeatDAO.mySeatNum(loginId);
			
		if(reserveNum > 0) {
				//퇴실 이력 업데이트
				reserveSeatDAO.mySeatExit(loginId,reserveNum);
				
				//퇴실하기
				success = reserveSeatDAO.seatExitReq(loginId);
				
				logger.info("퇴실 성공 여부 : "+success);
		}
			
		
		
		map.put("success", success);
		
		return map;
	}

	public HashMap<String, Object> reserveCancelReq(String loginId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int success = 0;
		
		success = reserveSeatDAO.reserveCancelReq(loginId);
		
		if(success > 0) {
			
			logger.info("예약취소 성공 여부 : "+success);
		}

		map.put("success", success);
		
		return map;
	}

	public HashMap<String, Object> mySeatEnterExitHistory(String loginId, int page) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		
		int success = 1;
		
		int pagePerCnt = 5;
		int allCnt = reserveSeatDAO.historyAll(loginId); 		// 전체 게시글 수
		
		logger.info("이력 리스트 개수 : "+allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		//만약 해당 월에 대한 책 개수가 하나도 없다면..
		if(allCnt <= 0) {
			success = 0;
		}
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<MySeatHistoryDTO> history = reserveSeatDAO.mySeatEnterExitHistory(loginId,page,start,end);
		
		logger.info("현재 나의 이력 리스트 개수 : "+history.size());
		
		map.put("history", history);
		map.put("range", range);
		map.put("currPage", page);
		map.put("success", success);
		
		return map;
	}

}
