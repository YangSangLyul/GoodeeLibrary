package com.spring.main.dto;

import java.sql.Date;

public class LibraryInfoDTO {
	private int noticeidx; //공지게시글번호
	private String id	;	// 회원아이디
	private String subject	; //공지제목 
	private String content; //공지 내용
	private Date reg_date;	//등록일
	private String noticestatus;  //팝업노출여부
	
	private int faqidx; //faq의  게시글번호
	private String anwser; //질문에대한답변
	
	public int getFaqidx() {
		return faqidx;
	}
	public void setFaqidx(int faqidx) {
		this.faqidx = faqidx;
	}
	public String getAnwser() {
		return anwser;
	}
	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
// 	여까지 faq의 추가된 dto
	
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
