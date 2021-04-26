package com.spring.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.LibrarySearchDAO;


@Service
public class LibrarySearchService {

	@Autowired LibrarySearchDAO dao;
	public int reserveBook(String bookIdx) {
		return dao.reserveBook(bookIdx);
	}
	public int reserveBookCancel(String reserveBookIdx) {
		return dao.reserveBookCancel(reserveBookIdx);
	}

}
