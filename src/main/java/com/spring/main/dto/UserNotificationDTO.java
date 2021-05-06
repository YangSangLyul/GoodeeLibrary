package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("userNotification")
public class UserNotificationDTO {
	
	private int noticeIdx;
	private String id;
	private String noType;
	private String content;
	private String readstatus;
	private Date read_date;
	private String mem_type;
	private int reserveBookIdx;
	
	
	
	public int getReserveBookIdx() {
		return reserveBookIdx;
	}
	public void setReserveBookIdx(int reserveBookIdx) {
		this.reserveBookIdx = reserveBookIdx;
	}
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNoType() {
		return noType;
	}
	public void setNoType(String noType) {
		this.noType = noType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadstatus() {
		return readstatus;
	}
	public void setReadstatus(String readstatus) {
		this.readstatus = readstatus;
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
	
	

}
