package com.spring.main.dao;

public interface  LibrarySearchDAO {

	int reserveBook(String bookIdx);

	int reserveBookCancel(String reserveBookIdx);

	int rentalBook(String reserveBookIdx);

	int returnBook(String reserveBookIdx);

}
