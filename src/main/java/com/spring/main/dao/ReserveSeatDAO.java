package com.spring.main.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.spring.main.dto.MySeatHistoryDTO;
import com.spring.main.dto.ReserveSeatDTO;

public interface ReserveSeatDAO {

	ArrayList<ReserveSeatDTO> seatList();

	ArrayList<ReserveSeatDTO> reserveList();

	int reserveSeatReq(String start, String end, int seatNum, String loginId);

	ArrayList<ReserveSeatDTO> reserSeatChk(String loginId);

	ReserveSeatDTO myReserveSeat(String loginId);

	int seatEnterReq(String loginId);

	int mySeatNum(String loginId);

	void mySeatEnter(String loginId, int reserveNum);

	int seatExitReq(String loginId);

	void mySeatExit(String loginId, int reserveNum);

	int reserveCancelReq(String loginId);

	ArrayList<MySeatHistoryDTO> mySeatEnterExitHistory(String loginId, int start, int end);

	int historyAll(String loginId);

	int reserveTimeChk(String string);

	int exitTimeChk(String string);

	String mySeatEnd(String loginId);

	void autoMySeatExit(String loginId, int reserveNum, String end);

	

}
