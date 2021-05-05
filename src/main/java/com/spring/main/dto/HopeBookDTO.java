package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("hopeBook")
public class HopeBookDTO {
	
	//hopebook 테이블
	private int hopeBooksNumber;
	private String id;
	private String hb_state;
	private Date hb_date;
	private String hb_bookName;
	private String writer;
	private String publisher;
	private String hopeReason;
	private HopeBookRejectDTO hopeBookRejectDTO;
	
	//hopebookReject 테이블
	private String reject;
	private Date reject_date;
	
	
	public HopeBookRejectDTO getHopeBookReject() {
		return hopeBookRejectDTO;
	}
	public void setHopeBookReject(HopeBookRejectDTO hopeBookReject) {
		this.hopeBookRejectDTO = hopeBookReject;
	}
	public int getHopeBooksNumber() {
		return hopeBooksNumber;
	}
	public void setHopeBooksNumber(int hopeBooksNumber) {
		this.hopeBooksNumber = hopeBooksNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHb_state() {
		return hb_state;
	}
	public void setHb_state(String hb_state) {
		this.hb_state = hb_state;
	}
	public Date getHb_date() {
		return hb_date;
	}
	public void setHb_date(Date hb_date) {
		this.hb_date = hb_date;
	}
	public String getHb_bookName() {
		return hb_bookName;
	}
	public void setHb_bookName(String hb_bookName) {
		this.hb_bookName = hb_bookName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getHopeReason() {
		return hopeReason;
	}
	public void setHopeReason(String hopeReason) {
		this.hopeReason = hopeReason;
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
