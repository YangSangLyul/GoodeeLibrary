package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;

@Service
public class AdminService {
	
	@Autowired AdminDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView reviewkingList() {
		logger.info("리뷰왕 쿼리 요청");
		ModelAndView mav = new ModelAndView();		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AdminDTO> manyUp = dao.manyUp();
		ArrayList<AdminDTO> manyReview = dao.manyReview();
		map.put("manyUp", manyUp);
		map.put("manyReview", manyReview);
		
		mav.addObject("king", map);		
		mav.setViewName("adminReviewKing");

		return mav;
	}

	public int selectKing(ArrayList<String> idList, ArrayList<String> cntList) {
		logger.info("리뷰왕 INSERT 쿼리 요청");
		String id = "";
		String cnt = "";
		int success = 0;
		
		for (int i = 0; i < idList.size(); i++) {
			id = idList.get(i);
			logger.info("idList: "+idList.get(i));
			cnt = cntList.get(i);
			logger.info("cntList: "+cntList.get(i));
			success = dao.selectKing(id,cnt);
		}				
		logger.info("서비스 success: "+success);
	    return success;
	}

	public HashMap<String, Object> hideBtn() {
		logger.info("현재날짜와 매치 쿼리 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> hide = dao.hideBtn();
		map.put("hide",hide);
		logger.info("map: "+map);
		if(map.size()>0) {
			logger.info("이미 리뷰왕 선정 했음");
		}
		return map;
	}

	public ModelAndView ReportList() {
		logger.info("신고리스트 쿼리 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<AdminDTO> ReportList = dao.ReportList();
		mav.addObject("report", ReportList);
		mav.setViewName("adminReport");
		return mav;
	}

	public ModelAndView BlindList() {
		logger.info("블라인드 리스트 쿼리 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<AdminDTO> BlindList = dao.BlindList();
		mav.addObject("blind", BlindList);
		mav.setViewName("adminBlind");
		return mav;
	}

	public AdminDTO reportDetail(String idx) {
		logger.info("신고 상세보기 쿼리 요청");
		return dao.reportDetail(idx);
	}
	
	
}
