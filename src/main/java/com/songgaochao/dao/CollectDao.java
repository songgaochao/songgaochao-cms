package com.songgaochao.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.songgaochao.pojo.Collect;

public interface CollectDao extends BaseDao<Collect>{

	@Select("select * from cms_collect where user_id = #{userId} and text =#{title}")
	Collect selectByTitleAndUserId(@Param("title")String title,@Param("userId")Integer userId);
}
