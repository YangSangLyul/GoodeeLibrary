package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BookDTO;

public interface BookDAO {

	ArrayList<BookDTO> bookManageList();

	ArrayList<BookDTO> normalBookFilter(ArrayList<String> filter);

	int bookStateChange(HashMap<String, String> params);

	int reserveApproval(HashMap<String, String> params);

	int userReserveNotification(HashMap<String, String> params);

}
