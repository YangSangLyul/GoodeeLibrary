package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.spring.main.dto.LibraryInfoDTO;

public interface LibraryInfoDAO {

	LibraryInfoDTO noticeDetail(String idx);

	ArrayList<LibraryInfoDTO> searchList(HashMap<String, Object> params);

	int allCount();

	ArrayList<LibraryInfoDTO> list(int start, int end);

	int searchCount(HashMap<String, Object> params);

	ArrayList<LibraryInfoDTO> faq_infoNotice();

}
