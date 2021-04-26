package com.spring.main.dto;

import java.sql.Date;

public class BookDTO {
	
	private int bookidx;
	private String bookname;
	private String bookimg;
	private String writer;
	private String story;
	private String publisher;
	private Date reg_date;
	private String bookstate;
	
	public int getBookidx() {
		return bookidx;
	}
	public void setBookidx(int bookidx) {
		this.bookidx = bookidx;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getBookstate() {
		return bookstate;
	}
	public void setBookstate(String bookstate) {
		this.bookstate = bookstate;
	}
	
	
	

}
