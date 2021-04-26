package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BookDTO;

public interface  LibrarySearchDAO {

	int reserveBook(String bookIdx);

	int reserveBookCancel(String reserveBookIdx);

	int rentalBook(String reserveBookIdx);

	int returnBook(String reserveBookIdx);

	ArrayList<BookDTO> searchResult(HashMap<String, String> params);

}
