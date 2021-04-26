package com.spring.main.dao;

public interface  LibrarySearchDAO {

	int reserveBook(String bookIdx);

	int reserveBookCancel(String reserveBookIdx);

}
