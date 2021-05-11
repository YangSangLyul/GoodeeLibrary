package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.ReserveSeatDAO;
import com.spring.main.dto.BookDTO;
import com.spring.main.dto.MySeatHistoryDTO;
import com.spring.main.dto.ReserveSeatDTO;

@Service
public class reserveSeatService {

	@Autowired
	ReserveSeatDAO reserveSeatDAO;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 스케쥴러는 서버가 꺼지기 전 까지 멈출 수 없다.
	// @Scheduled(fixedDelay = 5000) // 5초마다 실행
	@Scheduled(cron = "0 0/10 * * * *") // 초 분 시 일 월 요일 연도(생략가능)
	public void enterTimeChk() {

		Calendar cal = Calendar.getInstance();

		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int success = 0;

		if (min == 10) {
			if (hour == 9 || hour == 10 || hour == 11 || hour == 12 || hour == 13 || hour == 14 || hour == 15
					|| hour == 16 || hour == 17) {
				System.out.println("현재" + hour + "시이 지났습니다");
				System.out.println("예약시간 + 10분까지 입실 안한 사람들의 상태값을 모두 변경합니다.");
				success = reserveSeatDAO.reserveTimeChk(Integer.toString(hour));

				if (success > 0) {
					System.out.println("입실 안한 사람의 예약을 해제하였습니다.");
				} else {
					System.out.println("입실 안한 사람이 없습니다.");
				}
			}

		}

	}

	@Scheduled(cron = "0 0 0/1 * * *") // 초 분 시 일 월 요일 연도(생략가능)
	public void exitTimeChk() {

		Calendar cal = Calendar.getInstance();

		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int success = 0;

		if (min == 00 || min == 0) {
			if (hour >= 10 && hour <= 24) {
				System.out.println("현재" + hour + "시 입니다.");
				System.out.println("매 시 정각마다 퇴실 여부를 확인 후 미퇴실 좌석의 시간대는 자동 퇴실 처리 됩니다.");
				success = reserveSeatDAO.exitTimeChk(Integer.toString(hour));

				if (success > 0) {
					System.out.println(hour + " 시간대 퇴실처리 완료.");

				} else {
					System.out.println("퇴실 대상 좌석및시간대가 없습니다.");
				}
			}

		}

	}

	public ModelAndView reserveSeatList() {

		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<ReserveSeatDTO> numList = reserveSeatDAO.seatList();

		if (numList != null) {
			ArrayList<ReserveSeatDTO> reserveList = reserveSeatDAO.reserveList();
			logger.info("reserveList 개수 : " + reserveList.size());
			mav.addObject("reserveList", reserveList);
			mav.addObject("list", numList);
		}

		mav.setViewName("reserveSeatForm");

		return mav;
	}

	public String reserveSeatReq(String[] seatTime, int seatNum, String loginId, RedirectAttributes rAttr) {

		ModelAndView mav = new ModelAndView();

		String start = seatTime[0] + ":00";
		String end = seatTime[seatTime.length - 1] + ":00";
		String msg = "";

		logger.info("시작시작 " + start + " , 종료시간 : " + end);

		ArrayList<ReserveSeatDTO> id = reserveSeatDAO.reserSeatChk(loginId);

		if (id.size() > 0) {
			msg = "이미 좌석 예약을 하셨거나 사용중인 좌석이 있습니다.";
		} else {
			int success = reserveSeatDAO.reserveSeatReq(start, end, seatNum, loginId);

			if (success > 0) {
				msg = "좌석 예약에 성공했습니다!";
			}

		}

		rAttr.addFlashAttribute("msg", msg);
		return "redirect:/reserveSeatForm";
	}

	public ModelAndView myReserveSeat(String loginId) {

		ModelAndView mav = new ModelAndView();

		if (loginId == null) {
			mav.setViewName("myLib_reserveSeatInOut");
			return mav;
		}

		ReserveSeatDTO mySeat = reserveSeatDAO.myReserveSeat(loginId);

		logger.info("내 좌석이 있는지 확인하기 : " + mySeat);

		if (mySeat != null) {
			mav.addObject("mySeat", mySeat);
		}

		mav.setViewName("myLib_reserveSeatInOut");

		return mav;
	}

	public HashMap<String, Object> seatEnterReq(String loginId) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = 0;
		int reserveNum = 0;
		String end;
		
		
		success = reserveSeatDAO.seatEnterReq(loginId);

		logger.info("입실 성공 여부 : " + success);

		if (success > 0) {
			reserveNum = reserveSeatDAO.mySeatNum(loginId);
			end = reserveSeatDAO.mySeatEnd(loginId);
			
			if (reserveNum > 0) {
				reserveSeatDAO.mySeatEnter(loginId, reserveNum);
				reserveSeatDAO.autoMySeatExit(loginId, reserveNum,end);
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

		if (reserveNum > 0) {
			// 퇴실 이력 업데이트
			reserveSeatDAO.mySeatExit(loginId, reserveNum);

			// 퇴실하기
			success = reserveSeatDAO.seatExitReq(loginId);

			logger.info("퇴실 성공 여부 : " + success);
		}

		map.put("success", success);

		return map;
	}

	public HashMap<String, Object> reserveCancelReq(String loginId) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = 0;

		success = reserveSeatDAO.reserveCancelReq(loginId);

		if (success > 0) {

			logger.info("예약취소 성공 여부 : " + success);
		}

		map.put("success", success);

		return map;
	}

	public HashMap<String, Object> mySeatEnterExitHistory(String loginId, int page) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = 1;

		int pagePerCnt = 5;
		int allCnt = reserveSeatDAO.historyAll(loginId); // 전체 게시글 수

		logger.info("이력 리스트 개수 : " + allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt / pagePerCnt)) + 1
				: Math.floor((allCnt / pagePerCnt)));

		// 만약 해당 월에 대한 책 개수가 하나도 없다면..
		if (allCnt <= 0) {
			success = 0;
		}

		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;

		logger.info("start : " + start + " / end : " + end);

		ArrayList<MySeatHistoryDTO> history = reserveSeatDAO.mySeatEnterExitHistory(loginId, start, end);

		logger.info("현재 나의 이력 리스트 개수 : " + history.size());

		map.put("history", history);
		map.put("range", range);
		map.put("currPage", page);
		map.put("success", success);

		return map;
	}

}
