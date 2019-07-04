<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.List" %>
<%@page import= "com.qq.model.User" %>
<%
List<User> user = ( List<User>)request.getAttribute("USER");
String name = "";
if(session.getAttribute("NAME")!=null){
	 name=(String)session.getAttribute("NAME");
}
%>

<script type="text/javascript">
//ajax开始
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


//跳出添加用户弹框添加用户开始
function add(){
	document.getElementById("HBox").style.display='block';
}

//关闭添加用户弹框
function close1(){
	document.getElementById("HBox").style.display='none';
	
}

//添加用户验证是否重名
function check(){
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
	var power = document.getElementById("power").value;
	var email = document.getElementById("email").value;
	var acl = document.getElementById("acl").value;
	alert(email+acl);
	if(name==""||name==null||password==""||password==null){
		alert("用户名或密码不能为空！");
	}else{
  		xmlhttp.onreadystatechange=function(){
    		if (xmlhttp.readyState==4 && xmlhttp.status==200){
      			//xmlDoc=xmlhttp.responseText;
      			var result = JSON.parse(xmlhttp.responseText);
      			if(result.message=="注册成功"){
    	  			alert("恭喜你！"+result.message+"\n");
    	  			document.getElementById("HBox").style.display='none';
    	  			//执行操作成功后刷新页面
    	  			$.get('<%=request.getContextPath()%>/userlist', function (data) {
          	            $(".content").html(data);
          	        });
      			}else{
    	  			alert(result.message+"请重新输入！");
      			}
    		}
  		}
  		//alert(power)
 	 	xmlhttp.open("GET","/Company/add?name=" + name + "&password=" + password + "&power="+power+"&email="+email+"&acl="+acl ,true);
  		xmlhttp.send();
	}
}

//删除操作
function del(userId,username,name){
	
	confirm('确实要删除吗?');
	xmlhttp.onreadystatechange=function(){
    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
      		//xmlDoc=xmlhttp.responseText;
      		var result = JSON.parse(xmlhttp.responseText);
      		
      		alert(result.message);
      		if(result.statusCode == 200){
      			//执行操作成功后刷新页面
      			$.get('<%=request.getContextPath()%>/userlist', function (data) {
      	            $(".content").html(data);
      	        });
      		}
   		}
	}
	
//ajax要執行這兩句
	xmlhttp.open("GET","/Company/delete?userid=" + userId , true);
	xmlhttp.send();
}
//修改用户弹框跳出并传递需要修改的用户信息
	function Update(userid){
	//ajax传递参数到后台查询
		//document.getElementById("Update").style.visibility='visible';
		document.getElementById("Update").style.display='block';
		xmlhttp.onreadystatechange=function(){
    		if (xmlhttp.readyState==4 && xmlhttp.status==200){
      			//xmlDoc=xmlhttp.responseText;
      			var result = JSON.parse(xmlhttp.responseText);
      		    var user = JSON.parse(result.message);
      		    document.getElementById("userid").value =user.userid;
      		    document.getElementById("username").value =user.username;
      		    document.getElementById("updatepwd").value =user.password;
      		    document.getElementById("updatepower").value =user.power;
      		    document.getElementById("updateemail").value = user.email;
    		    document.getElementById("updateacl").value = user.acl;
    		}
  		}
 	 	xmlhttp.open("GET","/Company/Update?userid=" + userid,true);
  		xmlhttp.send();	
	}
//关闭修改用户弹框
	function close2(){
		document.getElementById("Update").style.display='none';
	}
//修改操作验证用户名重复并返回结果

  function UpdateCheck(){
	
		var name = document.getElementById("username").value;
		var password = document.getElementById("updatepwd").value;
		var power = document.getElementById("updatepower").value;
		var id = document.getElementById("userid").value;
		var email = document.getElementById("updateemail").value;
		var acl = document.getElementById("updateacl").value;
		
		if(name==""||name==null||password==""||password==null || email == "" || acl ==""){
			alert("用户信息不能为空！");
		}else{
	  		xmlhttp.onreadystatechange=function(){
	    		if (xmlhttp.readyState==4 && xmlhttp.status==200){
	      			//xmlDoc=xmlhttp.responseText;
	      			var result = JSON.parse(xmlhttp.responseText);
	      		    alert(result.message);
	      			document.getElementById("Update").style.visibility='hidden';
	      		//执行操作成功后刷新页面
	      			$.get('<%=request.getContextPath()%>/userlist', function (data) {
	      	            $(".content").html(data);
	      	        });
	    		}
	  		}	 
	 	 	xmlhttp.open("GET","/Company/Update1?name=" + name + "&password=" + password + "&power="+power +"&id="+id+"&email="+email+"&acl="+acl  ,true);
	  		xmlhttp.send();
		}
	}
