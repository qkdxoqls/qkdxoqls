package com.leh.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leh.board.dto.PageDTO;
import com.leh.board.dto.memberDTO;
import com.leh.board.service.memberService;


@Controller
@RequestMapping(value="/member/*")
public class memberController {
	
	@Autowired
	private memberService ms;
	
	
	@RequestMapping(value="save", method=RequestMethod.GET)
	public String save() {
		System.out.println("save");
		return "member/save";
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public String saveForm (@ModelAttribute memberDTO member) {
		ms.save(member);
		System.out.println("saveForm() : " + member);
		return "member/home";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		System.out.println("login");
		return "member/login";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage() {
		System.out.println("mypage");
		return "member/mypage";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST) 
	public String loginForm(@ModelAttribute memberDTO member) {
		String resultPage = ms.login(member);
		System.out.println("loginDATA Pass" + member);
		return resultPage;
	}
	
	@RequestMapping(value="mainindex", method=RequestMethod.GET)
	public String mainindex() {
		System.out.println("mainindex");
		return "member/mainindex";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("logout");
		return "member/home";
	}
	
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<memberDTO> memberList = ms.findAll();
		model.addAttribute("memberList", memberList);
		System.out.println("findAll" + memberList);
		return "member/findAll";
	}
	
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(@RequestParam("m_number") long m_number, Model model) {
		memberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		System.out.println("detail"+ member);
		return "member/detail";
	}
	
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuolicate(@RequestParam("m_id") String m_id) {
		System.out.println("memberController.idDuplicate():" + m_id);
		String result = ms.idDuplicate(m_id);
		System.out.println("아이디 중복확인 중 ");
		return result;
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page",  required=false, defaultValue="1") int page, Model model) {
		PageDTO paging = ms.paging(page);
		List<memberDTO> memberList = ms.pagingList(page);
		model.addAttribute("memberList", memberList);
		model.addAttribute("paging", paging);
		return "member/findAll";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		ms.delete(m_number);
		System.out.println("삭제되었음");
		return "redirect:/member/paging?page=";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("m_number") long m_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		memberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		model.addAttribute("page", page);
		return "member/update";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute memberDTO member, @RequestParam("m_number") long m_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		ms.update(member);
		System.out.println("수정함");
		return "redirect:/member/mypage?m_number="+member.getM_number() + "&page=" + page;
	}
	
	
}
