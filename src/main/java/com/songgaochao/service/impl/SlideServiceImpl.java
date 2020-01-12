package com.songgaochao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.songgaochao.dao.SlideDao;
import com.songgaochao.pojo.Slide;
import com.songgaochao.service.SlideService;



@Service
public class SlideServiceImpl implements SlideService{
	@Autowired
	private SlideDao slideDao;
	@Override
	public List<Slide> getAll() {
		return slideDao.select(null);
	}

}
