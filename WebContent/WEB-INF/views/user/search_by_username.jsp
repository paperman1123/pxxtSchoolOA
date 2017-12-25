<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!---------------------------------------------------------------------------------------------------->

<!---------------------------------------------------------------------------------------------------->
<title>用户列表</title>
</head>
		<script type="text/javascript" src="<%=basePath%>js/user/userManager.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/user/toastr.js"></script>
		<link rel="stylesheet"
		href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>css/htBackStage.css" />
		<script type="text/javascript" src="<%=basePath%>js/user/user.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/user/load.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/user/delete_user.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/user/search_user.js"></script>
<body>
	<jsp:include page="/navbar.jsp" flush="true"></jsp:include>

	<!--  -->
	<!--  -->
	<div style="margin: 50px 0 0 260px; width: calc(100% - 260px);">
		<span id="span_sqrt" style="display: none;"><s:property
				value="page_list_corInfo.search.sqrt" /></span>
		<!--  -->
		<span id="span_sqrt_sc" style="display: none;"><s:property
				value="page_list_corInfo.search.sqrt_sc" /></span>
		<!--  -->
		<!--  -->
		<table style="width: 95%; margin: 0 auto; text-align: center;">
			<tr>
				<td style="height: 50px;"><%-- <button class="btn btn-primary"
						onclick="search_corInfo()"
						style="float: right; margin: 8px 0 0 0;">检索</button> <input
					type="text" class="form-control" id="input_name"
					value="<s:property
				value="page_list_corInfo.search.name" />"
					style="width: 200px; float: right; margin: 8px 10px 8px 50px;" /> --%>
					<form class="search" action="user_findByUser_name" method="post">
					<input id="text" type="text" placeholder="计算机" name="user_username"/>
					<input type="submit" value="检索" id="btn"/>
					
					
				</form>

				</td>
			</tr>
		</table>
		
				<s:if
				test="#request.oneUser == null || #request.oneUser.size() == 0">
						没有该用户
				</s:if>
		<s:else>
		<table id="table"
			style="width: 95%; margin: 20px auto; text-align: center;"
			class="table-bordered">
			<tr>
				<th>姓名</th>
				<th>昵称</th>
				<th>账号</th>
				<th>出生日期</th>
				<th>签名</th>
				<th>性别</th>
				<th>手机号</th>
				<th>地址</th>
				<th>角色</th>
				<th colspan="2">编辑</th>
			</tr>
			<s:iterator value="#request.oneUser">
				<tr>
								<td>${user_name }</td>
								<td>${user_nickname }</td>
								<td>${user_username }</td>
								<td>${user_birthday }</td>
								<td>${user_introduce }</td>
								<td>${user_sex }</td>
								<td>${user_telephone }</td>
								<td>${user_address }</td>
								<td>${user_role }</td>
				
					<td><button class="btn btn-primary" style="margin: 5px;"
							value="${user_id}" onclick="updateUser(this)"
										class="btn1" data-toggle="modal"
										data-target="#useredit">修改</button>
					</td>
					<td>
						<button class="btn btn-danger" style="margin: 5px;"
							id="${user_id}"
													data-toggle="modal" data-target="#model_delete_userInfo"
													onclick="javascript:delete_user_id=this.id;">删除</button>
					</td>
				</tr>

			</s:iterator>
		</table>
		</s:else>
		
		
	<div style="margin: 0 auto; width: 400px; text-align: center;">
			<button class="btn btn-primary" onclick="search_corInfo(1)">首页</button>
			<s:if test="page_list_userInfo.HavePrePage">
				<button class="btn btn-primary"
					onclick="search_corInfo(<s:property value="page_list_userInfo.pageIndex-1" />)">上一页</button>
			</s:if>
			<s:else>
				<button class="btn btn-primary"
					onclick="javascript:toastr.warning('已经是第一页了');">上一页</button>
			</s:else>
			<s:if test="page_list_userInfo.HaveNextPage">
				<button class="btn btn-primary"
					onclick="search_corInfo(<s:property value="page_list_userInfo.pageIndex+1" />)">下一页</button>
			</s:if>
			<s:else>

				<button class="btn btn-primary"
					onclick="javascript:toastr.warning('已经是最后一页了');">下一页</button>
			</s:else>
			<button class="btn btn-primary"
				onclick="search_corInfo(<s:property value="page_list_userInfo.totalPages" />)">尾页</button>
		</div>
		<!------------------------------------------------------------------------------------------------------------------->
		<div style="margin: 20px auto 20px; width: 200px; text-align: center;">
			第
			<s:property value="page_list_userInfo.pageIndex" />
			页<br>共
			<s:property value="page_list_userInfo.totalPages" />
			页<br><%-- 共
			<s:property value="page_list_userInfo.totalRecords" />
			条记录 --%>
		</div>

