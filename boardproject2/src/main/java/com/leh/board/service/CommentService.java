package com.leh.board.service;

import java.util.List;

import com.leh.board.dto.CommentDTO;

public interface CommentService {

	void insert(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

}
