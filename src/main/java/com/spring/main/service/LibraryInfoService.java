package com.spring.main.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.LibraryInfoDAO;
import com.spring.main.dto.LibraryInfoDTO;

@Service
public class LibraryInfoService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired LibraryInfoDAO dao;
	
	
	public HashMap<String, Object> list_infoNotice(int pagePerCnt, int page, HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String txt = (String) params.get("search");
		
		if(txt != "" || !txt.equals("")) {
			logger.info("검색값 있음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			params.put("start", start);
			params.put("end", end);
			logger.info("값"+params);
			map.put("list", dao.searchList(params));
			int allCnt = dao.searchCount(params);
			logger.info("올카"+allCnt);
			int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
			logger.info("렌지"+range);
			map.put("range", range);

		} else{
			logger.info("검색값 없음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			map.put("list", dao.list(start,end));	
			int allCnt = dao.allCount();
			logger.info("올카"+allCnt);
			int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
			logger.info(""+range);
			map.put("range", range);
		}
		
		logger.info(""+page);
		return map;
	}
	
	public void detail_infoNotice(Model model, String idx) {
		logger.info("현재위치는 noticeDetail의 service 입니다");

		
		LibraryInfoDTO dto=dao.noticeDetail(idx);
		
		model.addAttribute("dto",dto);	
	}

	public void faq_infoNotice(Model model) {
		ArrayList<LibraryInfoDTO> dto = dao.faq_infoNotice();
		model.addAttribute("dto",dto);
	}

	public ModelAndView faqSearch_infoNotice(HashMap<String, Object> params, RedirectAttributes rAttr) {
		logger.info(""+params);
		
		ArrayList<LibraryInfoDTO> dto = dao.faqSearch_infoNotice(params);
		ModelAndView mav = new ModelAndView();
		 String page ="redirect:/faq";
		 String msg ="찾으시는 자주묻는 질문이 없습니다."; 
		if(dto.size() >0) {
			msg="찾으시는 질문입니다."; 
			page="FAQ";
			mav.addObject("dto",dto);
			mav.addObject("msg",msg);
		}
		rAttr.addFlashAttribute("msg",msg);
		mav.setViewName(page);
		return mav;
		
	}


}
