package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.MyLibraryDTO;
import com.spring.main.service.MyLibraryService;

//@Controller
@RestController
public class MyLibraryController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyLibraryService service;
	
	  @RequestMapping(value = "/MyLibrary")
	  public ModelAndView MyLibrary(HttpSession session,RedirectAttributes rAttr) { 
		  ModelAndView mav = new ModelAndView();
			String loginId = (String) session.getAttribute("loginId");
			String msg="로그인이 필요한 서비스입니다.";
			String page = "redirect:/memLogin";
			logger.info(loginId);
			if(loginId != null) {
				page="myLib_reserveSeatInOut";
			}
			rAttr.addFlashAttribute("msg",msg);	
			mav.addObject("loginId",loginId); 
			mav.setViewName(page);
			
		  logger.info("나의 리뷰 내역 이동"); 
		  return mav; 
	  }
	 
	  @RequestMapping(value = "/review_WriteForm") 
	  public ModelAndView review_WriteForm(@RequestParam HashMap<String, String> params){ 
		  logger.info("리뷰 작성페이지 이동하기"); 
		  logger.info("params:{}",params); 
		  return service.review_writeForm(params); 
	  }
	  
	
	  @RequestMapping(value = "/review_write") 
	  public HashMap<String, Object> review_write(@RequestParam HashMap<String, String> params){ 
		 
		  logger.info("리뷰 작성하기"); 
		  logger.info("params:{}",params); 
		  return service.review_write(params); 
	}
	  
	  @RequestMapping(value = "/MyReview")
	  public ModelAndView MyReview() { 
		  logger.info("나의 리뷰내역"); 
		  ModelAndView mav = new ModelAndView(); 
		  mav.setViewName("myLib_Review"); 
		  return mav; 
	  }
	  
	  @RequestMapping(value = "/myReview_detail")
		public ModelAndView myReview_detail(@RequestParam HashMap<String, Object> params) {
		//public HashMap<String, Object> question_detail(@RequestParam String idx) {	
			
			logger.info("나의 리뷰 상세페이지");
			logger.info("params:{}",params);
			return service.review_detail(params);
			//return "myLib_review_detail";
		}
	  
	  @RequestMapping(value = "/ReviewEditForm")
		public ModelAndView review_editForm(@RequestParam HashMap<String, Object> params) {
			
			logger.info("나의 리뷰 수정페이지");
			logger.info("params:{}",params);
			return service.review_editForm(params);
	  }
		
		
		@RequestMapping(value = "/review_edit")
		//public HashMap<String, Object> question_edit(@RequestParam HashMap<String, Object> params) {
		public ModelAndView review_edit(@RequestParam HashMap<String, Object> params) {
			
			logger.info("나의 리뷰 수정");
			logger.info("params:{}",params);
			//HashMap<String, Object> map = new HashMap<String, Object>();
			//map.put("", value)
			return service.review_edit(params);
			
		}

		@RequestMapping(value = "/review_delete")
		public ModelAndView review_delete(@RequestParam String reviewIdx) {
			logger.info("나의 문의내역 삭제");
			logger.info("삭제할 문의번호"+reviewIdx);
			
			return service.review_delete(reviewIdx);
		}
	  
	  @RequestMapping(value = "/myLib_Review/{page}", method = RequestMethod.GET)
	  public HashMap<String,Object> Review_list( 
			  @PathVariable int page,HttpSession session) { 
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("나의 리뷰내역 ");
		  logger.info(" page : {}, session Id: {}",  page,loginId);
	  
	  return service.review_list(page,loginId); 
	  }
	  
	  
	  @RequestMapping(value = "/MyHopeBook")
	  public ModelAndView MyHopeBook() { 
		  logger.info("나의 희망도서 신청내역"); 
		  ModelAndView mav = new ModelAndView(); 
		  mav.setViewName("myLib_HopeBook"); 
		  return mav; 
	  }
	  
	  @RequestMapping(value = "/myLib_Hbook/10/{page}", method = RequestMethod.GET)
	  public HashMap<String,Object> HopeBook_list( 
			  @PathVariable int page,HttpSession session) { 
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("나의 희망도서 ");
		  logger.info(" page : {}, session Id: {}",  page,loginId);
	  
	  return service.hope_list(page,loginId); 
	  }
	  
	  @RequestMapping(value = "/MyBook" ,method = RequestMethod.GET)
	  public ModelAndView MyBook() { 
		  logger.info("나의 도서 예약내역"); 
		  ModelAndView mav = new ModelAndView(); 
		  mav.setViewName("myLib_Rbook"); 
		  return mav; 
	  }
	  
	  @RequestMapping(value = "/myLib_Rbook/{page}", method = RequestMethod.GET)
	  public HashMap<String,Object> reserveBook_list( 
			  @PathVariable int page,HttpSession session) { 
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("나의 도서예약 ");
		  logger.info(" page : {}, session Id: {}",  page,loginId);
	  
	  return service.reserve_list(page,loginId); 
	  }
	 
	  @RequestMapping(value = "/MyQuestion")
	  public ModelAndView MyQuestion() { 
		  logger.info("나의 문의이동"); 
		  ModelAndView mav = new ModelAndView(); 
		  mav.setViewName("myLib_question"); 
		  return mav; 
	  }
	
	  @RequestMapping(value = "/myLib_question/5/{page}", method = RequestMethod.GET)
	  public HashMap<String,Object> question_list( 
			  @PathVariable int page,HttpSession session) { 
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("나의 문의 페이지2");
		  logger.info(" page : {}, session Id: {}",  page,loginId);
	  
	  return service.page_list(page,loginId); 
	  }
  
	@RequestMapping(value = "/myLib_question_detail")
	public ModelAndView question_detail(@RequestParam HashMap<String, Object> params) {
	//public HashMap<String, Object> question_detail(@RequestParam String idx) {	
		
		logger.info("나의 문의 상세페이지");
		logger.info("params:{}",params);
		return service.myLib_question_detail(params);
	}
	
	@RequestMapping(value = "/editForm")
	public ModelAndView question_edit(Model model,HttpSession session,@RequestParam HashMap<String, Object> params) {
		
		logger.info("나의 문의 수정페이지");
		logger.info("params:{}",params);
		return service.question_editForm(params);
	  }
	
	
	@RequestMapping(value = "/question_edit")
	//public HashMap<String, Object> question_edit(@RequestParam HashMap<String, Object> params) {
	public ModelAndView question_edit(@RequestParam HashMap<String, Object> params) {
		
		logger.info("나의 문의 상세페이지 수정");
		logger.info("params:{}",params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("", value)
		return service.question_edit(params);
		
	}

	@RequestMapping(value = "/question_delete")
	public ModelAndView question_delete(@RequestParam String idx) {
		logger.info("나의 문의내역 삭제");
		logger.info("삭제할 문의번호"+idx);
		
		return service.question_delete(idx);
	}
	
	/*
	@RequestMapping(value = "/question_write")
	public ModelAndView question_write(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("문의 작성하기");
		return service.question_write(params,session);
	}
	
	@RequestMapping(value = "/questionWrite", method = RequestMethod.GET)
	public String writeForm(HttpSession session) {
		logger.info("글쓰기 페이지로 이동");
		//업로드 할 파일 이름을 저장한 HashMap 을 생성해서 session 에 저장
		HashMap<String,String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return "questionWrite";
	}
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm(Model model) {
		logger.info("파일 업로드 페이지로 이동");
		return "uploadForm";
	}
	
	@RequestMapping(value = "/file_upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		logger.info("파일 업로드 요청");
		return service.file_upload(file,session);
	}
	*/
	
	@RequestMapping(value = "/mybookReserve", method = RequestMethod.GET)
	public ModelAndView reserveBook(@RequestParam String bookIdx,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("책번호 : " + bookIdx);
		logger.info("아이디 : " + loginId);
		
		//int success = service.reserveBook(bookIdx,loginId);
		
		//logger.info("예약 성공 여부 : " + success);
		//logger.info("bookIdx : " + bookIdx);
		return service.reserveBook(bookIdx,loginId);
	}
	
	@RequestMapping(value = "/myRBookCancel", method = RequestMethod.GET)
	public ModelAndView reserveBookCancel(@RequestParam String reserveBookIdx,HttpSession session) {
		//logger.info("예약 취소하기 : " + reserveBookIdx);
		String loginId = (String) session.getAttribute("loginId");
		logger.info("예약번호 : " + reserveBookIdx);
		
		return service.myRBookCancel(reserveBookIdx,loginId);
	}
	
	@RequestMapping(value = "/myRBookDetail", method = RequestMethod.GET)
	public ModelAndView myRBookDetail(@RequestParam String bookIdx,HttpSession session) { 
		String loginId = (String) session.getAttribute("loginId");
		logger.info("예약도서 상세보기 대상 : {}", bookIdx);
		return service.myRBookDetail(bookIdx,loginId);
	}
	
	
	  @RequestMapping(value = "/myBookReturn", method = RequestMethod.GET) 
	  public ModelAndView returnBook(@RequestParam String reserveBookIdx,HttpSession session, RedirectAttributes rAttr) {
		  
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("반납하기 : " + reserveBookIdx); 
		  String msg = "반납에  실패했습니다";
		  int success = service.bookReturn(reserveBookIdx,loginId); 
		  if(success > 0) {
			  msg = "반납에 성공했습니다";
		  }
		  logger.info("반납 성공 여부 : " +success); 
		  rAttr.addFlashAttribute("msg",msg);
		  return new ModelAndView("redirect:/MyBook");
	  }
	 
	
	@RequestMapping(value = "/myHBookDetail")
	public ModelAndView myHBookDetail(@RequestParam String hopeBooksNumber) { 
		logger.info("예약도서 상세보기 대상 : {}", hopeBooksNumber);
		return service.myHBookDetail(hopeBooksNumber);
	}
}
