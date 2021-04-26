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

import com.spring.main.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;
	String page = "";
	String msg = "";
	
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.GET)
	public String home(Model model) {
		return "memLogin";
	}
	
	@RequestMapping(value = "/memJoinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		return "memJoinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("params:"+params);
		
		page = "joinForm";
		if(service.join(params)>0) {
			page = "redirect:/memLogin";
			msg = "회원가입을 축하드립니다.";
		}
		model.addAttribute("msg",msg);
		return page;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String loginId, @RequestParam String loginPw) {
		logger.info(loginId+"/"+loginPw);
		
		msg="아이디 비밀번호를 확인해 주세요";		
		if(service.login(loginId,loginPw)) {
			msg="로그인에 성공 했습니다.";
		}
		model.addAttribute("msg", msg);
		return "main";
	}
	
}
