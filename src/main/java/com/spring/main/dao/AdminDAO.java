package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.AdminDTO;

public interface AdminDAO {

	ArrayList<AdminDTO> manyUp();
	
	ArrayList<AdminDTO> manyReview();

	int selectKing(String id, String cnt);

	ArrayList<String> hideBtn();

	ArrayList<AdminDTO> ReportList();

	ArrayList<AdminDTO> BlindList();

	AdminDTO reportDetail(String idx);


}
