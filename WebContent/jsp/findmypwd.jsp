<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findmypwd</title>
	<script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/jquery-migrate-1.2.1.js"></script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
    <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%=path %>/js/bootstrapValidator.min.js"></script>
    <link href="<%=path %>/css/bootstrapValidator.min.css" rel="stylesheet" />
    <script type="text/javascript">
    $(function () {
        $('form').bootstrapValidator({
　　　　　　　　message: 'This value is not valid',
        　feedbackIcons: {
   　　　　　　　　valid: 'glyphicon glyphicon-ok',
   　　　　　　　　invalid: 'glyphicon glyphicon-remove',
   　　　　　　　　validating: 'glyphicon glyphicon-refresh'
　　　　　　　   },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱地址不能为空'
                        }
                    }
                }
            }
        });
    });
    
    </script>
    
</head>
<body>
<div class="jumbotron">
  <h1>忘记密码页面</h1>
  <p style="text-indent:2em;">  
  我们为每一个员工提供贴心的服务，如果不小心忘记了密码你可以通过电子邮件的方式找回
  我们将会您发送你的密码。
</div>

<div style="padding:50px; margin:50px 300px 400px; border: 1px solid #333333;width: 500px;height: 600px;">
	<div class="list-group">
				 <a href="#" class="list-group-item active">Home</a>
				<div class="list-group-item">
					will come home!
				</div>
				<div class="list-group-item">
					<form> 
           <div>找回密码</div>
           <br/>
            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" id="username" name="username" />
            </div>
            <div class="form-group">
                <label>邮箱地址</label>
                <input type="text" class="form-control" id="email" name="email" />
             </div>
            <div class="form-group">
                <button type="submit" onclick="findpwd()" class="btn btn-primary">找回密码</button>
            </div>
        </form>
				</div>
				<div class="list-group-item">
				
				</div> <a class="list-group-item active"> <span class="badge">14</span> Help</a>
			</div>


　
 </div>
 <script type="text/javascript">
 function findpwd() {

  var email  = $('#email').val();
  var username  = $('#username').val();
  alert(email + username  );	
     $.ajax({
     //几个参数需要注意一下
         type: "get",//方法类型
         url: "<%=request.getContextPath()%>/findpwd?email="+email+"&username="+username ,//url
         processData:false,
         success: function (result) {

            console.log(result);//打印服务端返回的数据(调试用)
            //debugger; 
            if (result.statusCode == 200) {
                 alert("稍后您就会收到一封邮件");
             }else{
            	 alert("输入的用户名和邮箱地址不正确");
             }
             ;
         },
         error : function() {
             alert("异常");
         }
     });
 }
 </script>
</body>
</html>