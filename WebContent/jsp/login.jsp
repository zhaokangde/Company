<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
 
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>欢迎登录企业信息发布系统</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap4/css/bootstrap.css" rel="stylesheet">
		
<style>
	body, html {
		margin: 0;
		padding: 0;
	}
	#background {
		position: fixed;
		top: 0;
		left: 0;

		z-index: -100;
	}
	.container{
		width:100%;
		height:900px;
		display:flex;
		flex-drection:row;
		justify-content:center;
		align-items:center;
	}
	.login_input{
	border:solid 2px white;
	width: 500px;
	height: 300px;
	}
	.input_form {
	 text-align: center;
	 margin-top: 50px
	}
.input1{
		height: 30px;
		width: 100pxpx;
		border-radius:7px;
		 border: 1px solid;
		}
.input2{
		height: 30px;
		width: 100pxpx;
		border-radius:7px;
		 border: 1px solid;
		}
.tijiao{
		magin
}
.zucu {

}
	
</style>
<script type="text/javascript">
var xmlhttp;

if (window.XMLHttpRequest)
{
  // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
  xmlhttp=new XMLHttpRequest();
}
else
{
  // IE6, IE5 浏览器执行代码
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
function dologin(){
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
	
	if(name==""||name==null||password==""||password==null){
		alert("用户名或密码不能为空！");
	}else{
  		xmlhttp.onreadystatechange=function(){
    		if (xmlhttp.readyState==4 && xmlhttp.status==200){
      			//xmlDoc=xmlhttp.responseText;
      			var result = JSON.parse(xmlhttp.responseText);
      			if(result.message=="admin"){
      				
      				 window.location.href="jsp/index.jsp";
      				
      			}else{
      				alert("用户名或密码错误");
      				
      			}
     
    		}
  		}
  		
 	 	xmlhttp.open("GET","/Company/dologin?name=" + name + "&password=" + password,true);
  		xmlhttp.send();
	}
}
</script>
	</head>

	<body >
	<canvas id="background"></canvas>

<script async type="text/javascript" src="<%=request.getContextPath()%>/css/bootstrap4/js/background.js"></script>
	<div class="container">
		<div class="login_input">		
			   <h1 style="margin-left: 90px;margin-top:20px; color: white;">企业信息发布系统</h1> 
			<form action="dologin()" >
		
			  <div class="input_form">
				<div>
				<span style=" color:white;font-size: 20px;font-weight: bold" >用户名：</span> 
				<input type="text" id="name" name ="name" class="input1">
				</div>
				<br/>
				<div>
					<label style=" color:white; font-size: 20px;font-weight: bold" >密&nbsp;&nbsp;&nbsp;&nbsp;码：</label> 
					<input type="password" id="password" name ="password" class="input2">
				</div>
				<br>
			
				<input type="button" onclick="dologin()"  class="btn btn-primary"  value="登录">
				<a href="<%=request.getContextPath()%>/register" class="btn btn-primary" >注册</a>
					</div>
			
				
			</form>
		
		</div>
	</div>
		
	</body>
</html>