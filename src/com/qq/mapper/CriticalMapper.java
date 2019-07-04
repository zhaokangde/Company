package com.qq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qq.model.Critical;


public interface CriticalMapper {


	public int add(Critical text);

	public List<Critical> findCriticalByid(@Param("id")int id);

	public List<Critical> findAllbytype(@Param("type")String type);

	public int delete(@Param("criticalId")Integer criticalId);

	public List<Critical> findreplyByType(@Param("type")String type);

	public int updateStatus(@Param("uuid")String uuid);

	
	
}
