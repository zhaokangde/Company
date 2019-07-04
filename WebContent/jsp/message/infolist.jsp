<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.List" %>
<%@page import= "java.util.Date" %>
<%@page import= "com.qq.model.InfoList" %>
<%@page import= "com.qq.model.Newclass" %>
    <%String path = request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入富文本编辑器依赖包 -->
<script src="<%=request.getContextPath() %>/ckeditor/ckeditor.js "></script>
<script src="<%=request.getContextPath() %>/ckeditor/config.js"></script>
<title>信息列表</title>
<!-- 分页js代码 -->
<script type="text/javascript" >
              var pageSize = 10;    //每页显示的记录条数
              var curPage=0;        //当前页
           	var lastPage;        //最后页
             var direct=0;        //方向
              var len;            //总行数
              var page;            //总页数
               var begin;
              var end;
             
             $(document).ready(function display(){//1231123132   
                 len =$("#mytable tr").length;    // 求这个表的总行数，剔除第一行介绍
                 page=len % pageSize==0 ?len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
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
<!-- 操作表js代码 -->
<script type="text/javascript">
var xmlhttp;
if (window.XMLHttpRequest)
{
  xmlhttp=new XMLHttpRequest();
}
else
{
  // IE6, IE5 浏览器执行代码
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
//关闭修改用户弹框
function close2(){
	document.getElementById("Update").style.visibility='hidden';
}
//点击修改执行方法显示修改前的信息
function Update(contentid){	
	//alert("我是信息id:"+contentid);
	//显示修改框
 document.getElementById("Update").style.visibility='visible';
	//直接执行后台请求
   
	xmlhttp.onreadystatechange=function()
	{
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  {
	    var result = JSON.parse(xmlhttp.responseText);
	  //获取后台返回来的对象的json字符串，在这里解析转化为对象
	    var allmessage1 = JSON.parse(result.message);
	    //通过对象点来展示要修改的信息
	    /**{"contentid":8,"classid":2,"picid":18,"classname":"企业新闻",
	    	"url":"C:\\fakepath\\微信图片_20190304165433.png","title":"哈哈哈",
	    	"contents":"\u003ch1\u003e\u003cstrong\u003e个法尔去二我\u003c/strong\u003e\u003c/h1\u003e\n"}
	    */
	    //显示要修改的id
	    document.getElementById("name").value =allmessage1.contentid;
	    //显示要修改的图片
	    document.getElementById("ca_img").src ="<%=request.getContextPath()%>/uploads/"+allmessage1.url;
	    document.getElementById("icon_url").value =allmessage1.url;
	    document.getElementById("title").value =allmessage1.title;
	    //显示内容信息
	    document.getElementById("contents").value =allmessage1.contents;
	    editor.setData(allmessage1.contents);		
	    }  
 
	  }
	xmlhttp.open("post","/Company/Updatecontent?contentid="+contentid,true);
	xmlhttp.send();
	}
</script>

<script type="text/javascript">
function deleteContent(contentId){
	xmlhttp.onreadystatechange=function(){
    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
      		//xmlDoc=xmlhttp.responseText;
      		var result = JSON.parse(xmlhttp.responseText);
      		alert(result.message);
      		if(result.statusCode == 200){
      			//执行操作成功后刷新页面
      			$.get('<%=request.getContextPath()%>/InfoList', function (data) {
      	            $(".content").html(data);
      	        });
      		}
   		}
	}	
	xmlhttp.open("post","/Company/deletecontent?contentId=" + contentId , true);
	xmlhttp.send();
}

</script>
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
        	var formdate = new FormData();
        	formdate.append("image",$('#image').get(0).files[0]);
        	formdate.append("classlist",$('#classlist').val());
        	formdate.append("name",$('#name').val());
        	formdate.append("title",$('#title').val());
        	formdate.append("content",editor.getData());
        	alert($('#image').get(0).files[0]+"  "+$('#classlist').val()+"  "+$('#title').val()+editor.getData());
            $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                contentType:false,
                url: "/Company/updateSave" ,//url
                data:formdate,
                processData:false,
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.statusCode == 200) {
                        alert("SUCCESS");
                    	document.getElementById("Update").style.visibility='hidden';
                      //执行操作成功后刷新页面
        	  			$.get('<%=request.getContextPath()%>/InfoList', function (data) {
              	            $(".content").html(data);
        	  			});
                    }
                    ;
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
    
<script>
    $(function () {
        dragPanelMove("#xiugai","#Update");
        function dragPanelMove(downDiv,moveDiv){
            $(downDiv).mousedown(function (e) {
                    var isMove = true;
                    var div_x = e.pageX - $(moveDiv).offset().left;
                    var div_y = e.pageY - $(moveDiv).offset().top;
                    $(document).mousemove(function (e) {
                        if (isMove) {
                            var obj = $(moveDiv);
                            obj.css({"left":e.pageX - div_x, "top":e.pageY - div_y});
                        }
                    }).mouseup(
                        function () {
                        isMove = false;
                    });
            });
        }
    });
</script>
    
	<style type="text/css">
    #Update {
    visibility:hidden;
    position:absolute;
    left:30%;
    top:30%;
    border:solid 1px #2F4F4F;
    background-color: #F0FFFF; 
    z-index: 100000; 
    width: 900px; 
    height: 700px; 
    overflow: scroll;
    }
    #xiugai {
    cursor: move;
    
    }
