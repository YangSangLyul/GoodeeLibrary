package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

	int myRBookCancel(String bookIdx, String loginId);

	ArrayList<MyLibraryDTO> reserve_list(int start, int end, String loginId);

	int Question_allCount(String loginId);

	MyLibraryDTO myRBookDetail(String bookIdx);

	Integer reserveChk(String bookIdx);

	int bookReturn(String reserveBookIdx);

	int bookReturn(String reserveBookIdx, String loginId);

	String reserveId(String bookIdx, String loginId);

	String borrowId(String bookIdx);

	int reserveBook(HashMap<String, String> params, String loginId);

	int reserveIdChk(String bookIdx, String loginId);

	boolean reserveS(String bookIdx, String loginId);

	boolean reserveF(String bookIdx, String loginId);

	int HopeBook_allCount(String loginId);

	ArrayList<MyLibraryDTO> hope_list(int start, int end, String loginId);

	MyLibraryDTO myHBookDetail(String hopeBooksNumber);

	int Review_allCount(String loginId);

	ArrayList<MyLibraryDTO> review_list(int start, int end, String loginId);

	MyLibraryDTO myReviewDetail(HashMap<String, Object> params);

	int review_edit(HashMap<String, Object> params);

	int review_delete(String reviewIdx);

	MyLibraryDTO myReviewWriteForm(HashMap<String, String> params);

	int review_write(HashMap<String, String> params);


	//HashMap<String, Object> question_detail(String idx);

}
