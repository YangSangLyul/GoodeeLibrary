package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.spring.main.dto.BookDTO;
import com.spring.main.dto.LibraryInfoDTO;
import com.spring.main.dto.MyLibraryDTO;
import com.spring.main.dto.QuestionPhotoDTO;

public interface MyLibraryDAO {

	ArrayList<MyLibraryDTO> question_list();

	//int question_write(QuestionDTO dto);

	int question_edit(HashMap<String, Object> params);
	
	MyLibraryDTO myLib_question_detail(HashMap<String, Object> params);

	int question_delete(String idx);

	int ReserveBook_allCount(String loginId);
	
	//void writeFile(String key, String string, int queidx);

	

	ArrayList<MyLibraryDTO> page_list(int start, int end, String loginId);

	MyLibraryDTO question_editForm(HashMap<String, Object> params);

	int myRBookCancel(String reserveBookIdx);

	ArrayList<MyLibraryDTO> reserve_list(int start, int end, String loginId);

	int Question_allCount(String loginId);

	MyLibraryDTO myRBookDetail(String bookIdx);

	Integer reserveChk(String bookIdx);

	int bookReturn(String reserveBookIdx);

	int bookReturn(String reserveBookIdx, String loginId);

	String reserveId(String bookIdx);

	//HashMap<String, Object> question_detail(String idx);

}
