<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<% String path=request.getContextPath();%>
<!DOCTYPE html>
<script  type="text/javascript">
function check()
{
	//alert(123)
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
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
  xmlhttp.onreadystatechange=function()
  {
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
      //xmlDoc=xmlhttp.responseText;
      var result = JSON.parse(xmlhttp.responseText);
      if(result.message=="注册成功"){
    	  alert("恭喜你！"+result.message+"\n"+"即将跳转！");
    	
    	 window.location.href="login";
      }else{
    	  alert(result.message+"请重新输入！");
      }
      
     
             
      
    }
  }
  xmlhttp.open("GET","doregister?name=" + name + "&password=" + password,true);
  xmlhttp.send();
}
</script>
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
	 margin-top: 25px
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

	</head>

	<body >
	<canvas id="background"></canvas>
	
<script async type="text/javascript" src="<%=request.getContextPath()%>/css/bootstrap4/js/background.js"></script>

	<div class="container">
		<div class="login_input">		
			   <h1 style="height:90px;line-height:90px;text-align:center;color: white;">欢迎注册企业信息发布系统</h1> 
		
		
			  <form submit="check()">
			  
				<div>
				<span style=" color:white;font-size: 20px;font-weight: bold" >用户名：</span> 
				<input type="text" id="name" name ="name" class="input1">
				<p id="tips" style="color:#ffffff"></p>
				</div>
				<br/>
				<div>
					<label style=" color:white; font-size: 20px;font-weight: bold" >密&nbsp;&nbsp;&nbsp;码：</label> 
					<input type="password" id="password" name ="password" class="input2">
				</div>
				
				<br>

				<input type="button" onclick="check()" class="btn btn-primary"  value="注册">
				<a id="" href="#"></a>
			   </form>
		
				
		
		
		</div>
	</div>
		
	</body>
</html>