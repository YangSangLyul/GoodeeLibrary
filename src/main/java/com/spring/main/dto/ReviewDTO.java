package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewDTO { 
	
		//리뷰
	   private int reviewIdx;
	   private String content;
	   private String id; //리뷰작성 회원이자 신고하는 회원 아이디
	   private Date reg_date;
	   private int reportCnt;
	   private String blind_status;
	   private int cnt; //추천수
	   private int month_rcnt;
	   private int bookIdx;
	   
	   //도서
		private String bookName;
		private String bookImg;
		private String writer;
		private String story;
		private String publisher;
		
		//리뷰신고
		private int reportIdx;
		private String reportId; //신고당한 아이디
		private Date reportDate;
		private String reportReason;
		private String reportStatus;
	   
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
		public Date getReportDate() {
			return reportDate;
		}
		public void setReportDate(Date reportDate) {
			this.reportDate = reportDate;
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

	   
}
