package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;

public interface AdminDAO {

	ArrayList<AdminDTO> manyUp();
	
	ArrayList<AdminDTO> manyReview();

	int selectKing(String id, String cnt);

	ArrayList<String> hideBtn();

	ArrayList<AdminDTO> ReportList(int start, int end);

	ArrayList<AdminDTO> BlindList(int start, int end);

	AdminDTO reportDetail(int idx);

	AdminDTO blindReason(int reportIdx, int reviewIdx);

	int blindReasonTxt(HashMap<String, Object> params);

	int reportFal(HashMap<String, Object> params);

	int ignore(int reportIdx);

	int blindRemove(int blindIdx);

	int allCount();

	ArrayList<AdminDTO> adminNoti();


}
