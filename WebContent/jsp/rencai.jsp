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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap4/css/bootstrap.min.css">  
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
		<h1 id="logo" class="notext"><a href="#">Plain Plan - Keep youy website simple</a></h1>
		<div id="navigation">
			<ul>
			    <li><a href="<%=path%>/userindex" >主页</a></li>
			    <li><a href="<%=path%>/aboutUs" >关于我们</a></li>
			     <li><a href="<%=path%>/qiyemessage" >企页信息</a>

			    </li>
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
<!-- Slider -->

   <!-- banner图 -->
	<div class="content" >
			<div>
				<img src="<%=path%>/img/rencai.jpg">
			</div>
		<div>
		<br>	<br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
				人才理念
				</h1>
				<p style="text-indent:2em">
				秉持“尊重人的价值、开发人的潜能、升华人的心灵”人才工作宗旨，把华润打造成一个海纳百川的组织，在这个组织里，普通的人变成优秀的人，优秀的人变成卓越的人，源源不断的人在这里实现自己的人生梦想。


培养和造就一支赢得市场领先、创造组织优势、引领价值导向、有使命感与责任感的人才队伍，支持战略目标的实现，是华润持续不断的人才追求。


华润从生活、情感、成长环节关爱员工。


华润人珍视自己内心的梦想和追求，因为有梦想才更加有活力、更加有创造力、更加有超越其他组织和个人的推动力，实现自我境界的升华。
				</p>
				<p>		
				</p>
			</div>
			<div class="list-group">
				 <a href="#" class="list-group-item active">Home</a>
				<div class="list-group-item">
					will come home!
				</div>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
					企业邮箱：15696049710@qq.com
					</h4>
					<h4 class="list-group-item-heading">
					联系电话：15696049710
					</h4>
				</div>
				<div class="list-group-item">
				
				</div> <a class="list-group-item active"> <span class="badge">14</span> Help</a>
			</div>
		</div>
	</div>
</div>
<!-- End Footer -->
</body>
</html>