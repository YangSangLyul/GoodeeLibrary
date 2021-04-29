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
	
	private int queidx; //질문의 게시글번호
	private String showstatus; //보여지는상태값 트펄 nvarchar2
	private String ansstatus; // 질문을 해준것과안해준것
	private String type; //타입 q001/~~4까지
	
	
	public int getQueidx() {
		return queidx;
	}
	public void setQueidx(int queidx) {
		this.queidx = queidx;
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
	
	//여까지 추가된 question의 dto
	
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
