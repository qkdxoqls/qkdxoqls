package com.leh.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leh.board.dto.CommentDTO;
import com.leh.board.service.CommentService;


@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService cs;
	
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	//public void save(@RequestParam("c_writer") String c_writer, @RequestParam("c_contents") String c_contents,
	//		@RequestParam("b_number") String b_number) {
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment){
		System.out.println("CommentController.save(): " + comment);
		cs.insert(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());
		return commentList;
	}
}
