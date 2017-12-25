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
<!--------------------------------------------------------------------------------->
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<!--------------------------------------------------------------------------------->
<%-- <link rel="stylesheet" href="<%=basePath%>css/bootstrap-select.min.css"> --%>
<%-- <script type="text/javascript" src="<%=basePath%>js/bootstrap-select.js"></script> --%>
<!--------------------------------------------------------------------------------->
<link rel="stylesheet"
	href="<%=basePath%><%=basePath%>css/navbar/chartist-custom.css">
<link rel="stylesheet" href="<%=basePath%>css/navbar/main.css">
<link rel="stylesheet"
	href="<%=basePath%>css/navbar/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>css/navbar/style.css">
<%-- <link rel="stylesheet" href="<%=basePath%>css/table.css"> --%>
<!--------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------->
<%-- <link rel="stylesheet" href="<%=basePath%>css/flat/green.css" /> --%>
<%-- <script type="text/javascript" src="<%=basePath%>js/icheck.js"></script> --%>
<!--------------------------------------------------------------------------------->
<link rel="stylesheet" href="<%=basePath%>css/toastr.css" />
<script type="text/javascript" src="<%=basePath%>js/toastr.js"></script>
<!--------------------------------------------------------------------------------->
<title>Insert title here</title>
</head>
<body>
	<!--顶部-->
	<%-- <div
		style="background-color: white; height: 125px; width: 100%; z-index: 10; position: fixed; top: 0; left: 0;">
		<img src="<%=basePath%>img/logo.jpg" class="img-responsive logo">
	</div> --%>

	<div id="wrapper" style="position: fixed; top: 0; left: 0;">
		<!--左侧-->
		<div id="sidebar-nav" class="sidebar"
			style="margin: 0 0 0 0; position: fixed; top: 0; left: 0;">
			<div
				style="color: white; font-size: 25px; margin: 0 0 20px 0; text-align: center; padding: 0 50px 0 0;">
				管理员
				<%-- <s:property value="#session.Admin.admin_account" /> --%>
			</div>
			<div class="sidebar-scroll">

				<ul class="nav">
        
					<li><s:if test="page=='skipToAdd'||page=='skipToDelete'">
							<a href="#scarousel" data-toggle="collapse"
								class="active">
						</s:if> <s:else>
							<a href="#scarousel" data-toggle="collapse" class="collapsed">
						</s:else> <i class="lnr lnr-rocket"></i><span>社团管理</span><i
						class="icon-submenu lnr lnr-chevron-left"></i></a> <s:if
							test="page=='skipToAdd'||page=='skipToDelete'">
							<div id="scarousel" class="collapse in">
						</s:if> <s:else>
							<div id="scarousel" class="collapse ">
						</s:else>


						<ul class="nav">
							<li>
									<a href="<%=basePath%>corInfo/corInfo_page_list_corInfo?page_list_corInfo.pageIndex=1">社团列表</a>
							</li>
							<li>
									<a href="<%=basePath%>corInfo/corInfo_page_list_checkCorInfo?page_list_corInfo.pageIndex=1&searchCorInfoList.sqrt=corporation_gmt_create&searchCorInfoList.sqrt_sc=asc&searchCorInfoList.check=0&searchCorInfoList.name=
">社团审核</a>
							</li>
							<li>
									<a href="<%=basePath%>corInfo/corInfo_page_list_message?page_list_corInfo.pageIndex=1">审核信息</a>
							</li>
						</ul>
			</div>
			</li>

			<!---------------------------------------------------------------------------------------------------------------------------------->
			
			<li><s:if
					test="page=='page_create_news'||page=='page_list_category'||page=='page_create_category'||page=='page_list_news' ">
					<a href="#snews" data-toggle="collapse" class="active">
				</s:if> <s:else>
					<a href="#snews" data-toggle="collapse" class="collapsed">
				</s:else> <i class="lnr lnr-pencil"></i> <span>用户管理</span> <i
				class="icon-submenu lnr lnr-chevron-left"></i></a> <s:if
					test="page=='page_create_news'||page=='page_list_category'||page=='page_create_category'||page=='page_list_news'">
					<div id="snews" class="collapse in">
				</s:if> <s:else>
					<div id="snews" class="collapse">
				</s:else>


				<ul class="nav">
					<li>
						<a href="<%=basePath%>user_page_list_userInfo">用户列表</a>
					</li>
				</ul></li>
	<!---------------------------------------------------------------------------------------------------------------------------------->
	<li>
		<a href="<%=basePath%>user_logout"><i class="lnr lnr-exit"></i><span>退出系统</span></a>
		<!-- <a href="#" onclick="logout();">退出</a> -->
	</li>
	</ul>
	</div>
	</div>
	</div>
	<!--------------------------------------------------------------------------------------------->
	<!--------------------------------------------------------------------------------------------->
	<!--------------------------------------------------------------------------------------------->
	<!-- <!-- <div id="div_load"></div>
	<div id="cloth"></div> --> -->
	<!--------------------------------------------------------------------------------------------->
	<!--------------------------------------------------------------------------------------------->
	<!--------------------------------------------------------------------------------------------->
</body>
<script>
	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_flat-green',
			radioClass : 'iradio_flat-green'
		});
	});
</script>
</html>