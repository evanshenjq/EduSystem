<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<!-- web下的路径问题
不以/开始，以当前资源为路径
以/开始，找资源以服务器路径
 -->
<!-- 引入JQuery -->
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入Boostrap -->
  <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 用户新增模态框 -->
	<div class="modal fade" id="empsAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="empName_input" placeholder="empName">
			   	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">eMail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="eMail" id="eMail_input" placeholder="eMail">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">sex</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
						<input type="radio" name="sex" id="inlineRadio1" value="m"> 男
					</label>
					<label class="checkbox-inline">
					 	 <input type="radio" name="sex" id="inlineRadio2" value="f"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      	<select class="form-control" name="dId" id="depts_add">
						 <!-- 部门提交id -->
					</select>
			    </div>
			  </div>  
			  </form>
			  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emps_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 用户修改模态框 -->
	<div class="modal fade" id="empsUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" >用户修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			        <p class="form-control-static" id="empName_update_static"></p>
			   	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">eMail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="eMail" id="eMail_update" placeholder="eMail">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">sex</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
						<input type="radio" name="sex" id="inlineRadio1" value="m"> 男
					</label>
					<label class="checkbox-inline">
					 	 <input type="radio" name="sex" id="inlineRadio2" value="f"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      	<select class="form-control" name="dId" id="depts_update">
						 <!-- 部门提交id -->
					</select>
			    </div>
			  </div>  
			  </form>
			  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emps_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	

