package com.qq.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qq.jsonmodel.JsonDWZ;
import com.qq.model.User;
import com.qq.service.UserService;



@Controller
@RequestMapping("/")
public class Register {

	
@RequestMapping("/register")
public String register() {
		return "regist"; //注册页面
	}

@Resource
UserService userservice;
@RequestMapping("/doregister")
@ResponseBody
public Object doregister(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
	String name=request.getParameter("name").trim();
	String password=request.getParameter("password").trim();
	List<User> i = (List<User>)userservice.check(name);
   if(i.size() == 0){
	  
	 //获取注册信息存入数据库，返回登录页面；
	 		userservice.add(name,password);
	 		JsonDWZ jsonDWZ=new JsonDWZ("200","注册成功","login","","","","");
			return jsonDWZ;
	 	     
   }else{
		JsonDWZ jsonDWZ=new JsonDWZ("504","用户名已存在","","","","","");
		return jsonDWZ;
	    	
   }	
		
	

}

}
