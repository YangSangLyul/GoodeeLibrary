package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
		msg = "회원가입에 실패하였습니다.";
		if(service.join(params)>0) {
			page = "memLogin";
			msg = "회원가입을 축하드립니다.";
		}
		model.addAttribute("msg",msg);
		return page;
	}
	
	@RequestMapping(value = "/memOverlay", method = RequestMethod.GET)
	public String memOverlay(Model model,@RequestParam String id) {
		logger.info("중복확인 아이디:"+id);
		return service.memOverlay(id);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String id, @RequestParam String pw) {
		logger.info(id+"/"+pw);
		
		msg= "아이디 비밀번호를 확인해 주세요";
		page = "memLogin";
		if(service.login(id,pw)) {
			msg= "로그인에 성공 했습니다.";
			page = "main";
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
	/*@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String id, @RequestParam String pw, HttpSession session) {
		logger.info(id+"/"+pw);
		
		msg= "아이디 비밀번호를 확인해 주세요";
		page = "memLogin";
		
		boolean loginId = service.login(id,pw);
		if(session.getAttribute("loginId") == null) {
			msg = "??";
		}else {
			logger.info(loginId+" 로그인 성공");
			session.setAttribute("loginId", loginId);
			msg= "로그인에 성공 했습니다.";
			page = "main";
		}
		model.addAttribute("msg", msg);
		return page;
	}*/
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(Model model) {
		return "memFind";
	}
	
}
