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
<title><s:property value="VO.currCorporation"/></title>
<link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/admin.css" />
<script type="text/javascript" src="<%=basePath %>js/data/annountment.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/admin.js"></script>
<script type="text/javascript">	
	var top = document.documentElement.clientHeight/2;
	var left = document.documentElement.clientWidth/2-170;
	var loadDiv = "<div id='loadDiv' style='position: absolute; top:200px; left:"+left+"px;'><img src='../img/loading.gif'></div>";
	document.write(loadDiv);
	document.onreadystatechange = load; //监听文档加载
	function load(){
		if(document.readyState == 'complete')	//文档加载状态
		{
			var load = document.getElementById("loadDiv");
			load.setAttribute("style", "display:none;");
			var allContent = document.getElementById("allContent");
			allContent.setAttribute("style", "");
		}

	};	
</script>
</head>
<style type="text/css">
header{
	width: 100%;
	position: fixed;
	top: 0px;
	height: 60px;
	z-index:1;
	background: #000000;
}
</style>
<body style="padding: 0; margin: 0; overflow: initial;">
	<div id="allContent" style="display:none;">
	<!-- ----------------------------------------- 隐藏信息开始------------------------------------------------------------------  -->
	<span id="currCorporation" style="display:none;"><s:property value="annoVO.currCorporation"/></span>
	<input id="queryName" readonly="true"  value="<s:property value="annoVO.queryName"/>" style="display: none;">
	<input id="querySort" readonly="true"  value="<s:property value="annoVO.querySort"/>" style="display: none;">
	<input id="queryStartTime" readonly="true"  value="<s:property value="annoVO.queryStartTime"/>" style="display: none;">
	<input id="queryEndTime" readonly="true"  value="<s:property value="annoVO.queryEndTime"/>" style="display: none;">
	<input type="text" id="currPageNone" style="display: none;" value='<s:property value="annoVO.currPage"/>'>

	
	<!-- ----------------------------------------- 隐藏信息结束------------------------------------------------------------------  -->
	<jsp:include page="/header.jsp" flush="true"></jsp:include>
	
	
	<!-- -------------------------------------------------主体内容-----------------------------------------------------            -->
	
	<div class="wrapper">
			<!-- 侧边栏 -->
			<jsp:include page="/corporationSideNav.jsp" flush="true"></jsp:include>
			<article class="info-an">
				<section class="form-show">
					<div class="select-large">
						<input type="text" placeholder="请输入公告名" id="queryNameText" value='<s:property value="annoVO.queryName"/>'/>
						<span>从</span>
						<s:if test="annoVO.queryStartTime==''">
							<input type="text" value="0000-00-00"  id="datetimeStart" readonly="true"/>
						</s:if>
						<s:else>
							<input type="text" value="<s:property value="annoVO.queryStartTime"/>"  id="datetimeStart" readonly="true"/>
						</s:else>
						<span>到</span>
						<s:if test="annoVO.queryEndTime==''">
							<input type="text" value="9999-99-99"  id="datetimeEnd" readonly="true"/>
						</s:if>
						<s:else>
							<input type="text"  value="<s:property value="annoVO.queryEndTime"/>" id="datetimeEnd" readonly="true"/>
						</s:else>
					     <input onclick="queryAnnouncement()" type="submit" onclick="" value="搜索"/>
					</div>
					<div class="announment-box">
						<ul class="announmenet-content">
							<p class="announment">通知公告</p>
							
							<s:iterator value="annoVO.announcement" id="list">
								<li style="cursor: pointer;" onclick="detailsAnnouncement(this)" class="annount-cot-list " id="<s:property value="#list.announcement_id"/>" data-toggle="modal" data-target="#myModal-annount">
									<div class="annount-issuer"><span><s:property value="#list.announcement_author"/></span><i><s:property value="#list.announcement_gmt_create"/></i></div>
									<div class="annount-context hasImg">
										<a class="annount-title"><s:property value="#list.announcement_name"/></a>
										<p class="annount-text"><s:property value="#list.announcement_content"/></p>
									</div>
									<s:if test="#list.announcement_image!=''">
									<a class="annount-img-box"><img src="<%=basePath %>/manager/apply_downloadImg?fileDirc=announcementImage&filename=<s:property value="#list.announcement_image"/>" class="annount-img"></a>
									</s:if>
								</li>
							</s:iterator>
						</ul>
					</div>
				<div class="page-go">共有<span><s:property value="annoVO.totalSize"/></span>条记录
					<span>共<span id="totalPage"><s:property value="annoVO.totalPage"/></span>页</span>
					<input type="text" id="currPage" value='<s:property value="annoVO.currPage"/>'><a class="go" onclick="jumpToPage()">跳转</a>
					<span><a class="go" onclick="indexPage()">首页</a><a class="go" onclick="lastPage()">上一页</a><a class="go" onclick="nextPage()">下一页</a><a class="go" onclick="finalPage()">末页</a></span></div>
				</section>
			</article>
		</div>
		<!--annountment模态框 start-->
		<div class="modal " id="myModal-annount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">通知公告</h4>
					</div>
			      <div class="modal-body" style="margin:0 auto;">
					 <div id="detailsAnnouncement" style="display:none;">
						<span id="model_announcement_name" class="annount-allText-title"></span>
						<div class="annount-detail-info">
							<span id="model_announcement_author"></span>
							<span id="model_announcement_gmt_create"></span>
						</div>
						<div class="annount-detail-img" id="img-upload">
							<img src="img/annount-img.jpg.png" id="detalis_img">
						</div>
						<div class="annount-allText" id="model_announcement_content">
						</div>
						<div class="anount-text-file">
							<a href="#" class="file-download" id="model_announcement_files">附件下载</a>
						</div>
					 </div>
					<div style="margin-left: 300px;" id="loadingDiv">
						<img src="<%=basePath %>img/loading.gif">
					</div>
				</div>
			</div>

		</div>
		<!--管理社团模态框 end-->
			
		<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>

		<script type="text/javascript" src="<%=basePath %>js/Nav_infoAndAdmin_checkbox.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/data/annountment.js"></script>
		<script>
			$('#datetimeStart').datetimepicker({
				language: 'zh-CN', //显示中文
				format: 'yyyy-mm-dd', //显示格式
				minView: "month", //设置只显示到月份
				initialDate: new Date(), //初始化当前日期
				autoclose: true, //选中自动关闭
				todayBtn: true //显示今日按钮
			})
			$('#datetimeEnd').datetimepicker({
				language: 'zh-CN', //显示中文
				format: 'yyyy-mm-dd', //显示格式
				minView: "month", //设置只显示到月份
				initialDate: new Date(), //初始化当前日期
				autoclose: true, //选中自动关闭
				todayBtn: true //显示今日按钮
			})
		</script>
		
	
	
	</div>


	</div>
		<script type="text/javascript" src="<%=basePath %>js/jquery.min.js" ></script>
	    <script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js" ></script>
</body>
</html>