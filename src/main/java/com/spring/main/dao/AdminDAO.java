package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.BookDTO;

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

<<<<<<< HEAD
	ArrayList<AdminDTO> adminNotice();

	int noticeWrite(HashMap<String, Object> params);
=======
	int questionCnt();

	ArrayList<BookDTO> questionList(int start, int end);
>>>>>>> 68eec330f4b09c542fb137ad745f17ad27bce56b


}