</script>
<!-- 记录分页操作 -->
<script type="text/javascript" >
              var pageSize = 4;    //每页显示的记录条数
              var curPage=0;        //当前页
            	var lastPage;        //最后页
              var direct=0;        //方向
              var len;            //总行数
              var page;            //总页数
               var begin;
              var end;
             
             $(document).ready(function display(){
                 len =$("#mytable tr").length - 1;    // 求这个表的总行数，剔除第一行介绍
                 page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                  // alert("page==="+page);
                  curPage=1;    // 设置当前为第一页
                  displayPage(1);//显示第一页
                  
                  document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";    // 显示当前多少页
                  document.getElementById("sjzl").innerHTML="数据总量 " + len + "";        // 显示数据量
                  document.getElementById("pageSize").value = pageSize;     
                  $("#btn1").click(function firstPage(){    // 首页
                     curPage=1;
                     direct = 0;
                     displayPage();
                  });
                 $("#btn2").click(function frontPage(){    // 上一页
                     direct=-1;
                      displayPage();
                  });
                  $("#btn3").click(function nextPage(){    // 下一页
                      direct=1;
                     displayPage();
                 });
                 $("#btn4").click(function lastPage(){    // 尾页
                     curPage=page;
                      direct = 0;                  displayPage();
                 });
                  $("#btn5").click(function changePage(){    // 转页
                     curPage=document.getElementById("changePage").value * 1;
                  
                     if (!/^[1-9]\d*$/.test(curPage)) {
                          alert("请输入正整数");
                          return ;
                      }
                    if (curPage > page) {
                         alert("超出数据页面");
                          return ;
                      }
                      direct = 0;
                      displayPage();
                  });
                  
                  
                  $("#pageSizeSet").click(function setPageSize(){    // 设置每页显示多少条记录
                      pageSize = document.getElementById("pageSize").value;    //每页显示的记录条数
                      if (!/^[1-9]\d*$/.test(pageSize)) {
                          alert("请输入正整数");
                          return ;
                      }
                      len =$("#mytable tr").length - 1;
                     page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                      curPage=1;        //当前页
                       direct=0;        //方向
                       firstPage();
                  });
              });
   
             function displayPage(){
                  if(curPage <=1 && direct==-1){//
                     direct=0;
                      alert("已经是第一页了");
                      return;
                 } else if (curPage >= page && direct==1) {
                     direct=0;
                     alert("已经是最后一页了");
                     return ;
                 }
                 
                 lastPage = curPage;
                //修复当len=1时，curPage计算得0的bug
                 if (len > pageSize) {
                     curPage = ((curPage + direct + len) % len);
                 } else {
                     curPage = 1;
                 }
           
                 
                 document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";        // 显示当前多少页
                 
                  begin=(curPage-1)*pageSize + 1;// 起始记录号
                 end = begin + 1*pageSize - 1;    // 末尾记录号
             
                 
                if(end > len ) end=len;
                 $("#mytable tr").hide();    // 首先，设置这行为隐藏
                 $("#mytable tr").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
                     if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                         $(this).show();
                });

             }
             </script>
 
 
 
 <!--添加用户界面弹框框  -->
<div id="HBox" style="display:none; position: fixed; border:solid 1px 	#2F4F4F;background-color: #F0FFFF; top: 50%; left: 50%; margin: -135px 0px 0px -150px; z-index: 100000; width: 600px; height: 500px;">
<div style="padding:10px "><h2 >添加用户</h2></div>

 <form onsubmit="return false" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="name" placeholder="请输入名字">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="password" placeholder="请输入密码">
    </div>
  </div>
   <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">邮&nbsp;&nbsp;&nbsp;箱：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
    </div>
  </div>
    <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">角&nbsp;&nbsp;&nbsp;色：</label>
    <div class="col-sm-9">    
      <select  class="form-control"  id="power">
      <option>admin</option>
      <option>user</option>
      </select>     
    </div>
  </div>
      <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">权&nbsp;&nbsp;&nbsp;限：</label>
    <div class="col-sm-9">
    
      <select  class="form-control"  id="acl">
         <option>所有权限</option>
         <option>留言</option>
      </select>
      
    </div>
  </div>
<br/>
      <button onclick="check()" type="submit" class="btn btn-lg btn-default btn-block">提交</button>
   
 
