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

	BookDTO bookManageDetail(String bookIdx);

	int reserveCnt(String bookIdx);

	int insertRecommendBook(HashMap<String, String> params);

	int bookInsert(BookDTO dto);

	ArrayList<BookDTO> reserve_list(int start, int end, String loginId);

	int allCount(String loginId);

	int allCnt();

	ArrayList<BookDTO> bookList(int start, int end);

	ArrayList<BookDTO> normalBookFilter(int start, int end);

	int hopeBookInsert(HashMap<String, String> params);

	int monthAllCnt(HashMap<String, Object> map);

	ArrayList<BookDTO> newBooksList(HashMap<String, Object> map);

	int monthRecommendAll(HashMap<String, Object> map);

	ArrayList<BookDTO> recommendBooksList(HashMap<String, Object> map);
}
