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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;
	String page = "";
	String msg = "";
	
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("로그인 페이지 이동");
		return "memLogin";
	}
	
	@RequestMapping(value = "/memJoinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("회원가입 페이지 이동");
		return "memJoinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("params:"+params);
		
		page = "joinForm";
		msg = "회원가입에 실패하였습니다.";
		if(service.join(params)>0) {
			page = "redirect:/memLogin";
			msg = "회원가입을 축하드립니다.";
		}
		model.addAttribute("msg",msg);
		return page;
	}
	
	@RequestMapping(value = "/memOverlay", method = RequestMethod.GET)
	public @ResponseBody String memOverlay(@RequestParam String id) {
		logger.info("중복확인 아이디: "+id);
		String str ="";
		int idcheck = service.memOverlay(id);
		if(idcheck==1) {
			str = "no";
		}else {
			str = "yes";
		}
		return str;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam HashMap<String, String> params,
			HttpSession session) {
		logger.info("login : "+params);
		
		String loginId = "";
		
		msg= "아이디 비밀번호를 확인해 주세요";
		page = "memLogin";
		
		if(service.login(params)) {
			loginId = params.get("id");
			logger.info(loginId+" 로그인 성공");
			session.setAttribute("loginId", loginId);
			page="main";
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
	@RequestMapping(value = "/memLogout", method = RequestMethod.GET)
	public String memLogout(HttpSession session) {
		logger.info("로그아웃 요청");
		session.removeAttribute("loginId");
		return "main";
	}
	
	//------------계정찾기관련 영역----------------------------------------
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(Model model) {
		logger.info("계정찾기 페이지 이동");
		return "memFind";
	}
	
	@RequestMapping(value = "/memFindId", method = RequestMethod.GET)
	public String memFindId(Model model) {
		logger.info("아이디찾기 페이지 이동");
		return "memFindId";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public ModelAndView findId(@RequestParam String name,@RequestParam int phone
			,HttpSession session) {
		logger.info("입력한 "+name+"/"+phone);
		ModelAndView mav = new ModelAndView();
		
		String id = service.findId(name,phone);
		logger.info("아이디찾기:"+id);
		
		page = "memFindId";
		msg = "해당 정보와 일치하는 아이디는 없습니다.";
		if(id!=null) {
			page="redirect:/memReId";
			session.setAttribute("name", name);
			session.setAttribute("findId", id);
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/memFindPw", method = RequestMethod.GET)
	public String memFindPw(Model model) {
		logger.info("패스워드찾기 페이지 이동");
		return "memFindPw";
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public ModelAndView findPw(@RequestParam HashMap<String, String> params) {
		logger.info("params:"+params);
		ModelAndView mav = new ModelAndView();
		
		String pw = service.findPw(params);
		
		page = "memFindId";
		msg = "입력한 값을 다시 확인해주세요.";
		if(pw!=null) {
			page="memNewPw";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/memFinId", method = RequestMethod.GET)
	public String memFinId(Model model) {
		logger.info("아이디찾기 결과 페이지 이동");
		return "memFinId";
	}
	
	@RequestMapping(value = "/memReId", method = RequestMethod.GET)
	public String memReId(Model model) {
		logger.info("아이디찾기 결과 페이지 이동");
		return "memReId";
	}
	
	@RequestMapping(value = "/memNewPw", method = RequestMethod.GET)
	public String memNewPw(Model model) {
		logger.info("새로운 비밀번호 페이지 이동");
		return "memNewPw";
	}
	
//	@RequestMapping(value = "/memFindId", method = RequestMethod.GET)
//	public ModelAndView memFindId(@RequestParam HashMap<String, String> params) {
//		logger.info("아이디찾기 요청");
//		return service.memFindId(params);
//	}
	
}
