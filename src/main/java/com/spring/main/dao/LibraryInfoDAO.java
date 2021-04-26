package com.spring.main.dao;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.spring.main.dto.LibraryInfoDTO;

public interface LibraryInfoDAO {

	ArrayList<LibraryInfoDTO> list();

	LibraryInfoDTO noticeDetail(String idx);

}