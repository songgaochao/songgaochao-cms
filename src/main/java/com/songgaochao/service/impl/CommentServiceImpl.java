package com.songgaochao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.songgaochao.dao.CommentDao;
import com.songgaochao.pojo.Comment;
import com.songgaochao.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;

	@Override
	public PageInfo<Comment> getPageInfo(Comment comment, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Comment> commentlist = commentDao.select(comment);
		return new PageInfo<>(commentlist);
	}
	
}
