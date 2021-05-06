package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.ReviewDTO;

public interface ReviewDao2 { //리뮤 모아보기용

	ArrayList<ReviewDTO> reviewList();

	ArrayList<ReviewDTO> reviewIdList(String id);

	ArrayList<ReviewDTO> reviewCom();

	ReviewDTO reviewDetail(String reviewIdx);

	ReviewDTO reviewReportForm(String reviewIdx);

	int reviewReport(ReviewDTO dto);

	void reportCntUp(int reviewIdx);

	String overReport(ReviewDTO dto);


}