<!-- 搭建显示页面 -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
	<div>
	 <div class="col-md-4 col-md-offset-8">
	 <button class="btn btn-primary" id="emp_add_modal">新增</button>
	 <button class="btn btn-danger" id="emps_delete">删除</button>
	 </div>
	</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
		<table class="table table-hover" id="emps_table">
			<thead>
				<tr>
				<th>
					<input type="checkbox" id="checkAll"/>
				</th>
					<th>#</th>
					<th>empName</th>
					<th>sex</th>
					<th>eMail</th>
					<th>dept</th>
					<th>操作</th>
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
				url:"${APP_PATH}/emps",
				data:{'pn':pn},
				type:"GET",
				success:function(result){
					//1.解析json，显示员工数据
					build_emps_table(result);
					//2.解析显示分页信息
					build_pag_info(result);
					//3.解释显示分页条
					build_pag_nav(result);
				}
				
			});
			
		}
		
		function build_emps_table(result){
		
			//清空
			$("#emps_table tbody").empty();
			var emps=result.extend.page.list;
			$.each(emps,function(index,item){
				var empCheckBox=$("<td><input type='checkbox' class='check_item' /></td> ");
				var empIdTD = $("<td></td>").append(item.empId);
				var empNameTD = $("<td></td>").append(item.empName);
				var sexTD = $("<td></td>").append(item.sex=='m'?"男":"女");
				var eMailTD = $("<td></td>").append(item.eMail);
				var deptNameTD = $("<td></td>").append(item.department.depName);
				/*
				<button class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					  编辑
					</button>
				*/
				var editBut= $("<button></button>").addClass("btn btn-primary btn-sm update_btn")
				.append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
				//为编辑添加一个自定义属性
				editBut.attr("edit_id",item.empId);
				var deleBut= $("<button></button>").attr('id','emp_delete').addClass("btn btn-danger btn-sm delete_btn")
				.append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
				deleBut.attr('del_id',item.empId);
				var handleBut=$("<td></td>").append(editBut).append(" ").append(deleBut);
				//append返回原来元素
				$("<tr></tr>").append(empCheckBox)
				.append(empIdTD)
				.append(empNameTD)
				.append(sexTD)
				.append(eMailTD)
				.append(deptNameTD)
				.append(handleBut)
				.appendTo("#emps_table tbody");
				
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
	
		//点击新增，弹出模态框
		$("#emp_add_modal").click(function(){
			
			//重置模态框
			$("#empsAdd form")[0].reset();
			$("#empsAdd .help-block").text("");
			
			getDepts("#depts_add");
			$("#empsAdd").modal({
				backdrop:'static'
			});
		})
		
		//查出所有部门信息并显示在下拉列表中
		function getDepts(ele){
			//清空信息
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					//显示部门信息在下拉列表中
					$.each(result.extend.depts,function(){
						var dep=$("<option></option>").append(this.depName).attr("value",this.depId)
						dep.appendTo(ele);
					
					})
				}
			});
		}
		
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
		
		//对用户名进行校验
		$('#empName_input').change(function(){
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH}/check",
				data:"empName="+empName,
				type:"post",
				success:function(result){
					if(result.code==100){
						show_validate_Msg('#empName_input',"success","用户名可用");
						$("#emps_save_btn").attr("ajax_name","success");
					}else{
						show_validate_Msg('#empName_input',"error",result.extend.va_msg);
						$("#emps_save_btn").attr("ajax_name","error");
					}
				}
			});
		});
		
		
		//点击保存
		$("#emps_save_btn").click(function(){
			function validate_add_form(){
				var empName=$("#empName_input").val();
				var regName=/(^[a-z0-9_-]{3,16})|(^[\u2E80-\u9FFF]+){2,5}/;
				var eMail=$("#eMail_input").val();
				var regeMail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				//校验
				if(!regName.test(empName)){
					//alert("用户名可以为二到五位中文或六到十六位英文数字组合");
					show_validate_Msg("#empName_input","error","用户名可以为二到五位中文或六到十六位英文数字组合");
					
					return false;
				}else{
					show_validate_Msg("#empName_input","success","");
					
				};
				if(!regeMail.test(eMail)){
					//alert("请输出正确的邮箱");
					show_validate_Msg("#eMail_input","error","请输出正确的邮箱");
					return false;
				}else{
					show_validate_Msg("#eMail_input","success","");
				};
				return true;
			}
	
			//对数据进行前端校验
			if(!validate_add_form()){
				return false;
			}; 
			
			if($("#emps_save_btn").attr("ajax_name")=="error"){
				return false;
			} 
			
			
			$.ajax({
				url:"${APP_PATH}/emps.action",
				type:"POST",
				data:$("#empsAdd form").serialize(),
				success:function(result){
					//alert(result.msg);
					//对数据惊醒后端校验
					if(result.code==100){
						//员工保存成功，来到最后一页，显示刚才的数据
						$("#empsAdd").modal('hide');
						
						//发送ajax请求，来到最后一页
						to_page(records);
					}else{
						//显示失败信息
						if(undefined != result.extend.errorFiledMap.eMail){
							show_validate_Msg("#eMail_input","error",result.extend.errorFiledMap.eMail);
						}
						if(undefined != result.extend.errorFiledMap.empName){
							show_validate_Msg("#empName_input","error",result.extend.errorFiledMap.empName);
						}	
						
					}
					
				}
			});  
		}); 
		
		
		//弹出用户更新模态框(编辑)
		$(document).on("click",".update_btn",
			function(){
			//重置模态框
			$("#empsAdd form")[0].reset();
			$("#empsAdd .help-block").text("");
			
			
			//查询员工信息
			getEmp($(this).attr("edit_id"));
			//查出部门信息
			getDepts('#depts_update');
			//员工id传给更新按钮
			$('#emps_update_btn').attr("edit_id",$(this).attr("edit_id"));
			$("#empsUpdate").modal({
				backdrop:'static'
			});
			}		
		);
		
		//员工数据回显
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(result){
					var emp=result.extend.emp;
					$("#empName_update_static").text(emp.empName);
					$("#eMail_update").val(emp.eMail);
					$('input[name=sex]').val([emp.sex]);
					$('#depts_update').val([emp.dId]);
				}
				
			});
		}
		
		//更新按钮事件
		$('#emps_update_btn').click(
			function(){
				
				//邮箱校验
				var eMail=$("#eMail_update").val();
				var regeMail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				//校验
				if(!regeMail.test(eMail)){
					//alert("请输出正确的邮箱");
					show_validate_Msg("#eMail_update","error","请输出正确的邮箱");
					return false;
				}else{
					show_validate_Msg("#eMail_update","success","");
				};
				
				//发送ajax请求
				$.ajax({
					url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
					type:"PUT",
					data:$("#empsUpdate form").serialize(),
					success:function(result){
						alert("处理成功");
						//隐藏模态框
						$('#empsUpdate').modal('hide');
						//去到当前页，相当于刷新
						to_page(currentPage);
						
						
					}
				
				});
			}		
		);
		
		//删除单个员工
		$(document).on('click','#emp_delete',function(){
			//确认删除对话框
			var empName=$(this).parents("tr").find("td:eq(2)").text();
			//alert($(this).parents("tr").find("td:eq(1)").text());
			if(confirm("确认删除【"+empName+"】??")){
				//确认后发送ajax请求
				$.ajax({
					url:"${APP_PATH}/emp/"+$(this).attr("del_id"),
					type:"DELETE",
					success:function(result){
						to_page(currentPage);
						alert(result.msg);
					}
				});
			}
		});
		
		//完成全选
		$('#checkAll').click(
			function(){
				
				$('.check_item').prop('checked',$(this).prop("checked"));
			}		
		);
		
		//点击删除键
		$('#emps_delete').click(
				//得到所有选中的emp名字
				function(){
					var name="";
					var del_idstr="";
					$.each($(".check_item:checked"),function(){
						name+=$(this).parents("tr").find("td:eq(2)").text()+",";
						//组装员工id字符串
						del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
					});
					//$(".check_item:checked").parents("tr").find("td:eq(3)").text();
					name=name.substring(0, name.length-1);
					del_idstr=del_idstr.substring(0, del_idstr.length-1);
					if(confirm("确定删除【"+name+"】吗？？")){
						$.ajax({
							url:"${APP_PATH}/emp/"+del_idstr,
							type:"DELETE",
							success:function(result){
								alert(result.msg);
								to_page(currentPage);
							}
						});
					} 
				}	
		);
		
		
	</script>

</body>
</html>