package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("hopeBookReject")
public class HopeBookRejectDTO {

	private int hopeBooksNumber;
	private String reject;
	private Date reject_date;
	
	public int getHopeBooksNumber() {
		return hopeBooksNumber;
	}
	public void setHopeBooksNumber(int hopeBooksNumber) {
		this.hopeBooksNumber = hopeBooksNumber;
	}
	public String getReject() {
		return reject;
	}
	public void setReject(String reject) {
		this.reject = reject;
	}
	public Date getReject_date() {
		return reject_date;
	}
	public void setReject_date(Date reject_date) {
		this.reject_date = reject_date;
	}
	
	
	
}
