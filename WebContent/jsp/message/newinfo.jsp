<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.List" %>
<%@page import= "java.util.Date" %>
<%@page import= "com.qq.model.Newclass" %>

<!-- 引入编辑器依赖包 -->
<script src="<%=request.getContextPath() %>/ckeditor/ckeditor.js "></script>
<script src="<%=request.getContextPath() %>/ckeditor/config.js"></script>

<!-- 实现在线预览 -->
<script type="text/javascript">
		function addImage() {
			document.getElementById("image").click();
		}

	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var icon_url = document.getElementById("icon_url");
		var docObj = document.getElementById("image");
		var imgObjPreview = document.getElementById("ca_img");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '85px';
			imgObjPreview.style.height = '80px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			icon_url.value = window.URL.createObjectURL(docObj.files[0])
					.substring(5, 22)
					+ docObj.files[0].name;
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "85px";
			localImagId.style.height = "80px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}

</script>
  <!-- ajax操作form表单提交数据到后台 -->
    <script type="text/javascript">
        function login() {
        
        	alert(editor.getData());
        	var formdate = new FormData();
        	formdate.append("image",$('#image').get(0).files[0]);
        	formdate.append("classlist",$('#classlist').val());
        	formdate.append("title",$('#title').val());
        	formdate.append("content",editor.getData());
        	
            $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                contentType:false,
                url: "/Company/fileupload" ,//url
                data:formdate,
                processData:false,
                success: function (result) {
                   // console.log(result);//打印服务端返回的数据(调试用)
                   //debugger; 
                   if (result.statusCode == 200) {
                        alert("SUCCESS");
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
	<div>
    <div class="col-md-12">
        <ol class="breadcrumb">
            <li><a href="index.jsp">主页</a></li>
            <li><a href="index.jsp">系统管理</a></li>
            <li class="active">信息发布</li>
        </ol>
     </div>

 <!-- 在线预览图片 -->  

<form id="form1" action="/Company/fileupload"   class="form-horizontal"  enctype="multipart/form-data" action="##" method="post">
 <div class="form-group" >  
   <label for="lastname"  class="col-sm-2 control-label">图&nbsp;&nbsp;&nbsp;片：</label>
    <div class="col-sm-9">
			<div>
				<div>
					<input class="form-control" type="text" id="icon_url"/> 
					<a href="###"  onclick="addImage()" >选择图片</a> 
					<input
					type="file" id="image" name="image" style="display: none;"
					onchange="javascript:setImagePreview();" />
				</div>
			
		   </div>
			<div id="localImag">
					<img id="ca_img"  border-radius: 8px;">
			</div>
	</div>	
 <!--  <input type="submit"  value="上传图片"> --> 
  <label for="lastname" class="col-sm-2 control-label">类&nbsp;&nbsp;&nbsp;别：</label>
    <div class="col-sm-9">
    
      <select name="classlist" class="form-control"   id="classlist">
     <% 
     
     List<Newclass> newclass = ( List<Newclass>)request.getAttribute("newclass");
     for(Newclass h:newclass ){
						
	%>
	<option  value="<%=h.getClassid()%>"><%=h.getClassname() %></option>
                   <%} %>
      
      </select>
      
    </div>
  </div>
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">标&nbsp;&nbsp;&nbsp;题：</label>
    <div class="col-sm-9">
      <input type="text" name="titlename" class="form-control" id="title" placeholder="请输入名字">
    </div>
  </div>

  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">内&nbsp;&nbsp;&nbsp;容：</label>
    <!-- 富文本编辑器 -->
    <div class="col-sm-9">
     <textarea id="content" name="content"></textarea>
     <script type="text/javascript">
     	var editor = CKEDITOR.replace('content');
     </script>
    </div>
  </div>
   <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;</label>
    <div class="col-sm-9">
      <input class="btn btn-lg btn-default btn-block" type="button" onclick="login()" value="提交">
    </div>
  </div>
<br/>    
</form>
</div> 
