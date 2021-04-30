package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.ReserveSeatDTO;

public interface ReserveSeatDAO {

	ArrayList<ReserveSeatDTO> seatList();

	ArrayList<ReserveSeatDTO> reserveList();

	int reserveSeatReq(String start, String end, int seatNum, String loginId);

	ArrayList<ReserveSeatDTO> reserSeatChk(String loginId);

}
