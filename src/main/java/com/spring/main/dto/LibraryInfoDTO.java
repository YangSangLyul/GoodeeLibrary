package com.spring.main.dto;

import java.sql.Date;

public class LibraryInfoDTO {
	private int noticeidx; //공지게시글번호
	private String id	;	// 회원아이디
	private String subject	; //공지제목 
	private String content; //공지 내용
	private Date reg_date;	//등록일
	private String noticestatus;  //팝업노출여부
	
	public int getNoticeidx() {
		return noticeidx;
	}
	public void setNoticeidx(int noticeidx) {
		this.noticeidx = noticeidx;
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
	public String getNoticestatus() {
		return noticestatus;
	}
	public void setNoticestatus(String noticestatus) {
		this.noticestatus = noticestatus;
	}
	
}
