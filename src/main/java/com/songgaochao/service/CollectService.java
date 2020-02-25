package com.songgaochao.service;

import com.github.pagehelper.PageInfo;
import com.songgaochao.pojo.Collect;

public interface CollectService {
	/**
	 * 查询
	 * @param collect
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public PageInfo<Collect> select(Collect collect, Integer pageNum, Integer pageSize);
 
	/**
	 * 添加
	 * @param collect
	 * @return
	 */
	public int insert(Collect collect);
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public int delete( String ids);
	/**
	 * 
	 * @Title: selectByUrlAndUserId 
	 * @Description: 根据url和userid 查询此文章是否被该用户收藏过
	 * @param url
	 * @param userId
	 * @return
	 * @return: Collect
	 */
	Collect selectByTitleAndUserId(String title,Integer userId);
	
}
