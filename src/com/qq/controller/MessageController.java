package com.qq.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.google.gson.Gson;
import com.qq.jsonmodel.JsonDWZ;
import com.qq.model.Critical;
import com.qq.model.InfoList;
import com.qq.model.Newclass;
import com.qq.model.Picture;
import com.qq.service.CriticalService;
import com.qq.service.MessageService;
import com.qq.service.NewClassService;
import com.qq.service.PictureService;

@Controller
@RequestMapping("/")
public class MessageController {
	@Resource
	NewClassService newcalssservice;
	@Resource 
	MessageService messageservice;
	@Resource 
	PictureService pictureservice;
	@Resource 
	CriticalService criticalService;
	
	@RequestMapping("/infopulish")
	public String  queryInfolist(HttpServletRequest request){
		//查询class列表用于前端发布信息时选取 信息类别
	List<Newclass>  newclass = newcalssservice.queryclass();

      request.setAttribute("newclass", newclass);
      
      return "message/newinfo";
	}
	
	/**
	 *上传图片请求 并添加表单信息
	 */
	@RequestMapping(value="/fileupload")
	@ResponseBody
	public Object fileupload(HttpServletRequest request,HttpServletResponse response, 
			@RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam(value = "classlist", required = false) String classlist,
            @RequestParam(value = "title", required = false) String title,
            @RequestParam(value = "content", required = false) String content
           ) throws Exception {
		 System.out.println("SpringMVC方式的文件上传...");
	       Date date = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        System.out.println(sdf.format(date));
	   
	      int classlistid = Integer.parseInt(classlist);
		// 先获取到要上传的文件目录
		String path ="D:\\javatesteclipse\\Company\\WebContent\\uploads";
		 System.out.println("上传的目标地址445："+path); 
		// 创建File对象，一会向该路径下上传文件
		   File file = new File(path);
		// 判断路径是否存在，如果不存在，创建该路径
		if(!file.exists()) {
			file.mkdirs();
		}
		// 获取到上传文件的名称
		String filename = image.getOriginalFilename();
		System.out.println("获取成功filename"+filename);
		String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
		// 把文件的名称唯一化
		filename =uuid+"_"+filename;
		// 上传文件
		image.transferTo(new File(file,filename));	
	    
         //获取其他信息发布		 
	      //开始存入数据库
	      Picture pic = new Picture();
			pic.setPicurl(filename);
			
			int result = pictureservice.addpicurl(pic);
			int picid = pic.getId();
			//对图片前端的地址执行插入数据库
			System.out.println("返回刚刚插入图片地址的数据的id为：===="+picid);
	      
	     int  publish =  messageservice.add(title,classlistid,content,sdf.format(date),picid);
	     
	       JsonDWZ jsonDWZ=new JsonDWZ("200","发布成功","","","","","");
			return jsonDWZ;
		}
/**
 *信息列表页面
 * @param request
 * @return
 */
	@RequestMapping("/InfoList")
	public String InfoList(HttpServletRequest request){
		//查询所有的信息用于前端管理员进行管理（此查询联合了3张表的信息，user、picture、class）
		 List<InfoList> allmessage =  messageservice.queryInfolist();
		 request.setAttribute("allmessage", allmessage);
		 for(InfoList message: allmessage){
		 System.out.println(message+"message:");
		 }
		//自动查询所有的信息分类
			List<Newclass>  newclass = newcalssservice.queryclass();
			//保存分类对象
			request.setAttribute("newclass", newclass);
		 return "message/infolist"; 
		}

