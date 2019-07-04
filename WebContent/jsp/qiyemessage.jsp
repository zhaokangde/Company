<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    <%@page import= "java.util.List" %>
<%@page import= "java.util.Date" %>
<%@page import= "com.qq.model.InfoList" %>
<%
String path = request.getContextPath();
String name = "";
if(session.getAttribute("username")!="" &&session.getAttribute("username")!=null ){
	name = (String)session.getAttribute("username");	
}
List<InfoList> infoList = null;
	if(session.getAttribute("allmessage")!=null){
	infoList = (List<InfoList>)session.getAttribute("allmessage");
}
%>
<html>
<head>
	<title>Free CSS templateCollect from cssMoban.com</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="<%=path %>/css/images/favicon.ico" />
	<link rel="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=path%>/css/bootstrap4/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=path %>/css/ie6.css" type="text/css" media="all" />
	<script src="<%=path %>/js/png-fix.js" type="text/javascript"></script>
	<script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/jquery-migrate-1.2.1.js"></script>
	<script src="<%=path %>/js/jquery.jcarousel.js" type="text/javascript"></script>
	<script src="<%=path %>/js/js-func.js" type="text/javascript"></script>
<style type="text/css">

 p:hover{ 
 color:#D1EEEE;
background-color:#87CEFA;
}
 a:link {font-size:12px;}
</style>


<script type="text/javascript">
//进入页面就检查用户是否登陆
$(function(){

	var username ="<%=name%>";
	if(username != ""){
		$("#loginsatrt").hide();
		$("#loginsusscce").show();
		$("#out").show();
	}else{
		$("#loginsatrt").show();
		$("#loginsusscce").hide();
		$("#out").hide();
	}
});
	
	
	

	
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
                     alert("登陆成功!你可以随时留言哦！");
                  	document.getElementById("loginfrom").style.visibility='hidden';
                 	$("#loginsatrt").hide();
                 	$("#nm").html(username);
            		$("#loginsusscce").show();
            		$("#out").show();       	
                   //执行操作成功后刷新页面
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
<div id="header">
	<div class="shell">
		<h1 id="logo" class="notext"><a href="#">梦想指引方向</a></h1>
		<div id="navigation">
			<ul>
			    <li><a href="<%=path%>/userindex" >主页</a></li>
			    <li><a href="<%=path%>/aboutUs" >关于我们</a></li>
			    <li><a href="<%=path%>/qiyemessage" >企页信息</a> </li>
			    <li><a href="<%=path%>/companyjg">企业架构</a></li>
			    <li><a href="<%=path%>/rencai">人才招聘</a></li>
			    <li id="loginsatrt"><a href="#" onclick="add()">登陆</a></li>
			    <li style="" id="out"><a href="<%=path %>/dologinOut">退出</a></li>
			    <li><div id="loginsusscce" style="height: 40px;border-radius:40px">
			    <img alt="用户头像" style="width: 40px;height: 40px;border-radius:50px; "src="<%=path %>/img/userlogo.png">
			    <p style="float:right;margin-left: 10px;margin-top:5px " id="nm"><%=name%></p>
			  </div></li>
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

<!-- Slider -->
<br><br>
<div id="slider">
	<div class="shell">
		<div class="slider-left" id="loginfrom">
			<h2>公司简介</h2>
				<p style="text-indent:2em">网龙网络控股有限公司（香港交易所股份代号：777）成立于一九九九年，总部位于中国福建福州。此外，网龙还被纳入恒生综合大中型股指数，深港通和沪港通成份股。网龙现有员工逾7,000人，两次荣获《财富》杂志评选的“卓越雇主——中国最适宜工作的公司</p>
		</div>
		<div class="slider-right" style = "margin-left: 20px;">
			<div class="slider-content">
				<ul>
				    <li><img src="<%=path %>/img/aboutus.jpg" alt="" /></li>
				    <li><img src="<%=path %>/img/aboutus1.png"  alt="" /></li>
				    <li><img src="<%=path %>/img/aboutus2.png"  alt="" /></li>				   
				</ul>
			</div>
			<div class="slider-nav">
				<ul>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#" class="active">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Slider -->
