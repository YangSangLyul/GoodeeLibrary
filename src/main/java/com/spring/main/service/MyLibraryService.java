package com.spring.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.QuestionDAO;
import com.spring.main.dto.QuestionDTO;

@Service
public class MyLibraryService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired QuestionDAO dao;

	public ModelAndView question_list() {

		ModelAndView mav = new ModelAndView();

		ArrayList<QuestionDTO> list = dao.question_list();
		mav.addObject("questionList", list);
		mav.setViewName("myLib_question");

		return mav;

	}

	public ModelAndView question_detail(String idx) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/";
		logger.info("상세보기 요청");

		QuestionDTO dto = dao.detail(idx);// 상세 보기
		if (dto != null) {// 상세보기 정보를 정상적으로 가져왔다면...
			page = "detail";
			mav.addObject("question_info", dto);
		}

		mav.setViewName(page);

		return mav;
	}

	public ModelAndView question_edit(QuestionDTO dto) {
		ModelAndView mav = new ModelAndView();
		logger.info("문의글 수정 요청");
		int success = dao.edit(dto);
		String page = "myLib_question_detail";
		if (success > 0) {
			logger.info("글수정 성공");
			page = "redirect:/";
		}
		mav.setViewName(page);
		return mav;
	}
	
	public ModelAndView question_write(QuestionDTO dto) {
		ModelAndView mav = new ModelAndView();
		logger.info("글쓰기 요청");
		int success = dao.write(dto);
		String page = "questionWrite";
		if (success > 0) {
			page = "redirect:/";
		}
		mav.setViewName(page);

		return mav;
	}

}
