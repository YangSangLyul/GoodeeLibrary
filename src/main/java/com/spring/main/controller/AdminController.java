package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.AdminService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/ReviewKing", method = RequestMethod.GET)
	public ModelAndView ReviewKing(Model model) {
		logger.info("이달의리뷰왕 요청");
		return service.reviewkingList();
	}
	
	@RequestMapping(value = "/selectKing", method = RequestMethod.GET)
	public String selectKing(@RequestParam HashMap<String, Object> params, RedirectAttributes attr) {
		logger.info("이달의리뷰왕: "+params);		
		String msg = "";
		int success = service.selectKing(params);
		if(success>0) {
			msg = "이 달의 리뷰왕 선정을 완료했습니다.";
		}
		attr.addFlashAttribute("msg", msg);
		return "redirect:/ReviewKing";
	}
	

}
