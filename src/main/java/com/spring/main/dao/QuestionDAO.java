package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.QuestionDTO;

public interface QuestionDAO {

	ArrayList<QuestionDTO> question_list();

	QuestionDTO detail(String idx);

	int edit(QuestionDTO dto);

}
