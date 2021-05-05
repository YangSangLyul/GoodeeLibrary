package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.BookDTO;

@Service
public class AdminService {
	
	@Autowired AdminDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView adminNoti() {
		logger.info("관리자메인-알림내역 쿼리 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<AdminDTO> list = dao.adminNoti();
		mav.addObject("noti", list);
		mav.setViewName("adminService");
		return mav;
	}

	public ModelAndView reviewkingList() {
		logger.info("리뷰왕 쿼리 요청");
		ModelAndView mav = new ModelAndView();		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AdminDTO> manyUp = dao.manyUp();
		ArrayList<AdminDTO> manyReview = dao.manyReview();
		map.put("manyUp", manyUp);
		map.put("manyReview", manyReview);
		
		mav.addObject("king", map);		
		mav.setViewName("adminReviewKing");

		return mav;
	}

	public int selectKing(ArrayList<String> idList, ArrayList<String> cntList) {
		logger.info("리뷰왕 INSERT 쿼리 요청");
		String id = "";
		String cnt = "";
		int success = 0;
		
		for (int i = 0; i < idList.size(); i++) {
			id = idList.get(i);
			logger.info("idList: "+idList.get(i));
			cnt = cntList.get(i);
			logger.info("cntList: "+cntList.get(i));
			success = dao.selectKing(id,cnt);
		}				
		logger.info("서비스 success: "+success);
	    return success;
	}

	public HashMap<String, Object> hideBtn() {
		logger.info("현재날짜와 매치 쿼리 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> hide = dao.hideBtn();
		map.put("hide",hide);
		logger.info("map: "+map);
		if(map.size()>0) {
			logger.info("이미 리뷰왕 선정 했음");
		}
		return map;
	}

	public HashMap<String, Object> ReportList(int pagePerCnt, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allCnt = dao.allCount();
		int range = allCnt/pagePerCnt > 0 ? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우 현재 페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		//시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("신고리스트 쿼리 요청");
		ArrayList<AdminDTO> ReportList = dao.ReportList(start,end);
		map.put("list", ReportList);
		map.put("range", range);
		map.put("currPage", page);
		
		return map;
	}

	public HashMap<String, Object> BlindList(int pagePerCnt, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allCnt = dao.allCount();
		int range = allCnt/pagePerCnt > 0 ? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우 현재 페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		//시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("블라인드 리스트 쿼리 요청");
		ArrayList<AdminDTO> BlindList = dao.BlindList(start,end);
		map.put("list", BlindList);
		map.put("range", range);
		map.put("currPage", page);
		
		return map;
	}

	public AdminDTO reportDetail(int idx) {
		logger.info("신고 상세보기 쿼리 요청");
		return dao.reportDetail(idx);
	}

	public AdminDTO blindReason(int reportIdx, int reviewIdx) {
		logger.info("블라인드 사유 입력 요청");
		return dao.blindReason(reportIdx,reviewIdx);
	}

	public ModelAndView blindReasonTxt(HashMap<String, Object> params) {
		logger.info("블라인드 추가 요청");
		ModelAndView mav = new ModelAndView();
		mav.addObject("success", dao.blindReasonTxt(params));
		mav.addObject("update", dao.reportFal(params));
		mav.setViewName("redirect:/BlindList");
		return mav;
	}

	public ModelAndView ignore(int reportIdx, RedirectAttributes attr) {
		logger.info("신고리스트 삭제 요청");
		ModelAndView mav = new ModelAndView();
		String msg = "";
		if(dao.ignore(reportIdx)>0) {
			msg = "해당 신고는 신고리스트에서 삭제처리 되었습니다.";
		}
		attr.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/ReportList");
		return mav;
	}

	public ModelAndView blindRemove(int blindIdx, RedirectAttributes attr) {
		logger.info("블라인드리스트 해제 요청");
		ModelAndView mav = new ModelAndView();
		String msg = "";
		if(dao.blindRemove(blindIdx)>0) {
			msg = "해제 되었습니다.";
		}
		attr.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/BlindList");
		return mav;
	}

	public HashMap<String, Object> questionList(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		int questionCnt = dao.questionCnt(); 		// 전체 게시글 수
		int range = (int) (questionCnt % pagePerCnt > 0 ? Math.floor((questionCnt/pagePerCnt))+1 : Math.floor((questionCnt/pagePerCnt)));
		
		page = page > range ? range : page;
		logger.info("range : " + range + " / page : " + page);
		// 시작 페이지, 끝 페이지
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		logger.info("start : " + start + " / end : " + end);
		
		ArrayList<BookDTO> list = dao.questionList(start,end);

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	
}
