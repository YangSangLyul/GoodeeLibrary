package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.UserNotificationDTO;

public interface UserNotificationDAO {

	ArrayList<UserNotificationDTO> userNotificationList(String loginId);

}
