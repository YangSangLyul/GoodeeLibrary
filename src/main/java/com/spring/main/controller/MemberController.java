package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.MemberDTO;
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
		return service.memOverlay(id);
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
			msg = loginId+"님 반갑습니다.";
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
	public ModelAndView findId(@RequestParam String name,@RequestParam int phone, HttpSession session) {
		logger.info("입력한 "+name+"/"+phone);
		return service.findId(name,phone,session);
	}
	
	@RequestMapping(value = "/memFindPw", method = RequestMethod.GET)
	public String memFindPw(Model model) {
		logger.info("비밀번호찾기 페이지 이동");
		return "memFindPw";
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public ModelAndView findPw(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("입력한 params:"+params);
		return service.findPw(params,session);
	}
	
	@RequestMapping(value = "/newPw", method = RequestMethod.POST)
	public ModelAndView newPw(@RequestParam String newPw,HttpSession session) {
		return service.newPw(newPw,session);
	}
	
	//------------마이라이브러리 내 영역----------------------------------------
	
	@RequestMapping(value = "/myLib_Update")
	public String myLib_Update(Model model) {
		logger.info("회원정보 수정/탈퇴 페이지 이동");
		return "myLib_Update";
	}
	
//	@RequestMapping(value = "/myLib_mem")
//	public String memUpdate(Model model,@RequestParam String pw,HttpSession session) {
//		logger.info("비밀번호 확인:"+pw);
//		return service.mylib_mem(pw);
//	}
	
	@RequestMapping(value = "/myLib_UpdateForm")
	public String myLib_UpdateForm(Model model,HttpSession session) {
		String page = "myLib_UpdateForm";
		logger.info("회원정보 수정페이지 이동");
		model.addAttribute("dto", service.myLib_UpdateForm(session));			
		return page;
	}
	
	@RequestMapping(value = "/memUpdate")
	public ModelAndView memUpdate(@ModelAttribute MemberDTO dto,HttpSession session) {
		logger.info("회원정보 수정요청");
		return service.memUpdate(dto,session);
	}
	
	@RequestMapping(value = "/memWithdraw", method = RequestMethod.GET)
	public ModelAndView memWithdraw(Model model,HttpSession session) {
		return service.memWithdraw(session);
	}
	
	@RequestMapping(value = "/myLib_UpdatePwForm")
	public String myLib_UpdatePwForm(Model model) {
		logger.info("회원 비밀번호 변경 페이지로 이동");
		return "myLib_UpdatePwF";
	}
	

}
