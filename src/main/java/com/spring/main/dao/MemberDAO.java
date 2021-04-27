package com.spring.main.dao;

import java.util.HashMap;

public interface MemberDAO {

	int join(HashMap<String, String> params);

	int memOverlay(String id);

	String login(String id);

	String findId(String name, int phone);

}
