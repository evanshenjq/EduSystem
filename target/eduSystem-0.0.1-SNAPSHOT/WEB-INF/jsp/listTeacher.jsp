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
<!-- 引入Boostrap -->
  <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!--  -->
   <link href="${APP_PATH }/static/css/list.css" rel="stylesheet">
</head>
<body>
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
				<button type="button" class="btn btn-primary">发布信息</button>
				<button type="button" class="btn btn-primary">上传资料</button>
			</div>
		</div>
		<div class="row" id="function_show">
		
		</div>
	</div>
	<script type="text/javascript">
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
	</script>
</body>
</html>