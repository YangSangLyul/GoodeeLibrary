package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.QuestionDAO;
import com.spring.main.dto.QuestionDTO;

@Service
public class MyLibraryService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Value("#{props['Globals.root']}") String root;
	
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
		
		
		QuestionDTO dto = dao.detail(idx);//상세 보기
		if(dto!=null) {//상세보기 정보를 정상적으로 가져왔다면...
			page="detail";
			mav.addObject("question_info",dto);
		}
		
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView question_edit(QuestionDTO dto) {
		ModelAndView mav = new ModelAndView();
		logger.info("문의글 수정 요청");
		int success = dao.edit(dto);
		String page = "myLib_question_detail";
		if(success >0) {
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
		String page = "writeForm";
		if(success > 0) {
			page = "redirect:/";
		}
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*file upload 시작*/
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
	}

	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
HashMap<String, Object> map = new HashMap<String, Object>();
		
		//fileName으로 실제 파일 삭제
		File delFile = new File(root+"upload/"+fileName);
		int success=1;
		try {
			logger.info("delete file : "+delFile);
			if(delFile.exists()) {
				delFile.delete();
			}else {
				logger.info("이미 삭제된 파일");
			}
			
			//session -> fileList -> 파일명 삭제 -> session
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if(fileList.get(fileName)!=null) {
				fileList.remove(fileName);
				logger.info("삭제후 남은 파일 수: "+fileList.size());
			}
			session.setAttribute("fileList", fileList);
		}catch (Exception e) {
			success=0;
		}finally {
			//결과를 map에 담아서 반환
			map.put("success", success);
		}
		return map;
	}
	


}
