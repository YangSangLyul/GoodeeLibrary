package com.spring.main.dao;

import java.util.ArrayList;

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

}
