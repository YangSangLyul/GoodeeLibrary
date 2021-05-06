package com.spring.main.dto;

import java.sql.Date;

public class AdminDTO {

	//Review
   private int reviewIdx;
   private String content;
   private String id;
   private Date reg_date;
   private int reportCnt;
   private String blind_status;
   private int cnt; //리뷰수,추천수
   private int month_rcnt;
   private int bookIdx;  
   private Date recom_date; //ReviewRecommend 선정날짜
   private int rnum; //순위 정렬
   
   //ReviewReport
   private int reportIdx;
   private String reportId;
   private Date reportdate;
   private String reportReason;
   private String reportStatus;
   
   //ReviewBlind
   private int blindIdx;
   private String blindReason;
   private Date blind_date;
   
   //알림
   private int noticeIdx;
   private String noType;
   private String readStatus;
   private Date read_date;
   private String mem_type;
   
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public String getNoType() {
		return noType;
	}
	public void setNoType(String noType) {
		this.noType = noType;
	}
	public String getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}
	public Date getRead_date() {
		return read_date;
	}
	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
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
	public Date getRecom_date() {
		return recom_date;
	}
	public void setRecom_date(Date recom_date) {
		this.recom_date = recom_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getReportIdx() {
		return reportIdx;
	}
	public void setReportIdx(int reportIdx) {
		this.reportIdx = reportIdx;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public Date getReportdate() {
		return reportdate;
	}
	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public Date getBlind_date() {
		return blind_date;
	}
	public void setBlind_date(Date blind_date) {
		this.blind_date = blind_date;
	}
	public int getBlindIdx() {
		return blindIdx;
	}
	public void setBlindIdx(int blindIdx) {
		this.blindIdx = blindIdx;
	}
	public String getBlindReason() {
		return blindReason;
	}
	public void setBlindReason(String blindReason) {
		this.blindReason = blindReason;
	}
   
}
