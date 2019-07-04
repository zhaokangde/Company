<%@page import="com.qq.model.Critical"%>
<%@page import="com.qq.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    <%@page import= "java.util.List" %>
<%@page import= "java.util.Date" %>
<%@page import= "com.qq.model.InfoList" %>
<%@page import= "com.google.common.collect.Multimap" %>

<%
String path = request.getContextPath();

User user = null;
if(session.getAttribute("user")!=null ){
	user = (User)session.getAttribute("user");	
}
%>
<html>
<head>
	<title>Free CSS templateCollect from cssMoban.com</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="<%=path %>/css/images/favicon.ico" />
	<link rel="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<%=path %>/css/ie6.css" type="text/css" media="all" />
	<script src="<%=path %>/js/jquery-1.4.2.js" type="text/javascript"></script>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap4/css/bootstrap.min.css">  
<style type="text/css">
		.content{	
		    width: 100%;  
		    position: absolute; 
		    margin-top: 110px;		
		        /* 高度的一半 */
		}
</style>
<script type="text/javascript">
//进入页面就检查用户是否登陆
/* $(function(){
	//debugger;
	var nm = $("#nm").val();
	if(nm==null || nm==""){
		$("#loginsatrt").show();
		$("#loginsusscce").hide();
		$("#out").hide();
	}else{		
		$("#loginsusscce").show();
		$("#out").show();
		$("#loginsatrt").hide();
	}	
}); */
	//留言
	function liuyan(){
		
		var  textArea = $('#critict'),
	      textArea   = textArea.val();
		var contentId ="${param.id}";
		console.log($.trim($("#loginsusscce").text()))
		var username = $.trim($("#loginsusscce").text());
		
		alert("你好！"+username+"期待你的留言哦");
		if(username == "" ||username == null){
			alert("请先登陆");
			add();	
	
		}else{
			 $.ajax({
  		         //几个参数需要注意一下
  		             type: "POST",//方法类型
  		             url: "<%=path%>/critical/addliuyan?textArea="+textArea+"&contentId="+contentId,
  		             dataType:'json',
  		             success: function (result) {
  		               alert(result.message);//打印服务端返回的数据(调试用)		
  		             window.location.reload();
  		             },
  		             error : function() {
  		                 alert("异常！");
  		             }
  		         });
		}
	
    		  
    	}
</script>
<script type="text/javascript">
	
	//登陆弹框跳出
	function add(){
		document.getElementById("loginfrom").style.display='block';
	}

	//关闭登陆弹框
	function close1(){
		document.getElementById("loginfrom").style.display='none';
	}

	
	function login(){
	
		 var username = $.trim($("#name").val());
		 var password = $.trim($("#password").val());
		    
		          if(username == ""){
		              alert("请输入用户名");
		              return false;
		          }else if(password == ""){
		              alert("请输入密码");
		             return false;
		         }
		   $.ajax({
         //几个参数需要注意一下
             type: "POST",//方法类型
             url: "<%=path%>/doyhlogin?username="+username+"&password="+password,//url
             dataType:'json',
             success: function (result) {
                 console.log(result);//打印服务端返回的数据(调试用)
                 if (result.statusCode == 200) {
                	  console.log(result);//打印服务端返回的数据(调试用)
                     alert("登陆成功!你可以随时留言哦！");
                	  
                  	document.getElementById("loginfrom").style.visibility='hidden';
                 	/* $("#loginsatrt").hide();
                 	$("#nm").html(username);
            		$("#loginsusscce").show();
            		$("#out").show();  */
                    window.location.reload();
                 }
                 ;
             },
             error : function() {
                 alert("异常！");
             }
         });
     }
	</script>
</head>
<body>
<!-- Header -->
<div>
<div class="header">
	<div class="shell">
		<h1 id="logo" class="notext"><a href="#">Plain Plan - Keep youy website simple</a></h1>
		<div id="navigation">
			<ul>
			     <li><a href="<%=path%>/userindex" >主页</a></li>
			    <li><a href="<%=path %>/aboutUs">关于我们</a></li>
			    <li><a href="#">企页信息</a>
			    </li>
			       <li><a href="<%=path%>/companyjg">企业架构</a></li>
			    <li><a href="<%=path%>/rencai">人才招聘</a></li>
			    <%  if(!(user==null)){ %>
			      <li  id="out"><a href="<%=path %>/dologinOut">退出</a></li>
			     <li><div id="loginsusscce" style="height: 40px;border-radius:40px">
			    <img alt="用户头像" style="width: 40px;height: 40px;border-radius:50px; "src="<%=path %>/img/userlogo.png">
			    <p style="float:right;margin-left: 10px;margin-top:5px " id="nm"><%=user == null ? "":user.getUsername()%></p>
			  </div></li> 
			 <!--   <%=user == null ? "":user.getUsername()%>-->   
			<% }else{
			 %> 
			    <li id="loginsatrt"><a href="#" onclick="add()">登陆</a></li>
			<%} %>
			</ul>
		</div>
	</div>
