package com.qq.service;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.qq.mapper.UserMapper;

import com.qq.model.User;



@Service
public class UserService {
	
	@Resource
	UserMapper usermapper;
	
//	public List<User> queryAll(){
//		
//		List<Staff> staff= staffmapper.queryAll();
//		return staff;
//	}
//	
//	public int del(int id) {
//		return staffmapper.del(id);
//		
//	}
//	
//	public int add(Staff staff) {
//		return staffmapper.add(staff);
//	}
//	
//	public Staff queryOne(int id) {
//		return staffmapper.queryOne(id);
//	}
//	
//	public int edit(Staff staff) {
//		return staffmapper.edit(staff);
//	}
//
//	public Staff check(String name, String password) {
//		return staffmapper.check(name,password);
//	}

	public int add(String name, String password) {
		// TODO Auto-generated method stub
		return usermapper.add(name,password);
	}

	public List<User> check(String name) {
		// TODO Auto-generated method stub
		return usermapper.check(name);
	}

	public List<User> check1(String name, String password) {
		// TODO Auto-generated method stub
		return usermapper.check1(name,password);
	}

	public List<User> queryAll() {
		
		return usermapper.queryAll();
	}

	public int add1(String name, String password, String power,String email,String acl) {
		return usermapper.add1(name,password,power,email,acl);
		
	}

	public int del(int id) {
		// TODO Auto-generated method stub
		return usermapper.del(id);
	}

	public int Update(int id, String name, String pwd, String power,String email,String acl) {
		return usermapper.Update(id,name,pwd,power,email,acl);
		
	}

	public User querryId(int id) {
		// TODO Auto-generated method stub
		return usermapper.querryId(id);
	}
}
