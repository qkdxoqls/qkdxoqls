package com.leh.board.service;

import java.io.IOException;
import java.util.List;

import com.leh.board.dto.PageDTO;
import com.leh.board.dto.boardDTO;

public interface boardService {

	public void insert(boardDTO board) throws IllegalStateException, IOException;

	public List<boardDTO> findAll();

	public void hits(long b_number);

	public boardDTO findById(long b_number);

	public void update(boardDTO board);

	List<boardDTO> pagingList(int page);

	public PageDTO paging(int page);

	public void delete(long b_number);

}
