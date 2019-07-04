package com.qq.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qq.mapper.CriticalMapper;
import com.qq.model.Critical;

@Service
public class CriticalService {
	
   @Resource
	CriticalMapper criticalMapper;
	//添加留言
	public int liuYan(Critical text) {
		// TODO Auto-generated method stub
		return criticalMapper.add(text);
	}
	//查询留言
		public List<Critical> findCriticalByid(int id) {
			// TODO Auto-generated method stub
			return criticalMapper.findCriticalByid(id);
		}
		public List<Critical> findAllbytype(String type){
			// TODO Auto-generated method stub
			return criticalMapper.findAllbytype(type);
		}
		public int delete(Integer criticalId) {
			
			return criticalMapper.delete(criticalId);
		}
		
		public List<Critical> findreplyByType(String type) {
			// TODO Auto-generated method stub
			return criticalMapper.findreplyByType(type);
		}
		public int updateStatus(String uuid) {
			// TODO Auto-generated method stub
			return criticalMapper.updateStatus(uuid);
		}
	

}
