package com.spring.main.dto;

import java.sql.Date;
import java.util.HashSet;

import org.apache.ibatis.type.Alias;

@Alias("myLibrary")
public class MyLibraryDTO {
	//문의
	private int queidx;
	private String id;
	private String subject;
	private String content;
	private Date reg_date;
	private String showstatus;
	private String ansstatus;
	private String type;
	
	//책 & 예약
	private String answer;
	private int bookIdx;
	private String bookName;
	private String bookImg;
	private String writer;
	private String story;
	private String publisher;
	private String bookState;
	private HashSet<ReserveBookDTO> reserveBookDTO;
	
	//희망도서
	private int hopeBooksNumber;
	private String hb_state;
	private Date hb_date;
	private String hb_bookName;
	private String hopeReason;
	
	public int getHopeBooksNumber() {
		return hopeBooksNumber;
	}
	public void setHopeBooksNumber(int hopeBooksNumber) {
		this.hopeBooksNumber = hopeBooksNumber;
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
	public String getHopeReason() {
		return hopeReason;
	}
	public void setHopeReason(String hopeReason) {
		this.hopeReason = hopeReason;
	}
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

	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQueidx() {
		return queidx;
	}
	public void setQueidx(int queidx) {
		this.queidx = queidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getShowstatus() {
		return showstatus;
	}
	public void setShowstatus(String showstatus) {
		this.showstatus = showstatus;
	}
	public String getAnsstatus() {
		return ansstatus;
	}
	public void setAnsstatus(String ansstatus) {
		this.ansstatus = ansstatus;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
