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
				欢迎您，<button class="btn btn-link" id="userInfo" style="color:#000">xxx</button>
				<button class="btn btn-link" id="logout" style="color:#000">注销</button>	
			</div>
		</div>
		<div class="row" id="function_choice">
			<div class="col-md-offset-1">
				<button type="button" class="btn btn-primary">查看信息</button>
				<button type="button" class="btn btn-primary">下载资料</button>
			</div>
		</div>
		<div class="row" id="function_show">
		
		</div>
	</div>
</body>
</html>