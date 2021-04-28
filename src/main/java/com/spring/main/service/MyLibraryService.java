package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.QuestionDAO;
import com.spring.main.dto.QuestionDTO;

@Service
public class MyLibraryService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired QuestionDAO dao;
	@Value("#{config['Globals.root']}") String root;
	
	
	  public ModelAndView question_list() {
	  
	  logger.info("나의 문의내역 요청"); 
	  ModelAndView mav = new ModelAndView();
	  
	  ArrayList<QuestionDTO> list = dao.question_list();
	  mav.addObject("questionList", list); 
	  mav.setViewName("myLib_question");
	  
	  return mav;
	  
	  }
	 

	public ModelAndView question_detail(HashMap<String, Object> params) {
	//public HashMap<String, Object> question_detail(String idx) {
		ModelAndView mav = new ModelAndView();
		logger.info("상세보기 요청");
		//HashMap<String, Object> map = new HashMap<String, Object>();
		QuestionDTO dto = dao.question_detail(params);// 상세 보기
		//HashMap<String, Object> dto = dao.question_detail(idx);
		//map.put("question_info",dto);
		mav.addObject("question_info", dto);
		mav.setViewName("myLib_question_detail");
		
		//ArrayList<QuestionPhotoDTO> fileList = dao.fileList(idx);
		//mav.addObject("fileList",fileList);
		
		return mav;
		//return map;
	}

	public ModelAndView question_edit(QuestionDTO dto) {
		ModelAndView mav = new ModelAndView();
		logger.info("문의글 수정 요청");
		int success = dao.question_edit(dto);
		String page = "myLib_question_edit";
		if (success > 0) {
			logger.info("글수정 성공");
			page = "redirect:/";
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView question_delete(String idx) {
		ModelAndView mav = new ModelAndView();
		logger.info("문의글 삭제 요청");
		int success = dao.question_delete(idx);
		String page = "myLib_question_detail";
		if (success > 0) {
			page = "myLib_question";
		}
		mav.setViewName(page);

		return mav;
	}


	/*public ModelAndView question_write(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		logger.info("글쓰기 요청");
		//int success = dao.question_write(dto);
		String page = "questionWrite";
		QuestionDTO dto = new QuestionDTO();
		dto.setSubject(params.get("subject"));
		dto.setContent(params.get("content"));
		dto.setShowstatus(params.get("showstatus"));
		dto.setType(params.get("type"));
		
		//1. 세션에 fileList를 가져온다.
		HashMap<String, String> fileList = (HashMap<String, String>)session.getAttribute("fileList");
		
		if(dao.question_write(dto)>0) {//마이바티스(bbs_mapper) 에서 idx값 뽑아오기
			//성공하게 되면 키가 파라메터 bean에 담기게 된다.
			logger.info("idx : "+dto.getQueidx());
			
			//2. fileList에 저장된 파일이 있는지 확인한다.(사이즈 확인)
			if(fileList.size()>0) {
				//3.업로드 한 파일이 있을 경우 파일 내용을 DB에 기록
				//fileIdx,oriFileName,newFileName,idx
				//맵에 있는 모든 값을 빼서 DB에 넣는다.
				for(String key : fileList.keySet()) {
					dao.writeFile(key,fileList.get(key),dto.getQueidx());
				}
			}
			page="redirect:/question_detail/"+dto.getQueidx();//성공하면 해당 상세페이지로 이동
		}else {
			
			for(String newFileName : fileList.keySet()) {//파일을 업로드 한 상태에서 글쓰기가 실패되었다면 업로드한 내용을 모두 지워준다.
				File file = new File(root+"upload/"+newFileName);
				file.delete();
			}
		}
		session.removeAttribute("fileList");//파일 업로드가 다 끝난다면 session에서 삭제
		mav.setViewName(page);
	
		return mav;
	}*/
	
	/*
	public ModelAndView file_upload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		File dir = new File(root+"upload/");//1. 경로 설정
		if(!dir.exists()) {	//2. 경로가 없으면 생성
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
	
		String fileName = file.getOriginalFilename();//3. 파일명 추출
		
		//4. 새파일명 생성(현재시간을 밀리세컨드로 환산한 이름)
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		logger.info(fileName+"=>"+newFileName);
		
		try {//5. 파일 저장
			byte[] bytes = file.getBytes();//MultipartFile 에서 바이너리데이터를 추출
			Path filePath = Paths.get(root+"upload/"+newFileName);//저장할 경로를 지정
			Files.write(filePath,bytes);//파일 저장
			
			//session에 내가 저장한 파일 내역을 저장한다.
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			fileList.put(newFileName, fileName);
			logger.info("현재 저장된 파일 수 : "+fileList.size());
			session.setAttribute("fileList", fileList);
			mav.addObject("path","/photo/"+newFileName);
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
		//****이거 적어줘야 컨트롤러로 보내고도 에러화면이 안떠!!!!!
		mav.setViewName("uploadForm");//이걸 안적어줘서 파일이 content에 추가되지 않았음....
		return mav;
	}*/


	public HashMap<String, Object> page_list(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//5개 기준으로 몇페이지나 만들 수 있는가?
		int allCnt = dao.allCount();
		logger.info("allCnt:"+allCnt);
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		//예: 21/5 = 4.1 이면 소숫점을 버리고 1을 더해 5가 된다. 아니면 있는 그대로...
		int range = allCnt%5 > 0? Math.round(allCnt/5)+1 : Math.round(allCnt/5);
		logger.info("만들수있는 페이지~"+range);
		
		//생성 가능한 페이지보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range? range:page;
		
		//시작, 끝
		int end = page * 5;
		int start = end - 5+1;
		map.put("page_list",dao.page_list(start,end));
		
		map.put("range", range);
		map.put("currPage",page);
		logger.info("map:{}",map);
		//전체 게시글 수 
		//map.put("totalCnt",dao.allCount());
		return map;
	}

}