</style>
</head>
<body>
<!-- 修改用户 开始-->
<!-- style="visibility:hidden; position:absolute;left:30%;top:30%;border:solid 1px #2F4F4F;background-color: #F0FFFF; z-index: 100000; width: 900px; height: 700px; overflow: scroll;" -->
<div id="Update" >
<div>
<div id="xiugai" style="padding:10px "><h2>修改信息</h2></div>
<div>
<form id="form1" action="/Company/fileupload"   class="form-horizontal"  enctype="multipart/form-data" action="##" method="post">
 <div class="form-group" >  
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">信息ID：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="name" readonly="readonly">
    </div>
  </div>
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
					<img id="ca_img" width="80px" height="85px" border-radius: 8px;">
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
 <textarea name="content" id="contents"></textarea>
  <script type="text/javascript">
     	var editor = CKEDITOR.replace('content');      
    </script>
    </div>    
    </div>
<br/>
 <button onclick="login()" type="button" class="btn btn-lg btn-default btn-block">提交</button>
 </from>
 </form>
</div>
<a id="HCloseBtn" title="关闭"  style="background-color: #DC143C;width:24px;height:24px;line-height:18px;display:inline-block;cursor:pointer;color:#fff;font-size:1.4em;text-align:center;position:absolute;top:8px;right:8px;"><span onclick="close2()" style="width:24px;height:24px;display:inline-block;">×</span></a></div>
</div>  

<%
 List<InfoList> allmessage =null;
 if(request.getAttribute("allmessage")!=null && request.getAttribute("allmessage")!="" ){
	 allmessage =( List<InfoList>) request.getAttribute("allmessage");
	 
	 }else{
 %>
<h1>未获取到任何信息，请联系管理员.......</h1>
<% 
	 }
 
 %>
<div>
    <div class="col-md-12">
        <ol class="breadcrumb">
            <li><a href="index.jsp">主页</a></li>
            <li><a href="index.jsp">系统管理</a></li>
            <li class="active">信息列表</li>
        </ol>
     </div>
    <div class="">
        <table id="mytable" class="table table-hover" >
					<thead>
						<tr >
							<th>信息ID</th>
							<th>信息分类</th>
							<th>图片地址</th>
							<th>信息标题</th>
							<th >发布时间</th>
							<th >操作</th>
						</tr>
					</thead>
				
					<tbody>
  <%
      	  		
 				for(InfoList h:allmessage){
 		   
 %>            

						<tr>
						    <td ><%=h.getContentid()%></td>
							<td><%=h.getClassname()%></td>
							<td><%=h.getUrl()%></td>
							<td><%=h.getTitle()%></td>
						
							<td><%=h.getPublish_time()%></td>
						
						<td><a href="#" class="btn btn-primary"   onclick="Update(<%=h.getContentid()%>)">修改</a>&nbsp;&nbsp;&nbsp;<a id="de" href="#" class="btn btn-danger"  onclick="deleteContent(<%=h.getContentid()%>)" >删除</a></td>
						   
					      </tr>			
						
		<%
		}
  	%>
		</tbody>
		
		</table>
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