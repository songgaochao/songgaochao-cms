package com.songgaochao.service;

import com.github.pagehelper.PageInfo;
import com.songgaochao.pojo.Comment;

public interface CommentService {

 public	PageInfo<Comment> getPageInfo(Comment comment ,Integer page,Integer pageSize);
	
}
