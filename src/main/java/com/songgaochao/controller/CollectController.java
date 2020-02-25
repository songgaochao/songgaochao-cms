package com.songgaochao.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.songgaochao.common.CmsConst;
import com.songgaochao.pojo.Collect;
import com.songgaochao.pojo.User;
import com.songgaochao.service.CollectService;

@Controller
public class CollectController {

	@Autowired
	private CollectService collectService;
	
	@RequestMapping("/article/collects")
	public String collectlist(Model model,Collect collect,@RequestParam(defaultValue="1") Integer pageNum ,@RequestParam(defaultValue="3")Integer pageSize) {
		
		PageInfo<Collect> pageInfo = collectService.select(collect, pageNum, pageSize);
		model.addAttribute("pageInfo", pageInfo);
		return "/article/collectc";		
	}
	
	@RequestMapping("/delete")
	public String dele(String ids) {
		
		collectService.delete(ids);
		
		return "redirect:/article/collects";		
	}
	@ResponseBody
	@RequestMapping("/deletes")
	public boolean dele(String ids,HttpSession session) {		
		User userInfo = (User)session.getAttribute(CmsConst.UserSessionKey);
		if(userInfo==null) {
			return false;
		}		
	
		return collectService.delete(ids)>0;		
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public boolean insert(Collect collect,HttpSession session) {
		User userInfo = (User)session.getAttribute(CmsConst.UserSessionKey);
		if(userInfo==null) {
			return false;
		}		
		collect.setUser_id(userInfo);
		collect.setCreated(new Date());
		return collectService.insert(collect)>0;
	 		
	}
	
}
