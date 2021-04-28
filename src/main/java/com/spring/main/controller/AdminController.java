package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.AdminService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	//이 달의 리뷰왕 리스트 
	@RequestMapping(value = "/ReviewKing", method = RequestMethod.GET)
	public ModelAndView ReviewKing(Model model) {
		logger.info("이달의리뷰왕 요청");
		return service.reviewkingList();
	}
	
	//이 달의 리뷰왕 선정
	@RequestMapping(value = "/selectKing", method = RequestMethod.POST)
	public String selectKing(@RequestParam  HashMap<String, Object> tdArr, RedirectAttributes attr) {
		logger.info("이달의리뷰왕: "+tdArr);	
		//logger.info(tdArr.get(key));
		logger.info(""+tdArr.get("tdArr[0][id]"));
		ArrayList<String> idList = new ArrayList<String>();
		idList.add((String) tdArr.get("tdArr[0][id]"));
		idList.add((String) tdArr.get("tdArr[1][id]"));
		idList.add((String) tdArr.get("tdArr[2][id]"));
		logger.info("idList: "+idList);
		
		ArrayList<String> cntList = new ArrayList<String>();
		cntList.add((String) tdArr.get("tdArr[0][cnt]"));
		cntList.add((String) tdArr.get("tdArr[1][cnt]"));
		cntList.add((String) tdArr.get("tdArr[2][cnt]"));
		logger.info("cntList: "+cntList);
		
		//String msg = ""; 
		int success = service.selectKing(idList,cntList); 
		logger.info("success: "+success);
		/*
		 * if(success>0) { msg = "이 달의 리뷰왕 선정을 완료했습니다."; }
		 */ 
		//attr.addFlashAttribute("msg", msg); 
		return "redirect:/ReviewKing";
	}
	
	//리뷰왕 선정 시 다음 달 까지 버튼 숨김
	@RequestMapping(value = "/hideBtn", method = RequestMethod.GET)
	public ModelAndView hideBtn(Model model) {
		logger.info("버튼숨김 요청");
		ModelAndView mav = new ModelAndView();
		int success = 0;
		if(service.hideBtn().size()>0) {
			success = 1;
		}
		mav.addObject("hide", success);
		mav.setViewName("redirect:/ReviewKing");
		return mav;
	}
}
