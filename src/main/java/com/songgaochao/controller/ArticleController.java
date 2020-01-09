package com.songgaochao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article/")
public class ArticleController {
	/**
	 * @Title: add   
	 * @Description: 文章添加  （发布文章）
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/add")
	public String add() {
		return "article/add";
	}
	/**
	 * @Title: articles   
	 * @Description: 文章管理（我的文章）   
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/articles")
	public String articles() {
		return "article/articles";
	}
}