</body>

<!-- 删除的莫太框 -->
		<div class="modal fade" id="model_delete_userInfo">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">确认信息</h4>
			</div>
			<div class="modal-body">
				<h4 id="h4_delete">删除此用户？</h4>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" onclick="delete_user()">删除</button>
				<button class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 修改的模态框 -->
		<div class="modal fade" id="useredit" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改用户</h4>
					</div>

					<form action="user_save" method="post"
						enctype="multipart/form-data">
						<div class="modal-body">
								<input name="user_id" id="user_id_update" type="text"
									   style="display: none;" readonly="true"> 
							用户姓名:<input
									type="text" name="user_name" id="user_name_update"></br> </br>
							用户昵称:<input type="text" name="user_nickname"
									id="user_nickname_update"></br> </br>
						           用户账号:<input type="text"
									name="user_username" id="user_username_update"></br> </br> 
						          用户密码:<input
									type="password" name="user_password" id="user_password_update"></br> </br> 
						           出生日期:<input type="text" name="user_birthday"
									id="user_birthday_update"></br> </br> 
						           用户签名:<input type="text"
									name="user_introduce" id="user_introduce_update"></br> </br> 
							用户性别：<select name="user_sex">
								   		<option  value="1" id="user_sex_man">男</option>
								   		<option  value="0" id="user_sex_woman">女</option>
								   </select></br> </br> 
							<!-- 用户性别:<input type="radio" name="user_sex" value="1"/>男
								   <input type="radio" name="user_sex" value="0"/>女<br/> -->
							<!-- <input type="radio" name="user_sex" id="user_sex_man" value="1">男 -->
								   <!-- <input type="radio" name="user_sex" id="user_sex_woman" value="0">女</br> </br> --> 
						           手机号码:<input type="text" name="user_telephone"
									id="user_telephone_update"></br> </br> 
							用户地址:<input type="text"
								    name="user_address" id="user_address_update"></br> </br> 
						           用户角色:<input
									type="text" name="user_role" id="user_role_update"></br> </br>
							用户头像:<input type="file" name="logo"  id="user_logo_update">
							<!-- <img  id="user_logo_show" alt="" src="" style="width: 300px; height:300px;"> -->
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<%-- <submit class="btn btn-primary">确定</submit> --%>
							<input type="submit" class="btn btn-primary" value="确定">
						</div>
					</form>
				</div>
			</div>
		</div>



<!--添加用户的模块-->
<!-- //添加的模态框 -->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="useradd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加用户</h4>
					</div>

					<form action="user_save" method="post"
						enctype="multipart/form-data" name="form1"
						onsubmit="return check()">
						<div class="modal-body">
							用户姓名:<input 
									type="text" name="user_name"></br> </br>
						          用户昵称:<input 
						            type="text" name="user_nickname"></br> </br>
						         <!--    用户性别:<input 
						            type="radio" name="user_sex">男
						            <input 
						            type="radio" name="user_sex">女</br> </br> -->
						            
						          用户账号:<input
								    type="text" name="user_username"></br> </br> 
						          用户密码:<input
								    type="password" name="user_password"></br> </br> 
						          出生日期:<input
								    type="text" name="user_birthday"></br> </br> 
						          用户签名:<input
								    type="text" name="user_introduce"></br> </br> 
							用户性别：<select name="user_sex">
								   		<option  value="1">男</option>
								   		<option  value="0">女</option>
								   </select></br> </br> 
						        <!--   用户性别:	<input
								    type="radio" name="user_sex" value="1">男 
								 	 <input
								    type="radio" name="user_sex" value="0">女</br> </br>  -->
						          手机号码:<input
								    type="text" name="user_telephone"></br> </br> 
							用户地址:<input
								    type="text" name="user_address"></br> </br> 
						           用户角色:<input
								    type="text" name="user_role"></br> </br> 
					                      用户头像:<input 
					                type="file" name="logo">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<input type="submit" class="btn btn-primary" value="确定">
						</div>
					</form>
				</div>
			</div>
		</div>

</html>