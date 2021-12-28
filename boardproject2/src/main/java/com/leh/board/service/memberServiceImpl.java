package com.leh.board.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leh.board.dto.PageDTO;
import com.leh.board.dto.memberDTO;
import com.leh.board.repository.memberRepository;


@Service
public class memberServiceImpl implements memberService{
	
	@Autowired
	private memberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	
	@Override
	public void save(memberDTO member) {
		// TODO Auto-generated method stub
		mr.save(member);
	}

	@Override
	public String login(memberDTO member) {
		memberDTO loginmember = mr.login(member);
		if(loginmember != null) {
			session.setAttribute("loginId", loginmember.getM_id());
			session.setAttribute("loginName", loginmember.getM_name());
			session.setAttribute("loginNumber", loginmember.getM_number());
			System.out.println("777");
			return "member/mainindex";
		} else {
			System.out.println("444");
			return "member/loginf";
		}
	}

	@Override
	public List<memberDTO> findAll() {
		// TODO Auto-generated method stub
		return mr.findAll();
	}


	@Override
	public memberDTO findById(long m_number) {
		// TODO Auto-generated method stub
		return mr.findById(m_number);
	}
	
	@Override
	public memberDTO detail(long m_number) {
		// TODO Auto-generated method stub
		return mr.detail(m_number);
	}

	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null) {
			System.out.println("640");
			return "ok";
		}else
			System.out.println("740");
			return "no";
	}
	
	private static final int PAGE_LIMIT = 3; // ���������� ������ �� ���� 
	private static final int BLOCK_LIMIT = 3; // ��ȭ�鿡 ������ ������ ����


	@Override
	public List<memberDTO> pagingList(int page) {
		// 1������ 0,3 /2������ 3,3 ....
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<memberDTO> pagingList = mr.pagingList(pagingStart);
//		List<memberDTO> pagingList1 = mr.pagingList1(pagingParam);
		for(memberDTO m: pagingList) {
		System.out.println(m.toString());
		}
		return pagingList;
	}

	@Override
	public PageDTO paging(int page) {
		int boardCount = mr.boardCount();// �� �ʿ��� ������ ���� ���
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));// ��ü �������� ���
		// 2�������� ��û������ 1������, 4�������� ��û������, 4������...8�������� ��û�ϸ� 7���������� ������ ���
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		System.out.println("paging.toString(): "+ paging.toString());
		
		return paging;
	}

	@Override
	public void delete(long m_number) {
		// TODO Auto-generated method stub
		mr.delete(m_number);
	}

	@Override
	public void update(memberDTO member) {
		// TODO Auto-generated method stub
		mr.update(member);
	}

	
	


	
	

}
