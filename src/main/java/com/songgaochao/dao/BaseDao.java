package com.songgaochao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseDao<T> {

	/**select
	 * 按条件查询
	 * @param user
	 * @return
	 */
	List<T> selectu(T t);
	/**
	 * ID查询
	 * @param id
	 * @return
	 */
	T selectuid(T t);
	/**
	 * 新增
	 * @param user
	 * @return
	 */
	int insertu(T t);
	/**
	 * 修改
	 * @param user
	 * @return
	 */
	int updateu(T t);
	/**
	 * 删除
	 */
	int deleteu(@Param("ids") String ids);
}
