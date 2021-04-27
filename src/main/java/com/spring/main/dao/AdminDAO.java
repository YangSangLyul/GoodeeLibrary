package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;

public interface AdminDAO {

	ArrayList<AdminDTO> manyUp();
	
	ArrayList<AdminDTO> manyReview();

	int selectKing(HashMap<String, Object> params);


}
