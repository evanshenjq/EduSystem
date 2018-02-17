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
<!-- 引入Boostrap -->
  <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!--  -->
   <link href="${APP_PATH }/static/css/list.css" rel="stylesheet">
</head>
<body>
	<!-- 显示具体内容的modal -->
	<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="mes_name"></h4>
      </div>
      <div class="modal-body" id="mes_content">
        ...
      </div>
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
		<br/>
		<br/>
		<br/>
		
		<!-- form -->
		<form class="form-horizontal" id="user_form">
		  <input type="hidden" name="tId" id="inputId">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-md-2 control-label">UserName</label>
		    <div class="col-md-4">
		      <input type="text" class="form-control" id="inputUserName" placeholder="username" disabled="disabled" name="tUsername">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-md-2 control-label">Password</label>
		    <div class="col-md-4">
		      <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="tPassword">
		      <span class="help-block"></span>
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="inputPassword3" class="col-md-2 control-label">Confirmed Password</label>
		    <div class="col-md-4">
		      <input type="password" class="form-control" id="inputPasswordC" placeholder="Confirmed Password">
		      <span class="help-block"></span>
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="inputEmail3" class="col-md-2 control-label">Name</label>
		    <div class="col-md-4">
		      <input type="text" class="form-control" id="inputName" placeholder="name" disabled="disabled" name="tName">
		      <span class="help-block"></span>
		    </div>
		  </div>
			<br/>
		  <div class="form-group">
		    <div class="col-md-offset-5">
		      <button type="button" class="btn btn-primary" id="editBtn">Update</button>
		    </div>
		  </div>
		</form>
	
	
	<script type="text/javascript">
	
		
		
		
		
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
		
		$(function(){
			var teacherString=$.session.get('teacher');
			var teacher=JSON.parse(teacherString);
			getUserTeacher(teacher.tId);
		});
		
		function getUserTeacher(tId){
			$.ajax({
				url:"${APP_PATH}/getTeacher/"+tId,
				type:"GET",
				success:function(result){
					var teacher=result.extend.teacherInfo;
					$('#inputId').val(teacher.tId);
					$('#inputUserName').val(teacher.tUsername);
					$('#inputPassword').val(teacher.tPassword);
					$('#inputPasswordC').val(teacher.tPassword);
					$('#inputName').val(teacher.tName);
					
				}
				
			})
		}
		
		//用于显示错误信息
		function show_validate_Msg(ele,status,msg){
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
				
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//提交校验
		$('#editBtn').click(function(){
			function validate_register_form(){
				var passwordC=$('#inputPasswordC').val();
				var password=$('#inputPassword').val();
				//密码为6-18为中英文组合，小写字母
				var regPassword=/^[a-z0-9]{6,16}$/;
				if(!regPassword.test(password)){
					show_validate_Msg("#inputPassword","error","密码为6-16位小写英文和数字组合");
					return false;
				}else{
					show_validate_Msg("#inputPassword","success","");
				};
				if(password==passwordC){
					show_validate_Msg("#inputPasswordC","success","");
				}else{
					show_validate_Msg("#inputPasswordC","error","两次输入密码要一致");
					return false;
				};
				return true;
			}//未通过表单校验
			if(!validate_register_form()){
				return false;
			}
			
			
			var r=confirm("修改密码需要重新登陆");
			if(r){
				$.ajax({
					url:'${APP_PATH}/updateTeacher',
					data:$('#user_form').serialize(),
					type:"POST",
					success:function(result){
						if(result.code==100){
							alert('修改成功！重新登陆');
							$.session.remove('teacher');
							window.location.href="/edu-system";
						}
					}
				});
			}
		});
		

			
			
			
		
	</script>
</body>
</html>