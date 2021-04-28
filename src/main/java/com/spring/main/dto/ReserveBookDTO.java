package com.spring.main.dto;

import java.sql.Date;
import java.util.Objects;

import org.apache.ibatis.type.Alias;

@Alias("reserveBook")
public class ReserveBookDTO {
	private int reserveBookIdx;
	private int bookIdx;
	private String id;
	private Date reg_date;
	private String bookState;
	
	public int getReserveBookIdx() {
		return reserveBookIdx;
	}
	public void setReserveBookIdx(int reserveBookIdx) {
		this.reserveBookIdx = reserveBookIdx;
	}
	public int getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
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
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	@Override
	public boolean equals(Object obj) {
		ReserveBookDTO dto = (ReserveBookDTO)obj;
		return (dto.bookIdx == this.bookIdx);
	}
	@Override
	public int hashCode() {
		return Objects.hash(bookIdx);
	}
	
}

