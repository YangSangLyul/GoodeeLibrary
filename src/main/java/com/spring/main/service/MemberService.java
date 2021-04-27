package com.spring.main.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MemberDAO;

@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	String page="";
	String msg="";
	
	public int join(HashMap<String, String> params) {
		String plain = params.get("userPw");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encrypt = encoder.encode(plain);
		logger.info(plain+"=>"+encrypt);
		params.put("userPw", encrypt);	
		
		return dao.join(params);
	}

	public String memOverlay(String id) {
		String str ="";
		int idcheck = dao.memOverlay(id);
		if(idcheck==1) {
			str = "no";
		}else {
			str = "yes";
		}
		return str;
	}
	
	public boolean login(HashMap<String, String> params) {
		String encrypt_pass = dao.login(params.get("id"));
		String pw = params.get("pw");
		logger.info(pw+"=="+encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(pw, encrypt_pass);
	}
	
//------------계정찾기관련 영역----------------------------------------
	
	public ModelAndView findId(String name, int phone,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String id = dao.findId(name, phone);
		page = "memFindId";
		msg = "해당 정보와 일치하는 아이디는 없습니다.";
		if(id!=null) {
			page="memReId";
			session.setAttribute("name", name);
			session.setAttribute("findId", id);
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView findPw(HashMap<String, String> params,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String id = dao.findPw(params);
		page = "memFindPw";
		msg = "입력한 값을 다시 확인해주세요.";
		if(id!=null) {
			page="memNewPw";
			session.setAttribute("findId", id);
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public String newPw(String newPw) {
		
		boolean success = dao.newPw(newPw);
		page = "memNewPw";
		msg = "비밀번호를 다시 입력해주세요.";
		
		if(success==true) {
			page = "memLogin";
			msg = "비밀번호를 재설정하였습니다. 다시 로그인해주세요.";
		}
		return null;
	}

}
