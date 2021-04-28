package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedMap;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.LibraryInfoDAO;
import com.spring.main.dto.LibraryInfoDTO;

@Service
public class LibraryInfoService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired LibraryInfoDAO dao;
	
	public ModelAndView detail_infoNotice(String idx) {
		logger.info("현재위치는 noticeDetail의 service 입니다");
		
		LibraryInfoDTO dto=dao.noticeDetail(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.setViewName("noticeDetail");
		
		return mav;
	}


	public HashMap<String, Object> list_infoNotice(int pagePerCnt, int page, HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		logger.info(""+params);
//		logger.info(""+pagePerCnt);
//		logger.info(""+params.put("search",2));
//		logger.info(""+params.put("searchSelect",1));
		
		String txt = (String) params.get("search");
		
		if(txt != "" || !txt.equals("")) {
			logger.info("검색값 있음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			map.put("list", dao.searchList(params));
			int allCnt = dao.searchCount(params);
			int range=allCnt%pagePerCnt >0 ?Math.round(allCnt/pagePerCnt)+1:Math.round(allCnt/pagePerCnt);
			map.put("range", range);

		} else{
			logger.info("검색값 없음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			map.put("list", dao.list(start,end));	
			int allCnt = dao.allCount();
			int range=allCnt%pagePerCnt >0 ?Math.round(allCnt/pagePerCnt)+1:Math.round(allCnt/pagePerCnt);
			map.put("range", range);
		}
		
		logger.info(""+page);
		
		map.put("currPage", page);
		
		return map;
	}


	public HashMap<String, Object> noticeSearch(HashMap<String, Object> params) {
		logger.info(""+params);
		
		ArrayList<LibraryInfoDTO> list = dao.searchList(params);
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		return map;
	}

}
