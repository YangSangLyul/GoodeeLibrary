package com.spring.main.dao;

import java.util.HashMap;

import com.spring.main.dto.MemberDTO;

public interface MemberDAO {

	int join(HashMap<String, String> params);

	int memOverlay(String id);

	String login(String id);

	String findId(String name, int phone);

	String findPw(HashMap<String, String> params);

	int newPw(MemberDTO dto);

	int memWithdraw(String loginId);

	MemberDTO myLib_UpdateForm(String id);

	int memUpdate(MemberDTO dto);

	String withdrawChk(HashMap<String, String> params);
}
