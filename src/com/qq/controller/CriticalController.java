package com.qq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qq.jsonmodel.JsonDWZ;
import com.qq.model.Critical;
import com.qq.service.CriticalService;

@Controller
@RequestMapping("/critical")
public class CriticalController {
	@Resource
	private CriticalService criticalService ;
	
	/**
	 * 用户留言
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addliuyan")
	@ResponseBody
	public JsonDWZ addLiuYan(HttpServletRequest request,HttpSession session){
		//用户留言内容
		String cratiContent = request.getParameter("textArea").trim();
		String username = (String)session.getAttribute("username");
		System.out.println(username);
		//信息id
		int contentId = Integer.parseInt(request.getParameter("contentId").trim());
        //构建评论表的各个字段
		//资源id
		 String resId = UUID.randomUUID().toString();
		 //评论时间
		  Date date = new Date();
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String craticTime = sdf.format(date);
		 //评论类型默认为question
		 String craticType =  "question";
	    //(String resId, int craticId, int userName, String contentId, String cratiContent, String craticType,String craticTime)			 
		 Critical critical = new Critical(resId,username,contentId,cratiContent,craticType,craticTime);		
		int i =  criticalService.liuYan(critical);
		
		
		 
		if(i == 1){
			JsonDWZ jsonDWZ=new JsonDWZ("200","评论成功","","","","","");
			return jsonDWZ;
		}else{
			JsonDWZ jsonDWZ=new JsonDWZ("280","评论失败，请联系管理员","","","","","");
			return jsonDWZ;
		}
		
	
	}
	/**
	 * 管理员回复信息
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/mangerreply")
	@ResponseBody
	public JsonDWZ addLiuYan1(HttpServletRequest request,HttpSession session){
		//用户留言内容
		String replyContent = request.getParameter("mangersay").trim();
		String username = (String)session.getAttribute("NAME");
		String uuid = request.getParameter("uuid").trim();
		//信息id
		int contentId = Integer.parseInt(request.getParameter("contentId").trim());
        //构建评论表的各个字段
		//资源id
		 String resId = uuid;
		 //评论时间
		  Date date = new Date();
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String craticTime = sdf.format(date);
		 //评论类型默认为question
		 String craticType =  "reply";		  
		 Critical critical = new Critical(resId,username,contentId,replyContent,craticType,craticTime);
//		//更新已经处理的留言状态
//		
//		 criticalService.updateStatus(uuid);
//		 
		 int i =  criticalService.liuYan(critical);
		if(i == 1){
			JsonDWZ jsonDWZ=new JsonDWZ("200","回复成功","","","","","");
			return jsonDWZ;
		}else{
			JsonDWZ jsonDWZ=new JsonDWZ("280","回复失败，请联系管理员","","","","","");
			return jsonDWZ;
		}
		
	
	}
	/**
	 * 前端页面查看所有评论信息
	 */

	@RequestMapping("/contentone")
	public ModelAndView findContent(){
		String type = "question";
	List<Critical> allCritcal =	criticalService.findAllbytype(type);

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("content/contentone");
		
		modelAndView.addObject("allCritcal",allCritcal);
	      return modelAndView;	
	} 
	
	/**
	 * 删除评论信息
	 */
	@RequestMapping("/deletContent")
	@ResponseBody
	public JsonDWZ deletContent(Integer criticalId){
		
		
	int i = criticalService.delete(criticalId);
		
		
		if(i == 1){
			JsonDWZ jsonDWZ=new JsonDWZ("200","删除成功","","","","","");
			return jsonDWZ;
		}else{
			JsonDWZ jsonDWZ=new JsonDWZ("280","删除失败","","","","","");
			return jsonDWZ;
		}
	}
	
	/**
	 * 评论回复信息
	 */

	@RequestMapping("/reply")
	public ModelAndView findContent1(){
		String type = "reply";
	List<Critical> allreplyCrital =	criticalService.findreplyByType(type);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("content/reply");
		modelAndView.addObject("allreplyCrital",allreplyCrital);
	      return modelAndView;	
	}

}
