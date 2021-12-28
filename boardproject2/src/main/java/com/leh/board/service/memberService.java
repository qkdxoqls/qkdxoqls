package com.leh.board.service;

import java.util.List;

import com.leh.board.dto.memberDTO;

public interface memberService {

	public void save(memberDTO member);

	public String login(memberDTO member);

	public List<memberDTO> findAll();
	
	public memberDTO findById(long m_number);

	public memberDTO detail(long m_number);

	public String idDuplicate(String m_id);

	public List<memberDTO> pagingList(int page);
	
	public com.leh.board.dto.PageDTO paging(int page);

	public void delete(long m_number);

	public void update(memberDTO member);
	
}
