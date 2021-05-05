package com.spring.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.UserNotificationDAO;
import com.spring.main.dto.UserNotificationDTO;

@Service
public class UserNotificationService {
	
	@Autowired UserNotificationDAO dao;

	public ModelAndView userNotificationList(HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<UserNotificationDTO> notification = dao.userNotificationList(loginId);
		
		mav.setViewName("userNotification");
		mav.addObject("notification",notification);
		
		
		return mav;
	}

}
