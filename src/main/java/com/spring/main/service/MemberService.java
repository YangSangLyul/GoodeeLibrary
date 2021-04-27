package com.spring.main.service;

import java.util.HashMap;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.spring.main.dao.MemberDAO;

@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	
	public int join(HashMap<String, String> params) {
		String plain = params.get("userPw");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encrypt = encoder.encode(plain);
		logger.info(plain+"=>"+encrypt);
		params.put("userPw", encrypt);	
		
		return dao.join(params);
	}

	public int memOverlay(String id) {
		return dao.memOverlay(id);
	}
	
	public boolean login(HashMap<String, String> params) {
		String encrypt_pass = dao.login(params.get("id"));
		String pw = params.get("pw");
		logger.info(pw+"=="+encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(pw, encrypt_pass);
	}
	
//------------계정찾기관련 영역----------------------------------------
	
	public ModelAndView memFindId(HashMap<String, String> params) {
		logger.info("params:"+params);
		
		
		return null;
	}

}
