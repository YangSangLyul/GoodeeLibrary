package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BookDTO;

public interface BookDAO {

	ArrayList<BookDTO> bookManageList();

	ArrayList<BookDTO> normalBookFilter(ArrayList<String> filter);

}
