package com.spring.main.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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
import com.spring.main.dto.HopeBookDTO;

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
	public HashMap<String, Object> normalBookFilter(String[] filter, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> filterList = new ArrayList<String>();
		Collections.addAll(filterList, filter);
		ArrayList<String> chkReserve = new ArrayList<String>(filterList);
		
		int pagePerCnt = 5;
		
		String isReserve = "false";
		for(String reserve : chkReserve) {
			if(reserve.equals("R001")) {
				filterList.remove(reserve);
				isReserve = "true";
			}
		}
		int allCnt = dao.bookFilterCnt(filterList, filterList.size(), isReserve);
		logger.info("allCnt : " + allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// ?????? ?????????, ??? ?????????
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		ArrayList<BookDTO> list = dao.normalBookFilter(start,end,filterList,filterList.size(),isReserve);
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
		return map;
	}

	public HashMap<String, Object> userReserveNotification(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		

		int success = 0;;
		int cnt = dao.userReserveNotificationChk(params);
		
		//???????????? ?????? ??????
		if(cnt == 0) {
			success = dao.userReserveNotification(params);
		}
		
		map.put("success", success);
		return map;
	}

	@Transactional
	public ModelAndView bookManageDetail(String bookIdx) {
		ModelAndView mav = new ModelAndView();
		BookDTO dto = dao.bookManageDetail(bookIdx);

		if (dto != null) {
			int reserveCnt = dao.reserveCnt(bookIdx);
			logger.info("?????? ?????? : " + reserveCnt);
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
			logger.info("?????? ?????? ?????? : " + dto.getBookIdx());
			page = "redirect:/bookManageDetail?bookIdx="+dto.getBookIdx();
		}
		
		
		return page;
	}

	public HashMap<String, Object> bookList(int page, String filter) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 5;
		int allCnt = 0;
		int range = 0;
		if(filter.equals("all")) {
			allCnt = dao.allCnt(); 		// ?????? ????????? ???
			map.put("filter", filter);
		}else if(filter.equals("reserve")) {
			allCnt = dao.reserveAllCnt(); 		// ?????? ????????? ???
			map.put("filter", filter);
		}
		range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// ?????? ?????????, ??? ?????????
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		if(filter.equals("all")) {
			ArrayList<BookDTO> list = dao.bookList(start,end);	
			map.put("list", list);
		}else if(filter.equals("reserve")) {
			logger.info("????????? ?????? ??????");
			ArrayList<BookDTO> filterList = dao.filterBookList(start,end);
			map.put("list", filterList);
		}
		
		
		map.put("range", range);
		map.put("currPage", page);
		
		return map;
	}

	public String hopeBookInsert(HashMap<String, String> params, RedirectAttributes rAttr) {
		
		String msg = "???????????? ????????? ??????????????????..";
		int success = 0;
		String page = "redirect:/hopeBook";
		
		success = dao.hopeBookInsert(params);
		
		if(success > 0) {
			msg = "???????????? ????????? ??????????????? ???????????????.";
		}
		
		rAttr.addFlashAttribute("msg",msg);
		
		return page;
	}

	public HashMap<String, Object> newBooks(int month, int page) {
		
		//?????? ??????
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
		int allCnt = dao.monthAllCnt(map); 		// ?????? ????????? ???
		
		logger.info("?????? ?????? ??? ?????? : "+allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		//?????? ?????? ?????? ?????? ??? ????????? ????????? ?????????..
		if(allCnt <= 0) {
			success = 0;
		}
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// ?????? ?????????, ??? ?????????
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

	public HashMap<String, Object> recommendBooksList(int month, int page) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int calMonth = cal.get(Calendar.MONTH) + 1;
		int success = 1;
		
		map.put("month", month);
		map.put("page", page);
		map.put("calMonth", calMonth);
		int pagePerCnt = 1;
		int allCnt = dao.monthRecommendAll(map); 		// ?????? ????????? ???
		
		logger.info("?????? ?????? ?????????????????? ?????? : "+allCnt);
		int range = (int) (allCnt % pagePerCnt > 0 ? Math.floor((allCnt/pagePerCnt))+1 : Math.floor((allCnt/pagePerCnt)));
		
		//?????? ?????? ?????? ?????? ??? ????????? ????????? ?????????..
		if(allCnt <= 0) {
			success = 0;
		}
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// ?????? ?????????, ??? ?????????
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		map.put("end", end);
		map.put("start", start);
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.recommendBooksList(map);
		dataMap.put("list", list);
		dataMap.put("range", range);
		dataMap.put("currPage", page);
		dataMap.put("success", success);
		return dataMap;
	}

	public HashMap<String, Object> mainRecommendBooksList(int month) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int calMonth = cal.get(Calendar.MONTH) + 1;
		int success = 1;
		
		map.put("month", month);
		map.put("calMonth", calMonth);
		int allCnt = dao.monthRecommendAll(map); 		// ?????? ????????? ???
		
		logger.info("?????? ?????? ?????????????????? ?????? : "+allCnt);
		
		//?????? ?????? ?????? ?????? ??? ????????? ????????? ?????????..
		if(allCnt <= 0) {
			success = 0;
		}
		
		ArrayList<BookDTO> list = dao.mainRecommendBooksList(map);
		dataMap.put("list", list);
		dataMap.put("success", success);
		return dataMap;
		
	}

	public HashMap<String, Object> reviewRecommendBooksList(int month) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int calMonth = cal.get(Calendar.MONTH) + 1;
		int success = 1;
		
		map.put("month", month);
		map.put("calMonth", calMonth);
		int allCnt = dao.monthRecommendAll(map); 		// ?????? ????????? ???
		
		logger.info("?????? ?????? ?????????????????? ?????? : "+allCnt);
		
		//?????? ?????? ?????? ?????? ??? ????????? ????????? ?????????..
		if(allCnt <= 0) {
			success = 0;
		}
		
		ArrayList<BookDTO> list = dao.reviewRecommendBooksList(map);
		dataMap.put("list", list);
		dataMap.put("success", success);
		return dataMap;
	}

	public HashMap<String, Object> authorRecommendBooksList(int month) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int calMonth = cal.get(Calendar.MONTH) + 1;
		int success = 1;
		
		map.put("month", month);
		map.put("calMonth", calMonth);
		int allCnt = dao.monthRecommendAll(map); 		// ?????? ????????? ???
		
		logger.info("?????? ?????? ?????????????????? ?????? : "+allCnt);
		
		//?????? ?????? ?????? ?????? ??? ????????? ????????? ?????????..
		if(allCnt <= 0) {
			success = 0;
		}
		
		ArrayList<BookDTO> list = dao.authorRecommendBooksList(map);
		dataMap.put("list", list);
		dataMap.put("success", success);
		return dataMap;
	}

	public HashMap<String, Object> hopeBookList(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		int hopeBookCnt = dao.hopeBookCnt(); 		// ?????? ????????? ???
		int range = (int) (hopeBookCnt % pagePerCnt > 0 ? Math.floor((hopeBookCnt/pagePerCnt))+1 : Math.floor((hopeBookCnt/pagePerCnt)));
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// ?????? ?????????, ??? ?????????
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.hopeBookList(start,end);
		logger.info("hopeBookList : {}",list);
		logger.info("hopeBookList  size : {}",list.size());
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView hopeBookDetail(String hopeBooksNumber) {
		ModelAndView mav = new ModelAndView();
		
		HopeBookDTO dto = dao.hopeBookDetail(hopeBooksNumber);
		logger.info("test : " + dto.getHopeBookReject());
		logger.info("test2 : " + dto.getReject());
		mav.addObject("dto", dto);
		mav.setViewName("/BookManage/hopeBookDetail");
		return mav;
	}

	public String hopeBookApprove(String hopeBooksNumber) {
		
		int success = dao.hopeBookApprove(hopeBooksNumber);
		logger.info("???????????? ?????? ?????? ?????? : " + success);
		
		return "redirect:/hopeBookDetail?hopeBooksNumber="+hopeBooksNumber;
	}

	@Transactional
	public HashMap<String, Object> hopeBookRejectReason(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = dao.hopeBookReject(params.get("hopeBooksNumber"));
		if(success > 0) {
			dao.hopeBookRejectReason(params);
		}
		map.put("success",success);
		return map;
	}

}
