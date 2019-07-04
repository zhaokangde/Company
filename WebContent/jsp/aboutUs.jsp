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
				<img src="<%=path %>/img/aboutus.jpg">
			</div>
		<div>
<div class="page-header">
<br>
<br>
  <h1>梦想指引方向. <small>行动创造未来</small></h1>
</div>
<br>

<div class="jumbotron">
  <h1>公司概况</h1>
  <p style="text-indent:2em;">  重庆指引科技有限公司是一家专业从事视觉传达型高端网站建设、手机移动端应用与开发，多媒体互动技术、智慧城市、智慧景区、智慧校园等智能交互，大数据分析，并涉足网络推广与营销（朋友圈广告、广点通）、企业邮箱、企业应用软件开发、企业VI设计、电子商务等诸多领域的科技公司。
指引科技立足西南，植根重庆，以“用心创造，服务增值”的经营思路，为西部地区的企业单位提供从网站建设，网络推广到应用软件开发一整套的电子商务应用；指引科技拥有优秀的数字智能化系统开发、工程应用，特定领域产品项目研发经验，在传统互联网与展厅多媒体系统集成、物联网领域处于世界优先水平，汇聚了一大批跨国经营人才，为多家客户提供了专业的解决方案；指引科技紧随时代潮流，不断锐意进取，突破创新，在手机端投入大量的心血，研发出了多款成熟且广受客户好评的产品。
    “长风破浪会有时，直挂云帆济沧海”。指引科技关注现在，踏实经营，特色服务；亦着眼未来，不断引进人才，加大对新产品的研发力度，注重企业文化建设，关注新技术，新思维，营造创意自由，情怀四溢的新型企业，为同我们的客户一道同舟共济、共进共赢而不懈努力！ </p>

</div>

<div class="row">
<div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="<%=path %>/img/aboutus1.png" alt="...">
      <div class="caption">
        <h3>合作客户</h3>
        <p style="text-indent:2em;"> 我们秉承把客户摆在优先位置，同客户一起解决互联网营销难题，提供专业的互联网营销解决方案，在云贵川渝地区指引科技服务逾壹万家客户。</p>
   
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="<%=path %>/img/aboutus2.png" alt="...">
      <div class="caption">
        <h3>资格荣誉</h3>
        <p style="text-indent:2em;">  十几年间，筚路蓝缕，栉风沐雨，指引科技在重庆这片沃土上生根发芽，蓬勃生长，经过多年的发展与沉淀，我们已经拥有了专业的销售、技术和服务团队，建立了完善的技术开发体系、服务质量体系、专业培训体系，保证服务的客户能够得到标准、专业、优质的互联网应用服务。高山仰止，不断攀登， “双高企业”、“政府重点扶持企业”以及多套软件专利等资质荣誉会让我们更加明白自己的历史使命和社会责任。</p>
     
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="<%=path %>/img/aboutus3.png" alt="">
      <div class="caption">
        <h3>企业文化</h3>
          <p style="text-indent:2em;"> 如果需要让巨幕组件的宽度与浏览器宽度一致并且没有圆角，请把此组件放在所有如果需如果需要让巨幕组件的宽度与浏览器宽度一致并且没有圆角，请把此组件放在所有如果需..</p>
       
      </div>
    </div>
  </div>
</div>

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