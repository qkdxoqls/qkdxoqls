package com.leh.board.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.leh.board.dto.memberDTO;

@Repository
public class memberRepository {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public void save(memberDTO member) {
		// TODO Auto-generated method stub
		System.out.println("memberSave1");
		sql.insert("member.save", member);
	}

	public memberDTO login(memberDTO member) {
		System.out.println("memberLogin");
		return sql.selectOne("member.login", member);
	}

	public List<memberDTO> findAll() {
		// TODO Auto-generated method stub
		System.out.println("findAll");
		return sql.selectList("member.findAll", sql);
	}

	public memberDTO findById(long m_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("member.findById", m_number);
	}

	public memberDTO detail(long m_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("member.detail", m_number);
	}

	public String idDuplicate (String m_id) {
		System.out.println("830");
		return sql.selectOne("member.idDuplicate", m_id);
		
	}
	
	public List<memberDTO> pagingList(int pagingStart) {
		return sql.selectList("member.pagingList", pagingStart);
	}
	public List<memberDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("member.pagingList1", pagingParam);
	}

	public int boardCount() {
		// TODO Auto-generated method stub
		return sql.selectOne("member.count");
	}

	public void delete(long m_number) {
		// TODO Auto-generated method stub
		sql.delete("member.delete", m_number);
	}

	public void update(memberDTO member) {
		// TODO Auto-generated method stub
		sql.update("member.update", member);
	}


}
