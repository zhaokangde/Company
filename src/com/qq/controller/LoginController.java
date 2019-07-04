package com.qq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.qq.jsonmodel.JsonDWZ;
import com.qq.model.InfoList;
import com.qq.model.Message;
import com.qq.model.Picture;
import com.qq.model.User;
import com.qq.service.MessageService;
import com.qq.service.PictureService;
import com.qq.service.UserService;



@Controller
public class LoginController {
	@Resource
	UserService userservice;
	@Resource
	MessageService messageservice;
	@RequestMapping("/login")
	public String login() {
		return "login"; //
	}	
	//关于我们
	@RequestMapping("/aboutUs")
	public String aboutUs1() {
	
		return "aboutUs"; 
	}
	//企业架构
	@RequestMapping("/companyjg")
	public String cpJg1() {
	
		return "companyjg"; 
	}
	
	//企业架构
	@RequestMapping("/rencai")
	public String rencai1() {
	
		return "rencai"; 
	}
	//找回密码
	@RequestMapping("/findpwd")
	@ResponseBody
	public JsonDWZ  findpwd(HttpServletRequest request,HttpSession session ) {
	  String email = request.getParameter("email");
	  String   username = request.getParameter("username");
	 System.out.println(email+username);
	 List<User> user =  userservice.check(username);
	 if(user!=null || user.size()>0) {
		 System.out.println(user);
		 JsonDWZ jsonDWZ=new JsonDWZ("200","hahah","","","","","");
			return jsonDWZ;	
	 }else {
		 JsonDWZ jsonDWZ=new JsonDWZ("2020","hahah","","","","","");
			return jsonDWZ;		 
	 }
	 
	
		
		
	}
/**
 * 前端首页请求
 */
	@RequestMapping("/userindex")
	public String userindex(HttpServletRequest request,HttpSession session ) {
		//查询所有信息
	 List<InfoList> allmessage =  messageservice.queryInfolist();
	 session.setAttribute("allmessage", allmessage);
	 for(InfoList message: allmessage){
	 System.out.println(message);
	 }
	 return "userindex"; 
	}
	/**
	 * 企业信息页面请求
	 */
	

	@RequestMapping("/qiyemessage")
	public String qiyemessage(HttpServletRequest request,HttpSession session ) {
		//查询所有信息
	 List<InfoList> allmessage =  messageservice.queryInfolist();
	 session.setAttribute("allmessage", allmessage);
	 for(InfoList message: allmessage){
	 System.out.println(message);
	 }
	 return "qiyemessage"; 
	}
	
	@RequestMapping("/moreInfo")
	public String moreInfo(HttpServletRequest request,HttpSession session,String classname) {
		//获取前端的分类标题
		//查询所有信息
		System.out.println("获取前端的分类标题"+classname);
	 List<InfoList> allmessage =  messageservice.queryInfolist();
	 List<InfoList>  onemessage = new ArrayList<>();
	
	 for(InfoList message: allmessage){
		if(message.getClassname().equals(classname)){
			onemessage.add(message);
			 System.out.println(message);
		}
		
	 }
	 session.setAttribute("onemessage", onemessage);
	 return "moreInfo"; 
	}
	
	
	
/**
 * 处理后台管理员登录
 */
	
	@RequestMapping("/dologin")
	@ResponseBody
	public Object dologin(HttpServletRequest request,HttpSession session) {
		String name=request.getParameter("name").trim();
		String password=request.getParameter("password").trim();	
		
		List<User> i = userservice.check1(name,password);
		String up ="";
		for(User userpower :i ){
		up = userpower.getPower();
		
		}       
		if(i!=null && up.equals("admin")){
			session.setAttribute("NAME", name);
		    System.out.println("管理员登录===========");
			JsonDWZ jsonDWZ=new JsonDWZ("200","admin","up","","","","");
			return jsonDWZ;
		}else{
			JsonDWZ jsonDWZ=new JsonDWZ("202","用户名或密码错误,或者权限不够","","","","","");
			return jsonDWZ;
		}	
	}	
	
	/**
	 * 普通用户登录处理
	 * @param id
	 * @return
	 */
	@RequestMapping("/doyhlogin")
	@ResponseBody
	public JsonDWZ userLogin(HttpServletRequest request,HttpSession session){
		String name=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		System.out.println(name+"  :  "+password);
		List<User> i = userservice.check1(name,password);
		String up ="";
		for(User userpower :i ){
		up = userpower.getPower();
		
		}
		if(i!=null){
			
			session.setAttribute("user",i.get(0));
			session.setAttribute("username",i.get(0).getUsername());
		    System.out.println("普通用户登录===========");
			JsonDWZ jsonDWZ=new JsonDWZ("200",name,"up","","","","");
			return jsonDWZ;
		}else{
			JsonDWZ jsonDWZ=new JsonDWZ("202","用户名或密码错误","","","","","");
			return jsonDWZ;
		}
	}		
	@RequestMapping("/dologinOut")
	public String ligout(HttpServletRequest request,HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("user");
		System.out.println("我退出登录了===============");
		return "redirect:userindex";
	} 
	
}
