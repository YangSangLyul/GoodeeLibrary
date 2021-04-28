package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("question")
public class QuestionDTO {
	private int queidx;
	private String id;
	private String subject;
	private String content;
	private Date reg_date;
	private String showstatus;
	private String ansstatus;
	private String type;
	
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
