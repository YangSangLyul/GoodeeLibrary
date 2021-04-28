package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.spring.main.dto.LibraryInfoDTO;

public interface LibraryInfoDAO {

	

	LibraryInfoDTO noticeDetail(String idx);


	ArrayList<LibraryInfoDTO> list(int start, int end);

	int allCount();


	ArrayList<LibraryInfoDTO> searchList(HashMap<String, Object> map);

	int searchCount(HashMap<String, Object> params);

	/* int serCount(ArrayList<LibraryInfoDTO> list); */

}
