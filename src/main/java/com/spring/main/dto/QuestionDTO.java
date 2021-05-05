package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("question")
public class QuestionDTO {
	private int queIdx;
	private String id;
	private String subject;
	private String content;
	private Date reg_date;
	private String showStatus;
	private String ansStatus;
	private String type;
	
	public int getQueIdx() {
		return queIdx;
	}
	public void setQueIdx(int queIdx) {
		this.queIdx = queIdx;
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
	public String getShowStatus() {
		return showStatus;
	}
	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
	}
	public String getAnsStatus() {
		return ansStatus;
	}
	public void setAnsStatus(String ansStatus) {
		this.ansStatus = ansStatus;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
