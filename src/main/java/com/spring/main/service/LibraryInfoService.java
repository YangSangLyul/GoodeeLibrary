package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.LibraryInfoDAO;
import com.spring.main.dto.LibraryInfoDTO;

@Service
public class LibraryInfoService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired LibraryInfoDAO dao;
	
	
	public HashMap<String, Object> list_infoNotice(int pagePerCnt, int page, HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String txt = (String) params.get("search");
		
		if(txt != "" || !txt.equals("")) {
			logger.info("검색값 있음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			params.put("start", start);
			params.put("end", end);
			logger.info("값"+params);
			map.put("list", dao.searchList(params));
			int allCnt = dao.searchCount(params);
			logger.info("올카"+allCnt);
			int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
			logger.info("렌지"+range);
			map.put("range", range);

		} else{
			logger.info("검색값 없음");
			int end =page*pagePerCnt;
			int start= end - pagePerCnt+1;
			map.put("list", dao.list(start,end));	
			int allCnt = dao.allCount();
			logger.info("올카"+allCnt);
			int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
			logger.info(""+range);
			map.put("range", range);
		}
		
		logger.info(""+page);
		return map;
	}
	
	public void detail_infoNotice(Model model, String idx) {
		logger.info("현재위치는 noticeDetail의 service 입니다");

		
		LibraryInfoDTO dto=dao.noticeDetail(idx);
		
		model.addAttribute("dto",dto);	
	}

	public void faq_infoNotice(Model model) {
		ArrayList<LibraryInfoDTO> dto = dao.faq_infoNotice();
		model.addAttribute("dto",dto);
	}

	public ModelAndView faqSearch_infoNotice(HashMap<String, Object> params, RedirectAttributes rAttr) {
		logger.info(""+params);
		
		ArrayList<LibraryInfoDTO> dto = dao.faqSearch_infoNotice(params);
		ModelAndView mav = new ModelAndView();
		 String page ="redirect:/faq";
		 String msg ="찾으시는 자주묻는 질문이 없습니다."; 
		if(dto.size() >0) {
			msg="찾으시는 질문입니다."; 
			page="FAQ";
			mav.addObject("dto",dto);
			mav.addObject("msg",msg);
		}
		rAttr.addFlashAttribute("msg",msg);
		mav.setViewName(page);
		return mav;
		
	}

	public HashMap<String, Object> question_pageing(int page) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		
		int end =page*pagePerCnt;
		int start= end - pagePerCnt+1;
		map.put("list", dao.questionAll_List(start, end));
		int allCnt = dao.questionAll_Count();
		int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
		map.put("range", range);
		
		return map;
	}

	public HashMap<String, Object> question_bookPageing(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		
		int end =page*pagePerCnt;
		int start= end - pagePerCnt+1;
		int status =2;
		map.put("list", dao.questionList(start,end,status));
		int allCnt = dao.question_bookCount();
		int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
		map.put("range", range);
		
		return map;
	}
	
	public HashMap<String, Object> question_roomPageing(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		
		int end =page*pagePerCnt;
		int start= end - pagePerCnt+1;
		int status =1;
		map.put("list", dao.questionList(start,end,status));
		int allCnt = dao.question_roomCount();
		int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
		map.put("range", range);
		
		return map;
	}

	public HashMap<String, Object> question_servicePageing(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		
		int end =page*pagePerCnt;
		int start= end - pagePerCnt+1;
		int status =3;
		map.put("list", dao.questionList(start,end,status));
		int allCnt = dao.question_serviceCount();
		int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
		map.put("range", range);
		
		return map;
	}

	public HashMap<String, Object> question_guitarPageing(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pagePerCnt = 10;
		
		int end =page*pagePerCnt;
		int start= end - pagePerCnt+1;
		int status =4;
		map.put("list", dao.questionList(start,end,status));
		int allCnt = dao.question_guitarCount();
		int range=(int) (allCnt%pagePerCnt >0 ?Math.ceil(allCnt/pagePerCnt)+1:Math.ceil(allCnt/pagePerCnt));
		map.put("range", range);
		
		return map;
	}
	@Transactional     //파일 실패시 커밋 롤백 되돌리기
	public ModelAndView questionWriting(HashMap<String, Object> params ,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page ="redirect:/questionWrite";
		
		LibraryInfoDTO dto = new LibraryInfoDTO();
		dto.setSubject((String) params.get("subject"));
		dto.setContent((String) params.get("content"));
		dto.setShowstatus((String) params.get("false"));
		dto.setId((String) params.get("loginId"));
		dto.setType((String) params.get("type"));
		
		logger.info(""+dto.getId());
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		
		if(dao.questionWriting(dto)>0) {
			logger.info("queidx"+dto.getQueidx());
			if(fileList.size() >0) {
				for(String key:fileList.keySet()) {
				logger.info("key중복방지"+key+"getKe오리"+fileList.get(key)+"fto.get"+dto.getQueidx());			
				dao.fileWriting(key,fileList.get(key),dto.getQueidx());
				}
			}
			
			page="redirect:/questionDetail/"+dto.getQueidx(); 
		}else {
			for(String newFileName : fileList.keySet()) {
				File file = new File("C:/upload/Library/"+newFileName);
				file.delete();
			}
		}
		
		session.removeAttribute("fileList");
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView questionDetail(int idx, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		 HashMap<String,Object> map=dao.questionDetail(idx);
		 logger.info(""+map);
		 logger.info(""+map.get("SHOWSTATUS"));
		 logger.info(""+map.get("ID"));
		 logger.info(""+map.get("TO_CHAR(REG_DATE,'YYYY-MM-DD')"));//다른방법이없을까ㅇ?
		 map.put("REG_DATE", map.get("TO_CHAR(REG_DATE,'YYYY-MM-DD')"));
		 logger.info(""+map);
		 logger.info(""+loginId);
		 String msg ="";
		 String page ="";
		if(map.get("SHOWSTATUS").equals("TRUE")) {
			if(map.get("ANSSTATUS").equals("TRUE")) {
				String ansstatus =dao.questionAnsstatus(idx);
				logger.info("값:"+ansstatus);
//				msg="전체공개";
				mav.addObject("ansstatus", ansstatus);
			}
			page="questionDetail";
			mav.addObject("map", map);
		}else {
			if(map.get("ID").equals(loginId)) {
				if(map.get("ANSSTATUS").equals("TRUE")) {
					String ansstatus =dao.questionAnsstatus(idx);
					logger.info("값:"+ansstatus);
					mav.addObject("ansstatus", ansstatus);
				}
//				msg="비공개글이지만 작성자이기에 보여집니다.";
				page="questionDetail";
				mav.addObject("map", map);
			}else {
				msg="볼수 있는권한이 있지않습니다.";
				page="redirect:/Question";
				rAttr.addFlashAttribute("msg",msg);
			}
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		File dir = new File("C:/upload/Library");
		if(!dir.exists()) {
			dir.mkdir();
		}
		String fileName = file.getOriginalFilename();
		
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		
		logger.info("팔넴"+fileName+"밀세컨더한팔넴"+newFileName);
		
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get("C:/upload/Library/"+newFileName);
			Files.write(filePath, bytes);
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			
			fileList.put(newFileName, fileName);
			logger.info("파일수"+fileList.size());
			
			session.setAttribute("fileList", fileList);
			logger.info("fl : "+fileList);
			mav.addObject("path","/photo/"+newFileName); //다른사람들서버 설정 알려줘야함..
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName("uploadForm");
		
		return mav;
	}

	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {

		HashMap<String, Object> map	 = new	HashMap<String, Object>();
		
		File delFile = new File("C:/upload/Library/"+fileName);
		logger.info("delete file:"+delFile);
		
		int success= 1;
		
		try {
			logger.info("익"+delFile.exists());
			if(delFile.exists()) { 
				delFile.delete();  //있다면 삭제
			}else {
				logger.info("이미삭제된 파일 "); 
			}
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			
			if(fileList.get(fileName) != null) { 
				fileList.remove(fileName);
				logger.info("삭제후남은파일"+fileList.size());
			}
			session.setAttribute("fileList", fileList);  //세션에서지워진것을 다시 set해서 넣어줘야함갱신개념
		} catch (Exception e) {
			success=0;
		} finally {
			map.put("success"	, success);
		}
		
		return map;
	}

	public ModelAndView edit(int idx, HttpSession session, RedirectAttributes rAttr) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		logger.info("edit의 서비스 왔니");
		HashMap<String,Object> map=dao.questionDetail(idx);
		logger.info("맵에있는"+map.get("ID"));	
		logger.info(""+loginId);
		String page ="redirect:/QuestionAll";
		String msg = "수정할 권한이 없습니다.로그인부탁드려용";
		//답변체크후 페이지 튕기기
		if(loginId !=null) {
			if(loginId.equals(map.get("ID"))) {
				if(map.get("ANSSTATUS").equals("TRUE")) {
					page = "redirect:/QuestionAll";
					msg ="사서의 답변이 달린 개시글은 놀랍게도 수정이 되지 않습니다. ";
				}else {
					map.put("REG_DATE", map.get("TO_CHAR(REG_DATE,'YYYY-MM-DD')"));
					mav.addObject("map", map);
					page="questionEdit";
				}
			}else {
				msg="아이디가일치하지않습니다. 수정권한이없습니다.";
			}
		}
		//이동하면서 그릇셋팅
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		HashMap<String, Object> initfileList = new HashMap<String, Object>();
	    ArrayList<String> dtoRead = dao.photoRead(idx);
	    logger.info(""+dtoRead);
	    for(int i=0;i <dtoRead.size();i++) {
	    	initfileList.put("initfileList"+i,dtoRead.get(i));
	    }
		
	
		logger.info(""+initfileList);
		session.setAttribute("initfileList", initfileList);
		logger.info("세션"+session.getAttribute("initfileList"));
		rAttr.addFlashAttribute("msg",msg);
		mav.setViewName(page);
		return mav;
	}
	
	@Transactional 
	public ModelAndView editSuccess(HashMap<String, Object> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		 session.getAttribute("initfileList");
		logger.info("세션"+session.getAttribute("initfileList"));
		HashMap<String, String> initList = (HashMap<String, String>) session.getAttribute("initfileList");
		logger.info(""+initList.get("initfileList1"));
		logger.info(""+initList.size());
		for(int i = 0; i<initList.size(); i++) {
			File initFileRead = new File("C:/upload/Library/"+initList.get("initfileList"+i));
			if(initFileRead.exists()) { 
				logger.info("존재하는 파일 추가 필요없음 >>"+initList.get("initfileList"+i)); 
			}else {
				logger.info("존재하지않는파일 추가 필요 >> "+initList.get("initfileList"+i));
				int success =dao.initLostFile(initList.get("initfileList"+i));
				logger.info("파일테이블 삭제여부?"+success);
			}	
		}
		//포문으로 기존사진의 존재여부를 체크후 없으면 테이블에서 삭제 해주고 있으면 할게없음 .. 위에서 처리할거해주고 
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("팔리"+fileList);
		logger.info("파람"+params);
		int upSuccess = dao.update(params); //업데이트 해주기갱신 정보 가져와서
		logger.info(""+upSuccess);
		logger.info(""+params.get("queidx"));
		params.get("queidx");
		logger.info(""+fileList.keySet());
		if(fileList.size() >0) {
			for(String key:fileList.keySet()) {			
			dao.fileWriting(key,fileList.get(key),params.get("queidx"));
			}
		}else{
		for(String newFileName : fileList.keySet()) {
			File file = new File("C:/upload/Library/"+newFileName);
			file.delete();
		}
	}
		
		session.removeAttribute("fileList");
		session.removeAttribute("initfileList");
		Object idx= params.get("queidx");
		mav.addObject("idx", idx);
		mav.setViewName("redirect:/questionDetail/"+idx);
		return mav;
	}

	public void mainNoticeCall(Model model) {
		ArrayList<LibraryInfoDTO> noticeList = dao.mainNoticeCall();
		model.addAttribute("noticeList", noticeList);
	}
	
	@Transactional
	public ModelAndView questionDelete(int idx,RedirectAttributes rAttr,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		HashMap<String, Object> dto=dao.questionDetail(idx);
		
		int success=0;
		
		String msg ="삭제권한이 없습니다...";
		
		if(loginId.equals(dto.get("ID"))) {	
			logger.info("답변달린여부"+dto.get("ANSSTATUS"));
			if(dto.get("ANSSTATUS").equals("TRUE")) {
				msg="놀랍게도 답변이 달린게시물은 삭제가되지않습니다.";
			}else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				ArrayList<LibraryInfoDTO> list =dao.fileCk(idx);
				logger.info(""+list);
				if(list !=null) {
					int i =0;
					for(i=0;i <list.size();i++) {
						map.put("del"+i,list.get(i));
						
						File delFile = new File("C:/upload/Library/"+ map.get("del"+i));
						
						if(delFile.exists()) { 
							delFile.delete();  //있다면 삭제
							logger.info("삭제하는중"+ map.get("del"+i));
						}else {
							logger.info("이미삭제된 파일 "); 
						}
					}
					
					success =dao.questionDelete(idx);
					if(success>0) {
						msg="성공";
					}
				}else {
					success =dao.questionDelete(idx);
					if(success>0) {
						msg="성공";
					}
				}
				
				
			}
			
		}
		
		
		  
		  logger.info("삭제성공"+success);
		  rAttr.addFlashAttribute("msg",msg);
		  mav.setViewName("redirect:/QuestionAll");
		return mav;
	}

	public LibraryInfoDTO noticePopup() {
		logger.info("팝업 유무 쿼리 요청");
		return dao.noticePopup();
	}

}
