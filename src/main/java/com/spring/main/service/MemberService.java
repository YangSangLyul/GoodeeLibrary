package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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

	public boolean login(String id, String pw) {
		String encrypt_pass = dao.login(id);
		logger.info(pw+"=="+encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(pw, encrypt_pass);
	}

	public String memOverlay(String id) {
		boolean success = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		success = dao.memOverlay(id);
		System.out.println("아이디 사용여부 : " + success);
		map.put("use", success);
		return null;
	}
}
