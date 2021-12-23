package com.leh.board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leh.board.dto.CommentDTO;
import com.leh.board.repository.CommentRepository;


@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentRepository cr;

	@Override
	public void insert(CommentDTO comment) {
		// TODO Auto-generated method stub
		cr.insert(comment);
	}

	@Override
	public List<CommentDTO> findAll(long b_number) {
		// TODO Auto-generated method stub
		return cr.findAll(b_number);
	}


}
