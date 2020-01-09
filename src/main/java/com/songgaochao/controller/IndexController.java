package com.songgaochao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	@RequestMapping("/")
	public String index() {
		return "index";		
	}
	
	@RequestMapping("/article/detail/{id}.html")
	public String articleDetail(@PathVariable Integer id) {
		
		return "article-detail";
		
	}
}
