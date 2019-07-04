package com.qq.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.qq.jsonmodel.JsonDWZ;

import com.qq.model.User;
import com.qq.service.UserService;



@Controller
@RequestMapping("/")
public class UserContoller {
	
	@Resource
	UserService userservice;
	@RequestMapping("/userlist")
	public String allUser(HttpServletRequest request){
		//查询所有的用户列表
		List<User> user=userservice.queryAll();
		request.setAttribute("USER", user);
		return "user/userlist";
		
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(HttpServletRequest request){
		String power = request.getParameter("power").trim();
		String name=request.getParameter("name").trim();
		String password=request.getParameter("password").trim();
		String  email =  request.getParameter("email").trim();
		String  acl =  request.getParameter("acl").trim();
		System.out.println(email+":"+acl);
		List<User> i = (List<User>)userservice.check(name);
	   if(i.size() == 0){
		  
		 //若数据库里面没有重复的用户名字则存入用户信息
		   userservice.add1(name, password,power,email,power);
		 		JsonDWZ jsonDWZ=new JsonDWZ("200","注册成功","","","","","");
				return jsonDWZ;
		 	     
	   }else{
			JsonDWZ jsonDWZ=new JsonDWZ("504","用户名已存在","","","","","");
			return jsonDWZ;
		    	
	   }	
	
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object  deleteuser(HttpServletRequest request){
	String  userid =  request.getParameter("userid");
	 int id = Integer.parseInt(userid);
	 userservice.del(id);
	 JsonDWZ jsonDWZ=new JsonDWZ("200","删除成功！","","","","","");
 		return jsonDWZ;
		    
	  }
	
	@RequestMapping("/Update")
	@ResponseBody
	public Object  udateUser(HttpServletRequest request){
	String  userid =  request.getParameter("userid");
	 int id = Integer.parseInt(userid);
	 		User oneuser = userservice.querryId(id);
	 		request.setAttribute("ONEUSER", oneuser);
	         int  updateid =oneuser.getUserid();
	         
	       String  json = new Gson().toJson(oneuser); 
	       System.out.println(json);
	     
	 JsonDWZ jsonDWZ=new JsonDWZ("200",json,"","","","","");
 		return jsonDWZ;
		    
	  }
	
	@RequestMapping("/Update1")
	@ResponseBody
	public Object  udateUser1(HttpServletRequest request){
	String  userid =  request.getParameter("id");
	String  name =  request.getParameter("name");
	String  pwd =  request.getParameter("password");
	String  power =  request.getParameter("power");
	String  email =  request.getParameter("email");
	String  acl =  request.getParameter("acl");
	
 	 int id = Integer.parseInt(userid);
	 int up = userservice.Update(id,name,pwd,power,email,acl);
	    
	     
	 JsonDWZ jsonDWZ=new JsonDWZ("200","成功修改用户信息","","","","","");
 		return jsonDWZ;
		    
	  }
	
	

}
