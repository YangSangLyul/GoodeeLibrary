package com.spring.main.dto;

import java.sql.Date;
import java.util.HashSet;

import org.apache.ibatis.type.Alias;

@Alias("book")
public class BookDTO {

	private int bookIdx;
	private String bookName;
	private String bookImg;
	private String writer;
	private String story;
	private String publisher;
	private Date reg_date;
	private String bookState;
	private HashSet<ReserveBookDTO> reserveBookDTO;
	
	public HashSet<ReserveBookDTO> getReserveBookDTO() {
		return reserveBookDTO;
	}
	public void setReserveBookDTO(HashSet<ReserveBookDTO> reserveBookDTO) {
		this.reserveBookDTO = reserveBookDTO;
	}
	public int getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookImg() {
		return bookImg;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
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

	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	
}
