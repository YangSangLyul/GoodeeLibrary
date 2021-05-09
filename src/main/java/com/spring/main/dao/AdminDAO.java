package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.BookDTO;
import com.spring.main.dto.LibraryInfoDTO;
import com.spring.main.dto.QuestionDTO;

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

	ArrayList<AdminDTO> adminNotice(int start, int end);

	int noticeWrite(HashMap<String, Object> params);
	int questionCnt();

	ArrayList<BookDTO> questionList(int start, int end);

	LibraryInfoDTO noticeDetail(int idx);

	int noticeDel(int idx);

	int noticeUpdate(HashMap<String, Object> params);

	QuestionDTO questionDetail(String queIdx);

	String questionAnsstatus(String queIdx);

	int questionAnswer(HashMap<String, Object> params);

	void questionAnswerStatus(HashMap<String, Object> params);


}
