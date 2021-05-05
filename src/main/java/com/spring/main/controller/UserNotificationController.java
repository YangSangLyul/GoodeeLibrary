package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.UserNotificationService;

@Controller
public class UserNotificationController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserNotificationService service;
	
	//ajax 요청
	@RequestMapping(value = "/userNotificationReq", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object>userNotificationReq(HttpSession session) {
		
		
		
		logger.info("입실요청 대상 : ");
		
		return null;
	}
	
	//ajax 요청
	@RequestMapping(value = "/userNotification", method = RequestMethod.GET)
	public ModelAndView userNotification(HttpSession session) {
		
		logger.info("유저 알림 페이지 이동 : ");
		
		return service.userNotificationList(session);
	}
}
