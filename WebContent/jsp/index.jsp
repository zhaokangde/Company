<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String name=null;
    if(session.getAttribute("NAME")!=null &&session.getAttribute("NAME")!=""){
    	name = (String)session.getAttribute("NAME");
    }else{
    	response.sendRedirect("login");
    }
    %>
    
    
    <% String path = request.getContextPath();%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>企业信息发布管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins 
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/_all-skins.min.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/dataTables.bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-datepicker.min.css">
  <style type="text/css">
    .content-gb-white{
      background-color: white;
    }
  </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
     <span class="logo-mini">企业信息发布系统</span>
      <!-- logo for regular state and mobile devices -->
    <h3>信息发布系统</h3>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=name%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                     <%=name%> - 系统管理员
                  <small>入职日期：2018-12-01</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">个人信息</a>
                </div>
                <div class="pull-right">
                  <a href="<%=request.getContextPath()%>/login" class="btn btn-default btn-flat">退出</a>
                </div>
              </li>
            </ul>
          </li>
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">

        <li class="treeview">
          <a href="#">
            <i class="fa fa-group"></i>
            <span>信息管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li url="<%=request.getContextPath()%>/infopulish"><a href="#"><i class="fa fa-circle-o"></i>信息发布</a></li>
            <li url="<%=request.getContextPath()%>/InfoList"><a href="#"><i class="fa fa-circle-o"></i>信息列表</a></li>
           
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-yen"></i> <span>评论管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li url="<%=request.getContextPath()%>/critical/contentone"><a href="#"><i class="fa fa-circle-o"></i>用户评论信息</a></li>
           <li url="<%=request.getContextPath()%>/critical/reply"><a href="#"><i class="fa fa-circle-o"></i>管理员回复信息</a></li>
          </ul>
        </li>


        <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i>
            <span>网站访问监控</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li url="messageF/messageEcharts.html"><a href="#"><i class="fa fa-circle-o"></i>信息点击量分析</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa  fa-gear"></i>
            <span>系统管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li url="<%=request.getContextPath()%>/userlist"><a href="#"><i class="fa fa-circle-o"></i>用户管理</a></li>
            <li url="<%=request.getContextPath()%>/userlist"><a href="#"><i class="fa fa-circle-o"></i>角色管理</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <!--这里显示内容页面-->
      <ol class="breadcrumb">
        <li class="active"><a href="#">主页</a></li> 
        <div id = "cnt"></div>       
      </ol>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>版本</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2018-2020 <a href="http://www.baidu.com" target="_blank">YYW</a></strong> All rights
    reserved.毕业设计个人版权所有
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/js/adminlte.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/dataTables.bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"  type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/echarts.min.js"  type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/index.js"  type="text/javascript" charset="utf-8"></script>
</body>
</html>