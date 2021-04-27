package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.LibraryInfoDAO;
import com.spring.main.dto.LibraryInfoDTO;

@Service
public class LibraryInfoService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired LibraryInfoDAO dao;
	public void list_infoNotice(Model model) {
		logger.info("현재위치는 notice의 service 입니다");
		
		ArrayList<LibraryInfoDTO> list = dao.list();
		
		model.addAttribute("list",list);
		
	}
	public void detail_infoNotice(Model model, String idx) {
		logger.info("현재위치는 noticeDetail의 service 입니다");
		
		LibraryInfoDTO dto=dao.noticeDetail(idx);
		
		model.addAttribute("dto",dto);	
	}
	
	public ModelAndView noticeSearch(HashMap<String, Object> params) {
		logger.info("현재위치는 noticeSearch의 service 입니다.");
		
		ArrayList<LibraryInfoDTO> list = dao.searchList(params);
		
		ModelAndView mav = new ModelAndView();
		
		String msg = "검색조건에 맞는 결과물이 없습니다.";
		if(list != null) {
			msg="검색에맞는 조건을 불러왔습니다";
		}		
		mav.addObject("msg",msg);
		mav.addObject("list",list);
		mav.setViewName("notice");
		return mav;
	}

}
