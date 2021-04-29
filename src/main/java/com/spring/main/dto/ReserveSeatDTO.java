package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("seat")
public class ReserveSeatDTO {
	
	private int seatNumber;
	private int reserveNumber;
	private String id;
	private Date reserveEnd;
	private Date reserveStart;
	private Date resrv_date;
	private String seatStatus;
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getReserveNumber() {
		return reserveNumber;
	}
	public void setReserveNumber(int reserveNumber) {
		this.reserveNumber = reserveNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getReserveEnd() {
		return reserveEnd;
	}
	public void setReserveEnd(Date reserveEnd) {
		this.reserveEnd = reserveEnd;
	}
	public Date getReserveStart() {
		return reserveStart;
	}
	public void setReserveStart(Date reserveStart) {
		this.reserveStart = reserveStart;
	}
	public Date getResrv_date() {
		return resrv_date;
	}
	public void setResrv_date(Date resrv_date) {
		this.resrv_date = resrv_date;
	}
	public String getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(String seatStatus) {
		this.seatStatus = seatStatus;
	}
	
	
	

}