	/**
	 * 对所有的信息页面进行修改显示操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/Updatecontent")
	@ResponseBody
	public Object Updatecontent(HttpServletRequest request){
		//自动查询所有的信息分类
		List<Newclass>  newclass = newcalssservice.queryclass();
		//保存分类对象
		request.getSession().setAttribute("newclass", newclass);
		System.out.println("分类集合为："+newclass.toString());
		//获取用户要修改的信息id
		int  contnetId = Integer.parseInt(request.getParameter("contentid").trim()); 
		System.out.println("获取用户要修改的信息id:"+contnetId);
		//查询所有的信息用于前端管理员进行管理（此查询联合了3张表的信息，user、picture、class）
		//System.out.println("根据修改的id来查询该条信息的所有信息");
		InfoList allmessage1 =  messageservice.queryInfolist1(contnetId);
	     System.out.println(allmessage1);
	       String  json = new Gson().toJson(allmessage1); 
	       String  classid = new Gson().toJson(newclass); 
	       System.out.println(json);
	       System.out.println(classid);
	   JsonDWZ jsonDWZ=new JsonDWZ("200",json,classid,"","","","");
		return jsonDWZ;
	}
	/**
	 * 删除数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletecontent")
	@ResponseBody
	public Object deleteContent(HttpServletRequest request){
		int  ContentId = Integer.parseInt(request.getParameter("contentId"));
           System.out.println(ContentId+"  ======");
		//删除该条数据
		int del = messageservice.deleteByContentId(ContentId);
		
		
		 JsonDWZ jsonDWZ=new JsonDWZ("200","删除成功","","","","","");
			return jsonDWZ;	
	}
	
	/**
	 *上传图片请求 并添加表单信息
	 */
	@RequestMapping(value="/updateSave")
	@ResponseBody
	public Object updateSave(HttpServletRequest request,HttpServletResponse response, 
			@RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam(value = "classlist", required = false) String classlist,
            @RequestParam(value = "title", required = false) String title,
            @RequestParam(value = "content", required = false) String content,
            @RequestParam(value = "name", required = false) String name
            ) throws Exception {
		 System.out.println("SpringMVC方式的文件上传...");

		
	       Date date = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        System.out.println(sdf.format(date));

	      int classlistid = Integer.parseInt(classlist);
	      
	    int  id = Integer.parseInt(name);
		// 先获取到要上传的文件目录
	    String path ="D:\\javatesteclipse\\Company\\WebContent\\uploads";	
		 System.out.println("上传的目标地址："+path); 
		// 创建File对象，一会向该路径下上传文件
		File file = new File(path);
		// 判断路径是否存在，如果不存在，创建该路径
		if(!file.exists()) { 
			file.mkdirs();
		}
         
		// 获取到上传文件的名称
		String filename = image.getOriginalFilename();
		
		System.out.println("获取成功filename"+filename);		
		String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
		// 把文件的名称唯一化
		filename = uuid+"_"+filename;
		// 上传文件
		image.transferTo(new File(file,filename)); 
	      //开始存入数据库
	      Picture pic = new Picture();
			pic.setPicurl(filename);			
			int result = pictureservice.addpicurl(pic);
			int picid = pic.getId();
			//对图片前端的地址执行插入数据库
			System.out.println("返回刚刚插入图片地址的数据的id为：===="+picid);	      
	     int  publish =  messageservice.update(title,classlistid,content,sdf.format(date),picid,id);
	       JsonDWZ jsonDWZ=new JsonDWZ("200","发布成功","","","","","");
			return jsonDWZ;
		}
	/**
	 * 查询文章详情页评论
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/contentsone")
	public ModelAndView listOne(int id){
		ModelAndView modelview = new ModelAndView("contentsone");
		//通过contentid查询出对应文本的信息
		InfoList allmessage1 =  messageservice.queryInfolist1(id);	
			System.out.println("hahaha");			
			//通过文章id查询他的所有评论
			List<Critical> criticals1 = criticalService.findCriticalByid(id);
			 Multimap<String,Critical> criticals = ArrayListMultimap.create();//0.1层级的
			for(Critical cc:criticals1){
				criticals.put(cc.getResId(), cc);
					
		}
			System.out.println(criticals);
			   modelview.addObject("criticals",criticals);
	           modelview.addObject("allmessage1",allmessage1);
	 
	  
		return modelview;
			
	}
	
	}

	

