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

	ArrayList<LibraryInfoDTO> faqSearch_infoNotice(HashMap<String, Object> params);

	ArrayList<LibraryInfoDTO> question_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionRoom_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionBook_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionService_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionGuitar_infoNotice(Model model);

}
