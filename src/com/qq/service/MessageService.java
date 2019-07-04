package com.qq.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qq.mapper.MessageMapper;
import com.qq.model.InfoList;
import com.qq.model.Message;

@Service
public class MessageService  {
@Resource
MessageMapper messagemapper;
	    
		public List<InfoList> queryInfolist() {
		
			return messagemapper.queryInfolist();
	}
		//存入管理员发布的所有content表信息
		public int  add(String title, int classid, String content, String publishtime, int picid) {
		
			return messagemapper.add(title, classid, content,  publishtime,picid);
		}
		public InfoList queryInfolist1(int contnetId) {
			
			return messagemapper.queryInfolist1(contnetId);
		}
		
		public int deleteByContentId(int contentId){
			
			return messagemapper.deleteByContentId(contentId);
		}
		public int update(String title, int classlistid, String content, String format, int picid, int id) {
			// TODO Auto-generated method stub
			return messagemapper.update(title, classlistid, content, format,picid,id);
		}


}
