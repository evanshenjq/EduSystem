<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务管理系统</title>
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
   <link href="${APP_PATH }/static/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 搭建注册模态框 -->
	<div class="modal fade register_modal" tabindex="-1" role="dialog">
  		<div class="modal-dialog" role="document">
   			 <div class="modal-content">
      			<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		 <h4 class="modal-title">注册</h4>
      			</div>
      		<div class="modal-body">
      			  <!-- 模态框内容 -->
      			  <form class="form-horizontal" id="register_form">
      			  	<div class="form-group">
    					<label class="col-sm-2 control-label">您是</label>
    					<div class="col-sm-10" id="radio">
 					 	<input name="st" type="radio" id="student_register_choice" checked="checked">学生
 					 	<input name="st" type="radio" id="teacher_register_choice">教师
 					 	<span class="help-block"></span>
 					 	</div>
 					 </div>
 					 <div class="form-group">
    					<label class="col-sm-2 control-label">用户名</label>
    					<div class="col-sm-10">
     					 <input type="email" class="form-control" id="username_register_input" placeholder="usrname">
   					   	 <span class="help-block"></span>
   					    </div>
 					 </div>
 					 <div class="form-group">
   						 <label class="col-sm-2 control-label">密码</label>
   						 <div class="col-sm-10">
      				     	<input type="password" class="form-control" id="password_register_input" placeholder="password">
    						<span class="help-block"></span>
    					 </div>
  					</div>
 					 <div class="form-group">
   						<label class="col-sm-2 control-label">确认密码</label>
   						 <div class="col-sm-10">
      				     	<input type="password" class="form-control" id="password_confirm_input" placeholder="password_confirm">
    					 	<span class="help-block"></span>
    					 </div>
 					 </div>	 
 					 <div class="form-group">
   						<label class="col-sm-2 control-label">姓名</label>
   						 <div class="col-sm-10">
      				     	<input type="text" class="form-control" id="name_register_input" placeholder="name">
    					 	<span class="help-block"></span>
    					 </div>
 					 </div>	
				 </form>
      		</div>
      		<div class="modal-footer">
       			 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        		 <button type="button" class="btn btn-primary" id="register_submit_btn">提交</button>
     		 </div>
    		</div><!-- /.modal-content -->
 		 </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
	<!-- 搭建登陆模态框 -->
