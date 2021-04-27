package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.QuestionDTO;

public interface QuestionDAO {

	ArrayList<QuestionDTO> question_list();

	int question_write(QuestionDTO dto);

	int question_edit(QuestionDTO dto);

	QuestionDTO question_detail(String idx);

	int question_delete(String idx);

}
