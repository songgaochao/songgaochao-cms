package com.songgaochao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.songgaochao.common.CMSException;
import com.songgaochao.common.utils.StringUtil;
import com.songgaochao.dao.CollectDao;
import com.songgaochao.pojo.Collect;
import com.songgaochao.service.CollectService;

@Service
public class CollectServiceImpl implements CollectService {

	@Autowired
	private CollectDao collectDao;

	@Override
	public PageInfo<Collect> select(Collect collect, Integer pageNum, Integer pageSize) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<Collect> list = collectDao.select(collect);
		return new PageInfo<>(list);
	}

	@Override
	public int insert(Collect collect) {
		if(!StringUtil.isHttpUrl(collect.getUrl())) {
			throw new CMSException("不是合法的url......");
		}
		
		return collectDao.insert(collect);
	}

	@Override
	public int delete(String ids) {
		return collectDao.delete(ids);
	}

	@Override
	public Collect selectByTitleAndUserId(String title, Integer userId) {
		return collectDao.selectByTitleAndUserId(title, userId);
	}
	
	
}