</form>
<a id="HCloseBtn" title="关闭"  style="background-color: #DC143C;width:24px;height:24px;line-height:18px;display:inline-block;cursor:pointer;color:#fff;font-size:1.4em;text-align:center;position:absolute;top:8px;right:8px;"><span onclick="close1()" style="width:24px;height:24px;display:inline-block;">×</span></a></div>
</div>  
  
  <!--修改用户界面弹框  -->    
 <div id="Update" style=" position:absolute;display:none;left:50%;top:35%;border:solid 1px #2F4F4F;background-color: #F0FFFF; z-index: 100000; width: 600px; height: 500px;">
<div style="padding:10px "><h2 >修改用户</h2></div>

 <form onsubmit="return false" class="form-horizontal" role="form">
 
   <div class="form-group">
    <label for="firstname"  class="col-sm-2 control-label">用户ID：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="userid" disabled="disabled" >
    </div>
    </div>
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="username" >
    </div>
    
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="updatepwd" placeholder="请新的输入密码">
    </div>
  </div>
     <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">邮&nbsp;&nbsp;&nbsp;箱：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="updateemail">
    </div>
  </div>
    <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">权&nbsp;&nbsp;&nbsp;限：</label>
    <div class="col-sm-9">
    
      <select  class="form-control"  id="updateacl">
      <option>所有权限</option>
      <option>留言</option>
      </select>
      
    </div>
  </div>
      <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">角&nbsp;&nbsp;&nbsp;色：</label>
    <div class="col-sm-9">
    
      <select  class="form-control"  id="updatepower">
      <option>admin</option>
      <option>user</option>
      </select>
      
    </div>
  </div>
<br/>
      <button onclick="UpdateCheck()" type="submit" class="btn btn-lg btn-default btn-block">提交</button>
   
 
</form>
<a id="HCloseBtn" title="关闭"  style="background-color: #DC143C;width:24px;height:24px;line-height:18px;display:inline-block;cursor:pointer;color:#fff;font-size:1.4em;text-align:center;position:absolute;top:8px;right:8px;"><span onclick="close2()" style="width:24px;height:24px;display:inline-block;">×</span></a></div>
</div>       
<div class="row">
    <div class="col-md-12">
        <ol class="breadcrumb">
            <li><a href="index.jsp">主页</a></li>
            <li><a href="index.jsp">系统管理</a></li>
            <li class="active">用户管理</li>
        </ol>
     </div>
        <table id="mytable" class="table" width="100%" layoutH="138">
					<thead>
						<tr >
							<th>用户ID</th>
							<th>用户名</th>
							<th>用户密码</th>
							<th>用户邮箱</th>
							<th>用户角色</th>
							<th>用户权限</th>
							<th > 用户操作</th>
						</tr>
					</thead>
				
					<tbody id="userList">
  <%
        
	  		
 				for(User h:user){
 			      String power = h.getPower();
        %>   
	           
	    
	            
	           
						<tr id="userId<%=h.getUserid()%>">
						    <td> <%=h.getUserid()%></td>
							<td><%=h.getUsername()%></td>
							<td><%=h.getPassword()%></td>
							<td ><%=h.getEmail()%></td>
							<td ><%=power%></td>
							
							<td ><%=h.getAcl()%></td>
							<input type="hidden" name="test" id="test" value="<%=h.getUserid()%>"/>
							<td ><a href="#" onclick=" Update(<%=h.getUserid()%>)" >修改</a>&nbsp;&nbsp;&nbsp;<a id="de" href="#"  onclick="del(<%=h.getUserid()%>,'<%=h.getUsername()%>','<%=name %>')" >删除</a></td>
						   
					      </tr>			
						
		<%} %>
		</tbody>
		
		</table>
    <button  class="btn btn-lg btn-default btn-block" onclick="add()">新增用户</button></br>
    
               <a id="btn0"></a>
  
                <input id="pageSize" type="text" size="1" maxlength="2" value="getDefaultValue()"/><a> 条 </a> <a href="#" id="pageSizeSet">设置</a>&nbsp;
                <a id="sjzl"></a>&nbsp;
                <a  href="#" id="btn1">首页</a>
                <a  href="#" id="btn2">上一页</a>
                <a  href="#" id="btn3">下一页</a>
                <a  href="#" id="btn4">尾页</a>&nbsp;
                <a>转到&nbsp;</a>
                <input id="changePage" type="text" size="1" maxlength="4"/>
                <a>页&nbsp;</a>
                <a  href="#" id="btn5">跳转</a>
        
    
</div>