</div>
<!-- End Header -->
 <!--添加用户界面弹框框  -->
<div id="loginfrom" style="display:none; position: fixed; border:solid 1px #2F4F4F;background-color: #F0FFFF; top: 50%; left: 50%; margin: -135px 0px 0px -150px; z-index: 100000; width: 500px; height: 350px;">
<div style="padding:10px "><h3>登陆</h3></div>
 <form onsubmit="return false" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="name" placeholder="账号">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="password" placeholder="请输入密码">
    </div>
  </div>
      <button onclick="login()" type="submit" class="btn   btn-block">登陆</button>
      <br>
      <div style="margin-left: 350px;"><a href="<%=path %>/jsp/findmypwd.jsp">忘记密码？</a></div>
        
</form>
<a id="HCloseBtn" title="关闭"  style="background-color: #DC143C;width:24px;height:24px;line-height:18px;display:inline-block;cursor:pointer;color:#fff;font-size:1.4em;text-align:center;position:absolute;top:8px;right:8px;"><span onclick="close1()" style="width:24px;height:24px;display:inline-block;">×</span></a></div>
</div>  



   <!-- banner图 -->
	<div class="content" >
			<div>
				<img src="<%=path %>/img/info.png">
			</div>
	<div>
	 <!-- 导航链接 -->	

		<div style="padding: 40px;margin-left: 30px">
	  当前位置：> <a href="qiyemessage">${allmessage1.classname}</a>		 
		</div>
		
		
   <!-- 文章标题 -->
			<div style="font-size: 20px;height: 20px;padding: 20px;font-weight: bolder;text-align:center;margin-bottom: 30px">${allmessage1.title}</div>
				   <!-- 文章内容 -->
				<div style="text-indent:2em;margin-left: 200px;margin-right: 200px">
				<br/>
				${allmessage1.contents}
				</div>
		</div>
		<br/>
		<hr>
		<br/>
		<!-- 评论展示 -->
		<h2 style="margin-left: 40px;">热门评论：</h2>
		<br/>
		<div style="margin-left: 120px">
		  <%
			 Multimap<String,Critical> criticals = null;
              		if(request.getAttribute("criticals") !=null){ 		
              		criticals = ( Multimap<String,Critical>)request.getAttribute("criticals");			
              		  for (Critical v : criticals.values()) {
              		        
              			 if(!v.getCraticType().equals("question")){
    			  
          //评论    		   
		  %>
		  
		  <div style="display:flex;flex-direction:row;max-height: 50px;border-bottom: 1px solid #f2f2f2;margin-left: 70px">
			 <div style="height: 30px;border-radius:50px;border:1px solid;margin-top:3px; ">
				  <img alt="" style="width: 30px;height: 30px; border-radius:50px; " src="<%=path%>/img/user4-128x128.jpg" >
			</div>
			<p style="margin-left: 15px;margin-top: 5px;font-weight: bolder;"><%=v.getUserName()%>:<p>
		  	<p style="float:left;margin-left: 10px;line-height: 50px"><%=v.getCratiContent()%></p>
		   </div> 

		 <%
          }else{
              				 //回复
              				%> 
              				 
              			<div style="display:flex;flex-direction:row;max-height: 50px;border-bottom: 1px solid #f2f2f2;">
              			 <div style="height: 30px;border-radius:50px;border:1px solid;margin-top:3px;">
              					  <img alt="" style="width: 30px;height: 30px;border-radius:50px;" src="<%=path%>/img/user3-128x128.jpg" >
              			</div>
              				<p style="margin-left: 15px;margin-top: 5px;font-weight: bolder;"><%=v.getUserName()%>:<p>
              			  	<p style="float:left;margin-left: 10px;line-height: 50px"><%=v.getCratiContent()%></p>
              			 </div> 	
              			   	 
            <%  				 
              			 }  
              }
       				 
		}else{     
		     %>
		     <p>还没有人留言！快来留言吧。。。。。<p>
		     
		     <%} %>
		</div>
		<!-- 留言板 -->
		<br/>
			<h2 style="margin-left: 40px;">欢迎留言：</h2>
			<br/>
		<div style="margin-left: 80px;">
		<div>
		<textarea  id="critict" style="width: 90%;height: 70px;margin-left: 10px">
		
		</textarea><br>
		<br/>
		<div style="margin-left: 40px">
		<input type="button" onclick="liuyan()" class="btn btn-primary" value="留言">
		</div>
		</div>		
		</div>
	</div>
</body>
</html>