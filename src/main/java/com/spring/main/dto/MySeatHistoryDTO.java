package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("useSeat")
public class MySeatHistoryDTO {
	
	private Date useStart;
	private Date useEnd;
	private String id;
	public Date getUseStart() {
		return useStart;
	}
	public void setUseStart(Date useStart) {
		this.useStart = useStart;
	}
	public Date getUseEnd() {
		return useEnd;
	}
	public void setUseEnd(Date useEnd) {
		this.useEnd = useEnd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
