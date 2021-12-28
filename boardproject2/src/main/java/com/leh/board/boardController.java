package com.leh.board;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.leh.board.dto.PageDTO;
import com.leh.board.dto.boardDTO;
import com.leh.board.service.boardService;


@Controller
@RequestMapping(value="/board/*")
public class boardController {
	
	@Autowired
	private boardService bs;
	
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert() {
		System.out.println("1");
		return "board/insert";
	}
	
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertForm(@ModelAttribute boardDTO board) throws IllegalStateException, IOException {
		bs.insert(board);
		System.out.println("2" + board);
		return "board/arlter";
	}
	
	
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<boardDTO> boardList = bs.findAll();
		model.addAttribute("boardList", boardList);
		System.out.println("3");
		return "board/findAll";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		bs.delete(b_number);
		System.out.println("삭제되었음");
		return "redirect:/board/findAllPage?page=";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String findById(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		bs.hits(b_number);
		boardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page); //detail.jsp�� ���� page���� ������ ��.
		System.out.println("410");
		return "board/detail";
	}
	
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		boardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		return "board/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute boardDTO board, @RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		bs.update(board);
		System.out.println("수정함");
		return "redirect:/board/detail?b_number="+board.getB_number() + "&page=" + page;
	}
	
	@RequestMapping(value="findAllPage", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page",  required=false, defaultValue="1") int page, Model model) {
		PageDTO paging = bs.paging(page);
		List<boardDTO> boardList = bs.pagingList(page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}
	

}