<div class="modal fade login_modal" tabindex="-1" role="dialog">
  		<div class="modal-dialog" role="document">
   			 <div class="modal-content">
      			<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		 <h4 class="modal-title">Modal title</h4>
      			</div>
      		<div class="modal-body">
      			  <!-- 模态框内容 -->
      			  <form class="form-horizontal" id="login_form">
 					 <div class="form-group">
    					<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
    					<div class="col-sm-10">
     					 <input type="text" class="form-control" id="username_login_input" name="username" placeholder="username">
   					   	 <span class="help-block"></span>
   					    </div>
 					 </div>
 					 <div class="form-group">
   						 <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
   						 <div class="col-sm-10">
      				     	<input type="password" class="form-control" id="password_login_input" name="password" placeholder="password">
    						<span class="help-block"></span>
    					 </div>
    				<div id="radio"> 
 					 	<input name="st" type="radio" id="student_login_choice" checked="checked">学生
 					 	<input name="st" type="radio" id="teacher_login_choice">教师
 					 </div>
  					</div>
 					
 					 
				 </form>
      		</div>
      		<div class="modal-footer">
       			 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        		 <button type="button" class="btn btn-primary" id="login_submit_btn">提交</button>
     		 </div>
    		</div><!-- /.modal-content -->
 		 </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	<div class="container-fluid">
		<div id="case">
			<h1>教务管理系统</h1>	
			<div id="touch">
				<button type="button" class="btn btn-info" id="register_btn" data-toggle="modal" data-target=".register_modal">注册</button>
				<button type="button" class="btn btn-primary" id="login_btn" data-toggle="modal" data-target=".login_modal">登陆</button>
			</div>	
		
		</div>	
	</div>

	<script type="text/javascript">
		
		
		//判断学生老师，给input加name值
		function judge_register(){
			var usernameRI=$('#username_register_input');
			var passwordRI=$('#password_register_input');
			var nameRI=$('#name_register_input');
			if($('#student_register_choice').is(":checked")){
				usernameRI.attr('name','sUsername');
				passwordRI.attr('name','sPassword');
				nameRI.attr('name','sName');
			}
			if($('#teacher_register_choice').is(":checked")){
				usernameRI.attr('name','tUsername');
				passwordRI.attr('name','tPassword');
				nameRI.attr('name','tName');
			}
		}
		
		function judge_login(){
			var usernameLI=$('#username_login_input');
			var passwordLI=$('#password_login_input');
			if($('#student_login_choice').is(":checked")){
				usernameLI.attr('name','sUsername');
				passwordLI.attr('name','sPassword');
			}
			if($('#teacher_login_choice').is(":checked")){
				usernameLI.attr('name','tUsername');
				passwordLI.attr('name','tPassword');
			}
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
		
		//判断用户名是否存在
		$('#username_register_input').change(function(){
			var username=this.value;
			judge_register();
			if($('#student_register_choice').is(":checked")){
				$.ajax({
					url:'${APP_PATH}/checkSName',
					data:{'sUsername':username},
					type:"POST",
					success:function(result){
						if(result.code==100){
							show_validate_Msg('#username_register_input',"success","用户名可用");
							$("#register_submit_btn").attr("ajax_name","success");
						}else{
							show_validate_Msg('#username_register_input',"error",result.extend.va_msg);
							$("#register_submit_btn").attr("ajax_name","error");
						}
					}
				});
			}else{
				$.ajax({
					url:'${APP_PATH}/checkTName',
					data:{'tUsername':username},
					type:"POST",
					success:function(result){
						if(result.code==100){
							show_validate_Msg('#username_register_input',"success","用户名可用");
							$("#register_submit_btn").attr("ajax_name","success");
						}else{
							show_validate_Msg('#username_register_input',"error",result.extend.va_msg);
							$("#register_submit_btn").attr("ajax_name","error");
						}
					}
					
				});
			}
			
		});
	
		//提交校验
		$('#register_submit_btn').click(function(){
			function validate_register_form(){
				var passwordC=$('#password_confirm_input').val();
				var password=$('#password_register_input').val();
				//密码为6-18为中英文组合，小写字母
				var regPassword=/^[a-z0-9]{6,16}$/;
				var name=$('#name_register_input').val();
				//名字为2-5位中文或者3-16位英文
				var regName=/(^[a-zA-Z_-]{3,16})|(^[\u2E80-\u9FFF]+){2,5}/;
				if(!regPassword.test(password)){
					show_validate_Msg("#password_register_input","error","密码为6-16位小写英文和数字组合");
					return false;
				}else{
					show_validate_Msg("#name_register_input","success","");
				};
				if(!regName.test(name)){
					//alert("用户名可以为2-5位中文或六到2-16英文");
					show_validate_Msg("#name_register_input","error","用户名可以为2到5位中文或3到16位英文组合");
					return false;
				}else{
					show_validate_Msg("#name_register_input","success","");
				};	
				
				if(password==passwordC){
					show_validate_Msg("#password_confirm_input","success","");
				}else{
					show_validate_Msg("#password_confirm_input","error","两次输入密码要一致");
					return false;
				};
				return true;
			}
			//未通过表单校验
			if(!validate_register_form()){
				return false;
			}
			//为通过用户名校验
			if($('#register_submit_btn').attr('ajax_name')=="error"){
				return false;
			}
			
			if($('#student_register_choice').is(":checked")){
				$.ajax({
					url:'${APP_PATH}/registerStudent',
					data:$('#register_form').serialize(),
					type:"POST",
					success:function(result){
						if(result.code==100){
							alert("恭喜学生注册成功！");
							window.location.href="/edu-system";
						}else{
							//显示失败信息
							if(undefined != result.extend.errorFiledMap.sUsername){
								show_validate_Msg("#username_register_input","error",result.extend.errorFiledMap.sUsername);
							}
							if(undefined != result.extend.errorFiledMap.sPassword){
								show_validate_Msg("#password_register_input","error",result.extend.errorFiledMap.sPassword);
							}	
							if(undefined != result.extend.errorFiledMap.sName){
								show_validate_Msg("#name_register_input","error",result.extend.errorFiledMap.sName);
							}
							
							
						}
					}
				});
			}else{
				$.ajax({
					url:'${APP_PATH}/registerTeacher',
					data:$('#register_form').serialize(),
					type:"POST",
					success:function(result){
						if(result.code==100){
							alert("恭喜老师注册成功！");
							window.location.href="/edu-system";
						}else{
							//显示失败信息
							if(undefined != result.extend.errorFiledMap.tUsername){
								show_validate_Msg("#username_register_input","error",result.extend.errorFiledMap.tUsername);
							}
							if(undefined != result.extend.errorFiledMap.tPassword){
								show_validate_Msg("#password_register_input","error",result.extend.errorFiledMap.tPassword);
							}	
							if(undefined != result.extend.errorFiledMap.tName){
								show_validate_Msg("#name_register_input","error",result.extend.errorFiledMap.tName);
							}
							
						}
					}
				});
			}
		});
		
		
		$('#login_submit_btn').click(function(){
			judge_login();
			if($('#student_login_choice').is(":checked")){
				$.ajax({
					url:"${APP_PATH}/loginStudent",
					data:$('#login_form').serialize(),
					type:"POST",
					success:function(result){
						if(result.code==100){
							//添加session
							var studentString=JSON.stringify(result.extend.student);
							$.session.set('student',studentString);
							
							//跳转学生页
							alert('登陆成功，跳转学生页面');
							window.location.href="listStudent";
							
						}else{
							show_validate_Msg('#password_login_input',"error",result.extend.va_msg);
						}
					}
				});
			}else{
				$.ajax({
					url:"${APP_PATH}/loginTeacher",
					data:$('#login_form').serialize(),
					type:"POST",
					success:function(result){
						if(result.code==100){
							//添加session
							var teacherString=JSON.stringify(result.extend.teacher);
							$.session.set('teacher',teacherString);
							
							//跳转学生页
							alert('登陆成功，跳转老师页面');
							window.location.href="listTeacher";
							
						}else{
							show_validate_Msg('#password_login_input',"error",result.extend.va_msg);
						}
					}
				});
				
			}
		});
	</script>
</body>
</html>