package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.ReviewDTO;

public interface ReviewDao2 { //리뮤 모아보기용

	ArrayList<ReviewDTO> reviewList(int start, int end);

	ArrayList<ReviewDTO> reviewIdList(String id);
	
	ArrayList<ReviewDTO> reviewIdComm(String id);

	ArrayList<ReviewDTO> reviewCom(int start, int end);

	ReviewDTO reviewDetail(String reviewIdx);

	ReviewDTO reviewReportForm(String reviewIdx);

	int reviewReport(ReviewDTO dto);

	void reportCntUp(int reviewIdx);

	String overReport(ReviewDTO dto);

	int review_AllCount();

	int likeChk(int reviewIdx, String id);

	void likeupdate(int reviewIdx, String id);

	void likedelete(int reviewIdx, String id);

	int like_cnt(int reviewIdx);

	void upLike(int reviewIdx);

	void downLike(int reviewIdx);

	
}
