package com.spring.main.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.BookDAO;
import com.spring.main.dto.BookDTO;

@Service
public class BookService {

	@Autowired
	BookDAO dao;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView bookManageList() {
		ModelAndView mav = new ModelAndView();

		ArrayList<BookDTO> list = dao.bookManageList();
		logger.info("list size : " + list.size());
		
		mav.addObject("list", list);
		mav.setViewName("/BookManage/normalBookManage");
		return mav;
	}

	/*
	 * public ModelAndView normalBookFilter(ArrayList<String> filter) { ModelAndView
	 * mav = new ModelAndView();
	 * 
	 * ArrayList<BookDTO> filterList = dao.normalBookFilter(filter);
	 * mav.addObject("list", filterList);
	 * mav.setViewName("/BookManage/normalBookManage");
	 * 
	 * return mav; }
	 */
	public HashMap<String, Object> normalBookFilter(ArrayList<String> filter, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		int allCnt = dao.allCnt(); 		// 전체 게시글 수
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.normalBookFilter(start,end);
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> bookStateChange(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = dao.bookStateChange(params);
		map.put("success", success);

		return map;
	}

	public HashMap<String, Object> reserveApproval(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = dao.reserveApproval(params);
		map.put("success", success);
		return null;
	}

	public HashMap<String, Object> userReserveNotification(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = dao.userReserveNotification(params);
		map.put("success", success);
		return map;
	}

	@Transactional
	public ModelAndView bookManageDetail(String bookIdx) {
		ModelAndView mav = new ModelAndView();
		BookDTO dto = dao.bookManageDetail(bookIdx);

		if (dto != null) {
			int reserveCnt = dao.reserveCnt(bookIdx);
			logger.info("예약 인원 : " + reserveCnt);
			mav.addObject("reserveCnt", reserveCnt);
		}

		mav.addObject("dto", dto);
		mav.setViewName("/BookManage/bookManageDetail");

		return mav;
	}

	public String insertRecommendBook(HashMap<String, String> params) {
		int success = dao.insertRecommendBook(params);
		
		
		return "redirect:/bookManageDetail?bookIdx="+params.get("bookIdx");
	}

	public String bookInsert(BookDTO dto) {
		
		String page = "redirect:/bookManageInsert";
		
		int success = dao.bookInsert(dto);
		if(success > 0) {
			logger.info("도서 추가 성공 : " + dto.getBookIdx());
			page = "redirect:/bookManageDetail?bookIdx="+dto.getBookIdx();
		}
		
		
		return page;
	}

	public HashMap<String, Object> bookList(int page) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		int allCnt = dao.allCnt(); 		// 전체 게시글 수
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.bookList(start,end);
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public String hopeBookInsert(HashMap<String, String> params, RedirectAttributes rAttr) {
		
		String msg = "희망도서 신청에 실패했습니다..";
		int success = 0;
		String page = "redirect:/hopeBook";
		
		success = dao.hopeBookInsert(params);
		
		if(success > 0) {
			msg = "희망도서 신청이 성공적으로 되었습니다.";
		}
		
		rAttr.addFlashAttribute("msg",msg);
		
		return page;
	}

	public HashMap<String, Object> newBooks(int month, int page) {
		
		//전월 쿼리
		//SELECT bookidx, rnum FROM (SELECT bookidx, ROW_NUMBER() OVER(ORDER BY bookidx DESC) AS rnum FROM book) 
	    //WHERE MONTHS_BETWEEN(SYSDATE,ADD_MONTHS(SYSDATE,-1)) = 1 AND (rnum between 9 AND 17);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int calMonth = cal.get(Calendar.MONTH) + 1;
		int success = 1;
		
		map.put("month", month);
		map.put("page", page);
		map.put("calMonth", calMonth);
		int pagePerCnt = 8;
		int allCnt = dao.monthAllCnt(map); 		// 전체 게시글 수
		
		logger.info("현재 월의 책 개수 : "+allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		//만약 해당 월에 대한 책 개수가 하나도 없다면..
		if(allCnt <= 0) {
			success = 0;
		}
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		map.put("end", end);
		map.put("start", start);
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.newBooksList(map);
		dataMap.put("list", list);
		dataMap.put("range", range);
		dataMap.put("currPage", page);
		dataMap.put("success", success);
		return dataMap;
	}

}
