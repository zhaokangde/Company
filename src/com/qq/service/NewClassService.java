package com.qq.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qq.mapper.NewclassMapper;
import com.qq.mapper.UserMapper;
import com.qq.model.Newclass;

@Service
public class NewClassService {
	@Resource
	NewclassMapper newclassmapper;

	public List<Newclass> queryclass() {
		// TODO Auto-generated method stub
		return newclassmapper.queryclass();
	}
}
