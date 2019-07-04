package com.qq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qq.model.InfoList;
import com.qq.model.Message;

public interface MessageMapper {

	public  List<InfoList> queryInfolist();

	public int add(@Param(value="title")String title, @Param(value="classid")int classid,@Param(value="content")String content,@Param(value="publishtime") String publishtime,@Param(value="picid") int picid);

	public InfoList queryInfolist1(int contnetId);

	public int deleteByContentId(@Param("contentId")int contentId);

	public int update(@Param(value="title")String title, @Param(value="classlistid")int classlistid,@Param(value="content") String content, @Param(value="format") String format, @Param(value="picid") int picid,@Param(value="name") int name);

	
}
