package com.spring.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("QPhoto")
public class QuestionPhotoDTO {
	private int quephotoidx;
	private int queidx;
	private String orifilename;
	private String newfilename;
	
	
	public int getQuephotoidx() {
		return quephotoidx;
	}
	public void setQuephotoidx(int quephotoidx) {
		this.quephotoidx = quephotoidx;
	}
	public int getQueidx() {
		return queidx;
	}
	public void setQueidx(int queidx) {
		this.queidx = queidx;
	}
	public String getOrifilename() {
		return orifilename;
	}
	public void setOrifilename(String orifilename) {
		this.orifilename = orifilename;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

}
