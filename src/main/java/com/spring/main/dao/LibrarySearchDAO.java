package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BookDTO;

public interface  LibrarySearchDAO {

	int reserveBook(HashMap<String, String> params);

	int reserveBookCancel(String reserveBookIdx);

	int rentalBook(String reserveBookIdx);

	int returnBook(String reserveBookIdx);

	ArrayList<BookDTO> searchResult(HashMap<String, String> params);

	BookDTO searchResultDetail(String bookIdx);

	Integer reserveChk(String bookIdx);

	int reserveChkId(String bookIdx, String id);

	int notificationRead(String noticeIdx);

	int maximumRentalChk(String loginId);

	int RentalChk(String loginId);

}
