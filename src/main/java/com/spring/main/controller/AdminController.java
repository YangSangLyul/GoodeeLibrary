package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.LibraryInfoDTO;
import com.spring.main.service.AdminService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	//관리자 메인 - 알림리스트
	@RequestMapping(value = "/adminService", method = RequestMethod.GET)
	public ModelAndView adminNoti() {
		logger.info("관리자 메인 요청");
		return service.adminNoti();
	}
	
	//이 달의 리뷰왕 리스트 
	@RequestMapping(value = "/ReviewKing", method = RequestMethod.GET)
	public ModelAndView ReviewKing() {
		logger.info("이달의리뷰왕 요청");
		return service.reviewkingList();
	}
	
	//이 달의 리뷰왕 선정
	@RequestMapping(value = "/selectKing", method = RequestMethod.POST)
	public String selectKing(@RequestParam  HashMap<String, Object> tdArr) {
		logger.info("이달의리뷰왕: "+tdArr);	
		
		//id와 cnt 분리
		logger.info(""+tdArr.get("tdArr[0][id]"));
		ArrayList<String> idList = new ArrayList<String>();
		idList.add((String) tdArr.get("tdArr[0][id]"));
		idList.add((String) tdArr.get("tdArr[1][id]"));
		idList.add((String) tdArr.get("tdArr[2][id]"));
		logger.info("idList: "+idList);
		
		ArrayList<String> cntList = new ArrayList<String>();
		cntList.add((String) tdArr.get("tdArr[0][cnt]"));
		cntList.add((String) tdArr.get("tdArr[1][cnt]"));
		cntList.add((String) tdArr.get("tdArr[2][cnt]"));
		logger.info("cntList: "+cntList);
		
		int success = service.selectKing(idList,cntList); 
		logger.info("success: "+success);
		return "redirect:/ReviewKing";
	}
	
	//리뷰왕 선정 이미 했으면 다음 달 까지 선정 불가
	@RequestMapping(value = "/hideBtn", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> hideBtn() {
		logger.info("선정불가 요청");
		return service.hideBtn();
	}
	
	//선정한 리뷰왕 확인
	@RequestMapping(value = "/chkReviewKing", method = RequestMethod.GET)
	public ModelAndView chkReviewKing() {
		logger.info("선정한 리뷰왕 확인 요청");
		return service.chkReviewKing();
	}
	
	//신고리스트 불러오기
	@RequestMapping(value = "/ReportList", method = RequestMethod.GET)
	public ModelAndView ReportList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminReport");
		return mav;
	}
	
	//신고리스트 - 페이징
	@RequestMapping(value = "/ReportList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> ReportList(@PathVariable int page) {
		int pagePerCnt = 10;
		logger.info("page: "+page);
		return service.ReportList(pagePerCnt, page);
	}
	
	//블라인드 리스트 불러오기
	@RequestMapping(value = "/BlindList", method = RequestMethod.GET)
	public ModelAndView BlindList() {
		logger.info("블라인드리스트 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminBlind");
		return mav;
	}
	
	//블라인드 리스트 - 페이징
	@RequestMapping(value = "/BlindList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> BlindList(@PathVariable int page) {
		int pagePerCnt = 10;
		logger.info("page: "+page);
		return service.BlindList(pagePerCnt, page);
	}
	
	//신고 상세보기
	@RequestMapping(value = "/reportDetail/{idx}", method = RequestMethod.GET)
	public String blindDetail(Model model, @PathVariable int idx) {
		logger.info("신고 상세보기 할 idx: "+idx);
		String page = "redirect:/ReviewKing";
		AdminDTO dto = service.reportDetail(idx);
		if(dto != null) {
			page = "adminReport_detail";
			model.addAttribute("detail",dto);
		}
		return page;
	}
	
	//블라인드 사유 페이지 이동
	@RequestMapping(value = "/blindReason", method = RequestMethod.GET)
	public String blindReason(Model model, @RequestParam int reportIdx, @RequestParam int reviewIdx) {
		logger.info("블라인드 사유 입력: "+reportIdx+"/"+reviewIdx);
		AdminDTO dto = service.blindReason(reportIdx,reviewIdx);
		if(dto != null) {
			model.addAttribute("info", dto);
		}
		return "adminReport_blindReason";
	}
	
	//블라인드 사유 입력
	@RequestMapping(value = "/blindReasonTxt", method = RequestMethod.POST)
	public ModelAndView blindReasonTxt(@RequestParam HashMap<String, Object> params) {
		logger.info("블라인드 사유 입력: "+params);
		return service.blindReasonTxt(params);
	}
	
	//신고리스트 무시
	@RequestMapping(value = "/ignore", method = RequestMethod.GET)
	public ModelAndView ignore(@RequestParam int reportIdx, RedirectAttributes attr) {
		logger.info("무시할 신고번호: "+reportIdx);
		return service.ignore(reportIdx,attr);
	}
	
	//블라인드 해제
	@RequestMapping(value = "/blindRemove", method = RequestMethod.GET)
	public ModelAndView blindRemove(@RequestParam int blindIdx, RedirectAttributes attr) {
		logger.info("해제할 블라인드 번호: "+blindIdx);
		return service.blindRemove(blindIdx,attr);
	}
	
	//관리자 공지사항
	@RequestMapping(value = "/adminNotice", method = RequestMethod.GET)
	public ModelAndView adminNotice() {
		logger.info("관리자 공지사항");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminNotice");
		return mav;
	}
	
	//관리자 공지사항 - 페이징
	@RequestMapping(value = "/adminNotice/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> adminNotice(@PathVariable int page) {
		int pagePerCnt = 10;
		logger.info("page: "+page);
		return service.adminNotice(pagePerCnt, page);
	}
	
	//관리자 공지사항 글쓰기 폼
	@RequestMapping(value = "/noticewriteForm", method = RequestMethod.GET)
	public ModelAndView noticewriteForm() {
		logger.info("관리자 공지사항 글쓰기 폼으로 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminNotice_writeForm");
		return mav;
	}
	
	//관리자 공지사항 글쓰기
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(@RequestParam HashMap<String, Object> params) {
		logger.info("공지사항: "+params);
		return service.noticeWrite(params);
	}
	
	//관리자 공지사항 상세보기
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Model model, @RequestParam int idx) {
		logger.info("공지사항 상세보기: "+idx);
		String page = "redirect:/adminNotice";
		LibraryInfoDTO dto = service.noticeDetail(idx);
		if(dto != null) {
			page = "adminNotice_detail";
			model.addAttribute("detail",dto);
		}
		return page;
	}
	
	//관리자 공지사항 삭제
	@RequestMapping(value = "/noticeDel", method = RequestMethod.GET)
	public ModelAndView noticeDel(@RequestParam int idx, RedirectAttributes attr) {
		logger.info("공지사항 삭제: "+idx);
		return service.noticeDel(idx, attr);
	}
	
	//관리자 공지사항 수정 페이지
	@RequestMapping(value = "/noticeEditForm", method = RequestMethod.GET)
	public String noticeEditForm(Model model, @RequestParam int idx) {
		logger.info("공지사항 수정: "+idx);
		String page = "redirect:/noticeDetail";
		LibraryInfoDTO dto = service.noticeDetail(idx);
		if(dto != null) {
			page = "adminNotice_updateForm";
			model.addAttribute("detail",dto);
		}
		return page;
	}
	
	//관리자 공지사항 글 수정
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(@RequestParam HashMap<String, Object> params, RedirectAttributes attr) {
		logger.info("공지사항 수정: "+params);
		return service.noticeUpdate(params,attr);
	}
	
	//문의내역 리스트 페이지 이동
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String questionList() {
		return "/QuestionManage/QuestionList";
	}
	
	//문의내역 리스트
	@RequestMapping(value = "/questionList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> questionList(@PathVariable int page) {
		return service.questionList(page);
	}
	
	//문의내역 상세 페이지 이동
	@RequestMapping(value = "/QuestionDetail", method = RequestMethod.GET)
	public ModelAndView QuestionDetail(@RequestParam String queIdx) {
		
		logger.info("문의내역 상세 페이지 이동 대상번호 : "+queIdx);
		
		return service.questionDetail(queIdx);
	}

	//관리자 답변 전송
	@RequestMapping(value = "/answerInsert", method = RequestMethod.POST)
	public String answerInsert(@RequestParam HashMap<String, Object> params, RedirectAttributes rAttr) {
		
		logger.info("문의내역 답변 정보 : "+params);
		
		return service.questionAnswer(params,rAttr);
	}
	
}
