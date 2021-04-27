package com.spring.main.dto;

import oracle.sql.DATE;

public class AdminDTO {
	
   private int reviewIdx;
   private String content;
   private String id;
   private DATE reg_date;
   private int reportCnt;
   private String blind_status;
   private int cnt;
   private int month_rcnt;
   private int bookIdx;
   
   private DATE recom_date;
   private int rnum;
   private int upHit;
   private int reviewCnt;   
   
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public DATE getReg_date() {
		return reg_date;
	}
	public void setReg_date(DATE reg_date) {
		this.reg_date = reg_date;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public String getBlind_status() {
		return blind_status;
	}
	public void setBlind_status(String blind_status) {
		this.blind_status = blind_status;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getMonth_rcnt() {
		return month_rcnt;
	}
	public void setMonth_rcnt(int month_rcnt) {
		this.month_rcnt = month_rcnt;
	}
	public int getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}
	public DATE getRecom_date() {
		return recom_date;
	}
	public void setRecom_date(DATE recom_date) {
		this.recom_date = recom_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getUpHit() {
		return upHit;
	}
	public void setUpHit(int upHit) {
		this.upHit = upHit;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
   
}
