package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.spring.main.dto.LibraryInfoDTO;
import com.spring.main.dto.QuestionDTO;
import com.spring.main.dto.QuestionPhotoDTO;

public interface QuestionDAO {

	ArrayList<QuestionDTO> question_list();

	//int question_write(QuestionDTO dto);

	//int question_edit(HashMap<String, Object> params);
	int question_edit(HashMap<String, Object> params);
	
	QuestionDTO myLib_question_detail(HashMap<String, Object> params);

	int question_delete(String idx);

	int allCount(String loginId);

	//void writeFile(String key, String string, int queidx);

	//ArrayList<QuestionPhotoDTO> fileList(String idx);


	ArrayList<QuestionDTO> page_list(int start, int end, String loginId);

	QuestionDTO question_editForm(HashMap<String, Object> params);

	ArrayList<LibraryInfoDTO> question_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionRoom_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionBook_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionService_infoNotice(Model model);

	ArrayList<LibraryInfoDTO> questionOthers_infoNotice(Model model);

	//HashMap<String, Object> question_detail(String idx);

}
