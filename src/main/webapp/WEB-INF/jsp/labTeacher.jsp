<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- 获取app_path地址下面用到 -->
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<!-- 引入JQuery -->
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/jquerySession.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/time.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-timepicker.js"></script>
<!-- 引入Boostrap -->
  <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!--  -->
   <link href="${APP_PATH }/static/css/list.css" rel="stylesheet">
   <link href="${APP_PATH }/static/css/timePicker.css" rel="stylesheet">
</head>
<body>
	<!-- 显示编辑内容的modal -->
	<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">实验室信息</h4>
      </div>
     	<form class="form-horizontal" id="edit_form">
     		<input type="hidden" name="lId" id="inputLabId">
  			<div class="form-group">
	    		<label class="col-sm-2 control-label">实验室名字</label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control" id="inputLabName">
    			</div>
  			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">地点</label>
				<div class="col-md-8">
				   <input type="text" class="form-control col-md-3" id="inputLabPlace" name="lPlace">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">开放时间</label>
				<div class="col-md-8">
				   <input type="text" class="form-control time-picker" id="inputLabStime" name="lStime">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">开放时间</label>
				<div class="col-md-8">
				   <input type="text" class="form-control time-picker" id="inputLabEtime" name="lEtime">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">负责老师</label>
				<div class="col-md-8">
				   <input type="text" class="form-control " id="inputLabPeople" name="lPeople">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">教室容量</label>
				<div class="col-md-8">
				   <input type="text" class="form-control " id="inputLabNum" name="lNum">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">教室描述</label>
				<div class="col-md-10">
				   <input type="text" class="form-control" id="inputLabDes" name="lDes">
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="button" class="btn btn-default" id="edit_submit_btn">提交</button>
			    </div>
			 </div>
			</form>
      </div>
 	 </div>
</div>

		<!-- 显示添加内容的modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">实验室信息</h4>
      </div>
     	<form class="form-horizontal" id="add_form">
  			<div class="form-group">
	    		<label class="col-sm-2 control-label">实验室名字</label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control" id="addLabName" name="lName">
    			</div>
  			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">地点</label>
				<div class="col-md-8">
				   <input type="text" class="form-control col-md-3" id="addLabPlace" name="lPlace">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">开放时间</label>
				<div class="col-md-8">
				   <input type="text" class="form-control time-picker" id="addLabStime" name="lStime">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">开放时间</label>
				<div class="col-md-8">
				   <input type="text" class="form-control time-picker" id="addLabEtime" name="lEtime">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">负责老师</label>
				<div class="col-md-8">
				   <input type="text" class="form-control " id="addLabPeople" name="lPeople">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">教室容量</label>
				<div class="col-md-8">
				   <input type="text" class="form-control " id="addLabNum" name="lNum">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">教室描述</label>
				<div class="col-md-10">
				   <input type="text" class="form-control" id="addLabDes" name="lDes">
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="button" class="btn btn-default" id="add_submit_btn">提交</button>
			    </div>
			 </div>
			</form>
      </div>
 	 </div>
</div>







	<!-- 界面 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2" id="header-name">
				<h2>教务管理系统</h2>
			</div>
			<div class="col-md-3 col-md-offset-5" id="header-user">
				欢迎您，<button class="btn btn-link" id="userName" style="color:#000"></button>老师
				<button class="btn btn-link" id="logout" style="color:#000">注销</button>	
			</div>
		</div>
		<div class="row" id="function_choice">
			<div class="col-md-offset-1">
				<button type="button" class="btn btn-primary" id="userInfoBtn">个人资料</button>
				<button type="button" class="btn btn-primary" id="showInfoBtn">查看信息</button>
				<button type="button" class="btn btn-primary" id="downloadBtn">下载资料</button>
				<button type="button" class="btn btn-primary" id="showLabBtn">实验室信息</button>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
		<div>
	 	<div class="col-md-3 col-md-offset-9">
	 	<button class="btn btn-danger" id="lab_add" data-toggle="modal" data-target="#addModal" data-whatever="@mdo">添加实验室</button>
	 	</div>
		</div>
		</div>
		<!-- 表格 -->
		<div class="row">
		<div class="col-md-12">
		
		<table class="table table-hover" id="lab_table">
			<thead>
				<tr>
					<th class="col-md-2">#</th>
					<th class="col-md-3">实验室名称</th>
					<th class="col-md-3">地点</th>
					<th class="col-md-2">负责老师</th>
					<th class="col-md-4">操作</th>
				</tr>
			<thead>
			
			<tbody>
				
			</tbody>
			
			
		</table>
		</div>
	</div>
	<!-- 分页栏 -->
	<div class="row"></div>
	<!-- 分页文字信息 -->
		<div class="col-md-6" id="page_info">
			
		</div>
	<!-- 分页条 -->
		<div class="col-md-6" id="page_nav">
		
		</div>
	</div>
	
	
	<script type="text/javascript">
	
		//1.页面加载完成后，发送ajax请求
	
		var records,currentPage;
	
		$(function(){
			//去第一页
			to_page(1);
		});
	
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/getLabs",
				data:{'pn':pn},
				type:"GET",
				success:function(result){
					//1.解析json，显示员工数据
					build_lab_table(result);
					//2.解析显示分页信息
					build_pag_info(result);
					//3.解释显示分页条
					build_pag_nav(result);
				}
			});
		
		}
		
		function build_lab_table(result){
			
			//清空
			$("#lab_table tbody").empty();
			var labs=result.extend.page.list;
			$.each(labs,function(index,item){
				var labIdTD = $("<td></td>").append(index+1);
				var labNameTD = $("<td></td>").append(item.lName);
				var labPeopleTD = $("<td></td>").append(item.lPeople);
				
				var labPlaceTD = $("<td></td>").append(item.lPlace);
				
				var editBut= $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
				.append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
				//为编辑添加一个自定义属性
				editBut.attr("edit_id",item.lId).attr("data-toggle","modal").attr("data-target","#showModal");
				
				var delBut= $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
				.append("<span></span>").addClass("glyphicon glyphicon-pencil").append("删除");
				//为删除添加一个自定义属性
				delBut.attr("del_id",item.lId).attr("data-toggle","modal").attr('del_name',item.lName);
				
				var handleBut=$("<td></td>").append(editBut).append(' ').append(delBut);
				//append返回原来元素
				$("<tr></tr>")
				.append(labIdTD)
				.append(labNameTD)
				.append(labPlaceTD)
				.append(labPeopleTD)
				.append(handleBut)
				.appendTo("#lab_table tbody");
				
			});
			
		}
		
		
