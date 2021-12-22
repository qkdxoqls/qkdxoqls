package com.leh.board.repository;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.leh.board.dto.boardDTO;


@Repository
public class BoardRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void insert(boardDTO board) {
		// TODO Auto-generated method stub
		System.out.println("insert삽입");
		sql.insert("board.insert", board);
	}

	public List<boardDTO> findAll() {
		// TODO Auto-generated method stub
		System.out.println("findAll 실행");
		return sql.selectList("board.findAll");
	}

	public void hits(long b_number) {
		// TODO Auto-generated method stub
		sql.update("board.hits", b_number);
	}

	public boardDTO findById(long b_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.findById", b_number);
	}

	public List<boardDTO> pagingList(int pagingStart) {
		// TODO Auto-generated method stub
		return sql.selectList("board.pagingList", pagingStart);
	}

	public int boardCount() {
		// TODO Auto-generated method stub
		return sql.selectOne("board.count");
	}

	public void delete(long b_number) {
		// TODO Auto-generated method stub
		sql.delete("board.delete", b_number);
	}

	
	
}
