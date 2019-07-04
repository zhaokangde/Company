<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.List" %>
<%@page import= "com.qq.model.Critical" %>
   <% String path = request.getContextPath();%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户评论信息</title>
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
             
             $(document).ready(function display(){//1231123132   
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
<script type="text/javascript">
	//删除一条评论
		function deletcontent(criticalId){
		
		alert(criticalId);	
		 if(confirm('确实要删除吗?')){
			 $.ajax({
		         //几个参数需要注意一下
		             type: "POST",//方法类型
		             url: "<%=path%>/critical/deletContent?criticalId="+criticalId,
		             dataType:'json',
		             success: function (result) {
		                 console.log(result);//打印服务端返回的数据(调试用)
		                 if (result.statusCode == 200) {
		                	alert("删除成功");
		                	//执行操作成功后刷新页面
		          		$.get('<%=request.getContextPath()%>/critical/contentone', function (data) {
      	            $(".content").html(data);
      	        });
		                   //执行操作成功后刷新页面
		                 }
		                 ;
		             },
		             error : function() {
		                 alert("异常！");
		             }
		         });
		 }
	}
		//关闭登陆弹框
	function close1(){
			document.getElementById("loginfrom").style.visibility='hidden';
		}

		//回复留言弹框跳出
	function replycontent(content,resid,username,uuid){
			$("#uuid").val(uuid);
			$("#resId").val(resid);
			$("#username").val(username);
			$("#usersay").val(content);
		document.getElementById("loginfrom").style.visibility='visible';
	}
	function reply(){
		var uuid = $("#uuid").val();
         var contentId = $("#resId").val();
		var  mangersay=	$("#mangersay").val();
		if(mangersay==null || mangersay==""){
			alert("内容为空，请输入内容！");
		}else{
			$.ajax({
 		         //几个参数需要注意一下
 		             type: "POST",//方法类型
 		             url: "<%=path%>/critical/mangerreply?mangersay="+mangersay+"&contentId="+contentId+"&uuid="+uuid,
 		             dataType:'json',
 		             success: function (result) {
 		               alert(result.message);//打印服务端返回的数据(调试用)
 		             document.getElementById("loginfrom").style.display='none'; 
 		       	$.get('<%=request.getContextPath()%>/critical/contentone', function (data) {
     	            $(".content").html(data);  });
 		               
		               
 		             },
 		             error : function() {
 		                 alert("异常！");
 		             }
 		         });
		}

			 
			
	}

</script>

<style type="text/css">
  table{
    width: 100%;
	
  }
  tr{
  margin-left:20px;
  padding-left:50px;
  height: 20px; 
  width: 300px;
  font-size: 14px;
  }
.demo {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 200px;
	height: 30px;line-height: 20px;font-size: 14px;overflow: hidden;-ms-text-overflow: ellipsis;text-overflow: ellipsis;white-space: nowrap;}
	
tr:hover {height:30px;white-space: normal;
      background-color: #3c8dbc;
}
</style>
<!--拖动弹框  -->
<style type="text/css">
    #loginfrom{
   visibility:hidden;
    position:absolute;
    left:30%;
    top:30%;
    border:solid 1px #2F4F4F;
    background-color: #F0FFFF; 
    z-index: 100000; 
    width: 800px; 
    height: 500px; 
    overflow: scroll;
    }
    #xiugai {
    cursor: move;
    
    }
    
    
    
    /* 文本域样式 */
    #usersay{
    	height: 60px;
    	width: 574px;
    }
    #mangersay{
    	height: 60px;
    	width: 574px;
    }
    
</style>
<script>
    $(function () {
        dragPanelMove("#xiugai","#loginfrom");
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
</head>
<body>
<%
List<Critical> allCritcal = null;
if(request.getAttribute("allCritcal") != null){
	allCritcal = (List<Critical>)request.getAttribute("allCritcal");
}
%>
<!--管理员回复弹框 -->
<!-- display:none; position: fixed; border:solid 1px #2F4F4F;background-color: #F0FFFF; top: 50%; left: 50%; margin: -135px 0px 0px -150px; z-index: 100000; width: 800px; height: 450px; -->
<div id="loginfrom">
<div id="xiugai" style="padding:10px "><h3>回复评论</h3>
</div>
 <form onsubmit="return false" class="form-horizontal" role="form">
    <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">资源ID：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="resId" readonly="readonly">
       <input type="text" class="form-control" id="uuid" readonly="readonly" style="style="display:none">
    </div>
  </div>
   <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" readonly="readonly" id="username" placeholder="用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label" >用户留言：</label>
    <div class="col-sm-9">
    <textarea id="usersay" readonly="readonly">   
    </textarea>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">管理员回复：</label>
    <div class="col-sm-9">
       <textarea rows="30px" id="mangersay"></textarea>
    </div>
  </div>
      <button onclick="reply()" type="submit" class="btn   btn-block">回复</button>   
</form>
<a id="HCloseBtn" title="关闭"  style="background-color: #DC143C;width:24px;height:24px;line-height:18px;display:inline-block;cursor:pointer;color:#fff;font-size:1.4em;text-align:center;position:absolute;top:8px;right:8px;"><span onclick="close1()" style="width:24px;height:24px;display:inline-block;">×</span></a></div>
</div> 

<div class="row">
    <div class="col-md-12">
        <ol class="breadcrumb">
            <li><a href="index.jsp">主页</a></li>
            <li><a href="index.jsp">系统管理</a></li>
            <li class="active">用户评论</li>
        </ol>
     </div>
        <table id="mytable" class="table" width="100%" layoutH="138">
					<thead>
						<tr >
							<th>评论ID</th>					
							<th>用户名</th>
							<th>文章id</th>
							<th >评论内容</th>
							<th >评论时间</th>
							<th>信息类型</th>
						</tr>
					</thead>
				
					<tbody id="allCritcal">
                  <%
        
	  		
 				for(Critical h:allCritcal){
 
 					
                 %>   
	           
	    
	            
	           
						<tr id="<%=h.getCraticId()%>">
						    <td><%=h.getCraticId()%></td>				
							<td><%=h.getUserName()%></td>
							<td ><%=h.getContentId()%></td>
							<td class="demo"><%=h.getCratiContent()%></td>
							<td ><%=h.getCraticTime()%></td>
							<td><%=h.getCraticType()%></td>
							<td ><a  href="#"  onclick="replycontent('<%=h.getCratiContent()%>','<%=h.getContentId()%>','<%=h.getUsername()%>','<%=h.getResId()%>')" >回复</a>&nbsp;&nbsp;&nbsp;<a  href="#"  onclick="deletcontent(<%=h.getCraticId()%>)" >删除</a></td>
					      </tr>			
						
		<%} %>
		</tbody>
		
		</table>
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