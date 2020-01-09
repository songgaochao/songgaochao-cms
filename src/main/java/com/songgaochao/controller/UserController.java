package com.songgaochao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@RequestMapping("/center")
	public String userCenter() {
		return "user/center";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "user/register";
	}
	
	@RequestMapping("/article")
	public String article() {
		return "user/article";
	}
	
}