function build_pag_info(result){
			
			$("#page_info").empty();
			$('#page_info').append("当前"+result.extend.page.pageNum+
					"页,总"+result.extend.page.pages+"页，总"+result.extend.page.total+"条记录");
			currentPage=result.extend.page.pageNum;
			records=result.extend.page.total;
			
		}
		
		function build_pag_nav(result){
			
			$("#page_nav").empty();
			
			var ul=$("<ul></ul>").addClass("pagination")
			
			var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
			if(!result.extend.page.hasPreviousPage){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page((result.extend.page.pageNum-1));
			});
			}
			
			var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
			if(!result.extend.page.hasNextPage){
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			}else{
			nextPageLi.click(function(){
				to_page(result.extend.page.pageNum+1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.page.pages);
			});
			}
		
			
			//添加
			ul.append(firstPageLi).append(prePageLi);
			//遍历添加页码号
			$.each(result.extend.page.navigatepageNums,function(index,item){
				
				var numLi=$("<li></li>").append($("<a></a>").append(item));
				if(result.extend.page.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
				
			});
			ul.append(nextPageLi).append(lastPageLi);
			
			var nav=$("<nav></nav").append(ul);
			nav.appendTo("#page_nav");
		}
		
		
		
		
		//判断状态
		function judge_session(){
			if($.session.get('teacher')!=null){
				var teacherString=$.session.get('teacher');
				var teacher=JSON.parse(teacherString);
				$('#userName').append(teacher.tName);
				
			}else{
				window.location.href="error";
			}
		}
		
		//判断登陆状态正确
		judge_session();
		
		
		//注销逻辑
		$('#logout').click(function(){
			$.session.remove('teacher');
			window.location.href="/edu-system";
		});
		
		//信息页面跳转
		$('#showInfoBtn').click(function(){
			window.location.href="listTeacher";		
		});
		
		//下载页面跳转
		$('#downloadBtn').click(function(){
			window.location.href="fileTeacher";		
		});
		
		$('#userInfoBtn').click(function(){
			window.location.href="userTeacher";		
		});
		
		$('#showLabBtn').click(function(){
			window.location.href="labTeacher";		
		});
		
		//显示具体信息
		$(document).on("click",".edit_btn",function(){
			
			getLab($(this).attr("edit_id"));
			
		});
		
		$(document).on("click",".del_btn",function(){
			
			var id=$(this).attr("del_id");
			var name=$(this).attr("del_name");
			if(confirm("确认要删除"+name+"吗？")){
				$.ajax({
					url:"${APP_PATH}/delLab/"+id,
					type:"POST",
					success:function(result){
						if(result.code==100){
							alert("删除实验室成功");
							window.location.href="labTeacher";
						}else{
							alert("发生异常错误");
						}
					}
				});
			}
			
		});
			
			
			
		
		//得到id对应的Message
		function getLab(id){
			$.ajax({
				url:"${APP_PATH}/lab/"+id,
				type:"GET",
				success:function(result){
					var lab=result.extend.eduLab;
					$('#inputLabId').val(lab.lId);
					$('#inputLabName').val(lab.lName);
					$('#inputLabNum').val(lab.lNum);
					$('#inputLabStime').val(lab.lStime);
					$('#inputLabEtime').val(lab.lEtime);
					$('#inputLabPeople').val(lab.lPeople);
					$('#inputLabPlace').val(lab.lPlace);
					$('#inputLabDes').val(lab.lDes);
				}
			});
		}
		
		//时间插件
		$('.time-picker').hunterTimePicker({
		     callback: function(e){
		         
			}
		});
		
		$('#edit_submit_btn').click(function(){
			$.ajax({
				url:"${APP_PATH}/editLab",
				data:$('#edit_form').serialize(),
				type:"POST",
				success:function(result){
					if(result.code==100){
						alert("编辑实验室成功");
						window.location.href="labTeacher";
					}else{
						alert("发生异常错误");
					}
				}	
			})
		})
		
		$('#add_submit_btn').click(function(){
			$.ajax({
				url:"${APP_PATH}/addLab",
				data:$('#add_form').serialize(),
				type:"POST",
				success:function(result){
					if(result.code==100){
						alert("添加实验室成功");
						window.location.href="labTeacher";
					}else{
						alert("发生异常错误");
					}
				}
				
			})
		})
		

	</script>
</body>
</html>