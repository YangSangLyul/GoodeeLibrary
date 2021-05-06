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

	ArrayList<LibraryInfoDTO> questionAll_List(int start, int end);

	int questionAll_Count();

	ArrayList<LibraryInfoDTO> questionList(int start, int end, int status);

	
	int question_roomCount();
	 
	int question_bookCount();
	 
	int question_serviceCount();
	  
	int question_guitarCount();

	int questionWriting(LibraryInfoDTO dto);

	HashMap<String, Object> questionDetail(int idx);

	String questionAnsstatus(int idx);

	void fileWriting(String key, String string, Object object);

	ArrayList<String> photoRead(int idx);

	int initLostFile(String string);

	int update(HashMap<String, Object> params);

	ArrayList<LibraryInfoDTO> mainNoticeCall();

	ArrayList<LibraryInfoDTO> fileCk(int idx);

	int questionDelete(int idx);

	LibraryInfoDTO noticePopup();
	 
	


}
