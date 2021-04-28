package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.AdminDTO;

public interface AdminDAO {

	ArrayList<AdminDTO> manyUp();
	
	ArrayList<AdminDTO> manyReview();

	int selectKing(String id, String cnt);

	ArrayList<String> hideBtn();


}