<!-- Main -->
<div id="main">
	<div class="shell">
		<div id="sidebar">
				<div class="post">
				<h2>学习提高</h2>
				<%	
				String classname = "";
				int count = 0;
					for(int i = 0; i < infoList.size(); i++){
					
						if(infoList.get(i).getClassname().equals("学习提高")){
							count++;
							if(count <= 5){
							classname = infoList.get(i).getClassname();
						%>
			
					<p>
					
						<a style="text-decoration:none;" href="<%=request.getContextPath()%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
						   <img width="30px" height="30px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
						   <%=infoList.get(i).getTitle()%>
						 
						  	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
						</a>
						
					</p>
		
							<%
						}
						
					}
						
				}
				
				%>
				<p></p>
				<a href="<%=path%>/moreInfo?classname=<%=classname%>" class="more">more</a>
				<br>
				<img src="<%=path %>/css/images/post-image1.gif" alt="" />
			
			</div>
			<div class="post">
				<h2>企业生活</h2>
				<%
		         int count1 = 0;
				for(int i = 0; i < infoList.size(); i++){
				
					if(infoList.get(i).getClassname().equals("企业生活")){
						count1++;
						if(count1 <= 5){
						classname = infoList.get(i).getClassname();
					%>
		
		
						<div style=""><p>
						<a style="text-decoration:none" href="<%=path%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
						  <img width="30px" height="30px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
						<%=infoList.get(i).getTitle()%>
						  	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
						</a>
						</p>
						</div>
							<%
							}
						}
					}
				
				%>
			
				<img src="<%=path %>/css/images/post-image1.gif" alt="" />
					<p></p>
				<a href="<%=path%>/moreInfo?classname=<%=classname%>" class="more">more</a>
			
			</div>
		</div>
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >Website Template</a></div>
		<div id="content">
			<div class="col">
				<div class="post">
				<!-- 文章标题 -->
					<h2>新闻动态</h2>
				<%
					
				   int count2 = 0;
				for(int i = 0; i < infoList.size(); i++){
				
					if(infoList.get(i).getClassname().equals("新闻动态")){
						count2++;
						if(count2 <= 5){
						classname = infoList.get(i).getClassname();
					%>
		
							<div style="">
							<p>
							<a style="text-decoration:none;" href="<%=request.getContextPath()%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
							  <img width="30px" height="30px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
							<%=infoList.get(i).getTitle()%>
							  	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
							</a>
							</p>
							</div>
							<%
							}
						}
					}
				
				%>
				
					<img src="<%=path %>/css/images/post-image2.gif" alt="" class="right" />
				<p></p>
				<a href="<%=path%>/moreInfo?classname=<%=classname%>" class="more">more</a>
				<br>
				</div>
			</div>
			<div class="col cols-2">
				<div class="post">
					<h2>企业公告</h2>
						<%
					
						int count3 = 0;
						for(int i = 0; i < infoList.size(); i++){
						
							if(infoList.get(i).getClassname().equals("企业公告")){
								count3++;
								if(count3 <= 5){
								classname = infoList.get(i).getClassname();
							%>
				
					
					<div style="">
						<p>
							<a style="text-decoration:none;" href="<%=request.getContextPath()%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
							   <img width="30px" height="30px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
							   <%=infoList.get(i).getTitle()%>
							     	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
							</a>
						</p>
					</div>
							<%
								}
						}
					}
				
				%>
			
				
					<img src="<%=path %>/css/images/post-image3.gif" alt="" class="right" />

				<a href="<%=path%>/moreInfo?classname=<%=classname%>" class="more">more</a>
				<br>
				</div>
			</div>
			<div class="col cols-2 last">
				<div class="post">
					<h2>员工动态</h2>
						<%
					
				int count4 = 0;
						for(int i = 0; i < infoList.size(); i++){
						
							if(infoList.get(i).getClassname().equals("员工动态")){
								count4++;
								if(count4 <= 5){
								classname = infoList.get(i).getClassname();
							%>
				
					
							<div style="">
								<p>
									<a style="text-decoration:none;" href="<%=request.getContextPath()%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
										  <img width="30px" height="30px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
										<%=infoList.get(i).getTitle()%>
										  	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
										</a>
									</p>
								</div>
							<%
								}
						}
					}				
				%>
				<p></p>
				<a href="<%=path%>/moreInfo?classname=<%=classname%>" class="more">more</a>
				<br>
					<img src="<%=path %>/css/images/post-image4.gif" alt="" class="right" />
					<div class="cl">&nbsp;</div>
				</div>
			</div>
		</div>
		<div class="cl">&nbsp;</div>
	</div>
</div>
<!-- End Main -->
<!-- Footer -->
<div id="footer">
	<div class="shell">
		<p class="left">
			<a href="#">Home</a>
			<span>|</span>
			<a href="#">About</a>
			<span>|</span>
			<a href="#">Services</a>
			<span>|</span>
			<a href="#">Projects</a>
			<span>|</span>
			<a href="#">Blog</a>
			<span>|</span>
			<a href="#">Contact</a>
		</p>
		<p class="right">
			Copyright &copy; PlainPlan 2010 | Valid CSS &amp; HTML | Collect from <a href="<%=path %>/login" >企业信息发布系统</a> - More Templates <a href="<%=path %>/login">管理员登录</a>
		</p>
	</div>
</div>
<!-- End Footer -->
</body>
</html>