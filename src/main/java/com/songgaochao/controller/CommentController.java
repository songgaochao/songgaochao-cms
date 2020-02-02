package com.songgaochao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.songgaochao.pojo.Comment;
import com.songgaochao.service.CommentService;

@Controller
public class CommentController {
		@Autowired
	   private CommentService commentService;
		
		@RequestMapping("commentlist")
		public String commentServicelist(Model model,Comment comment,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="3")Integer pageSize) {
			PageInfo<Comment> info = commentService.getPageInfo(comment, page, pageSize);
			model.addAttribute("info",info);
			return "comment/commentlist";
			
		}
}
