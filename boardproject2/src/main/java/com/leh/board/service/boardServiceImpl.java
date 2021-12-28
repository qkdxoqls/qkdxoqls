package com.leh.board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.leh.board.dto.PageDTO;
import com.leh.board.dto.boardDTO;
import com.leh.board.repository.BoardRepository;


@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	private BoardRepository br;

	@Override
	public void insert(boardDTO board) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		// dto에 담긴 파일을 가져옴
		MultipartFile b_file = board.getB_file();
		// 파일이름을 가져옴(파일이름을 DB에 저장하기위해)
		String b_filename = b_file.getOriginalFilename();
		// 파일명 중복을 피하기위해 파일이름앞에 현재시간값을 붙임.
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename: " + b_filename);
		// 파일 저장 
		String savePath = "C:\\Users\\master\\Desktop\\Vin3\\boardproject2\\src\\main\\webapp\\resources\\upload\\"+b_filename;
		// bfile이 비어있지 않다면 savePath에 저장
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		// 여기까지의 내용은 파일을 저장하는 과정
		
		board.setB_filename(b_filename);
		br.insert(board);
	}

	@Override
	public List<boardDTO> findAll() {
		// TODO Auto-generated method stub
		return br.findAll();
	}

	@Override
	public void hits(long b_number) {
		// TODO Auto-generated method stub
		br.hits(b_number);
	}

	@Override
	public boardDTO findById(long b_number) {
		// TODO Auto-generated method stub
		return br.findById(b_number);
	}

	@Override
	public void update(boardDTO board) {
		// TODO Auto-generated method stub
		br.update(board);
	}
	
	private static final int PAGE_LIMIT = 5; // ���������� ������ �� ���� 
	private static final int BLOCK_LIMIT = 3; // ��ȭ�鿡 ������ ������ ����

	@Override
	public List<boardDTO> pagingList(int page) {
		// 1������ 0,3 /2������ 3,3 ....
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<boardDTO> pagingList = br.pagingList(pagingStart);
//		List<boardDTO> pagingList1 = br.pagingList1(pagingParam);
		for(boardDTO b: pagingList) {
			System.out.println(b.toString());
		}
		return pagingList;
	}
	
	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount();// �� �ʿ��� ������ ���� ���
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
	public void delete(long b_number) {
		// TODO Auto-generated method stub
		br.delete(b_number);
	}


}
