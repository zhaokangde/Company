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
	if(session.getAttribute("onemessage")!=null){
	infoList = (List<InfoList>)session.getAttribute("onemessage");
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
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js" type="text/javascript" charset="utf-8"></script>
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
//检查用户是否登录
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
<!-- 记录分页操作 -->


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
  <!-- banner图 -->
	<div class="content" >
			<div>
				<img src="<%=path %>/img/info.png">
			</div>
		<div>

<!-- Slider -->
<br><br>
<!-- End Slider -->
<!-- Main -->
<div class="container">
<div style="padding: 40px;margin-left: 30px">
	  当前位置：> <a href="qiyemessage"><%=infoList.get(0).getClassname() %>列表</a>		 
		</div>
<div class="jumbotron" style="margin-left:10px">

  <h1><%=infoList.get(0).getClassname() %></h1>
</div>	
	<div class="row clearfix">
		<div class="col-md-12 column">
	
			<ul id="mytable">
				<%	
			
					for(int i = 0; i < infoList.size(); i++){
						
			%>
					<p>
					
						<a style="text-decoration:none;" href="<%=request.getContextPath()%>/contentsone?id=<%=infoList.get(i).getContentid()%>">
						   <img width="40px" height="40px" alt="#" src="<%=path+"/uploads/"+infoList.get(i).getUrl()%>">
						   <%=infoList.get(i).getTitle()%> 
						  	&nbsp;&nbsp;&nbsp;<%=infoList.get(i).getPublish_time()%>
						</a>
						
					</p>
		
						<%						
					}
				
				%>
				</ul>
		</div>
	</div>
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

                 len =$("#mytable p").length - 1;    // 求这个表的总行数，剔除第一行介绍
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
                      direct = 0;             
                      displayPage();
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
                      len =$("#mytable p").length - 1;
                     page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                      curPage=1;        //当前页
                       direct=0;        //方向
                       firstPage();
                  });
              });
   
             function displayPage(){
            	 
                  if(curPage <=1 && direct==-1){
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
                 $("#mytable p").hide();    // 首先，设置这行为隐藏
                 $("#mytable p").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
                     if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                         $(this).show();
                });

             }
             </script>
</body>
</html>