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
<link rel="stylesheet" href="<%=basePath %>css/user-info.css" />
<script type="text/javascript" src="<%=basePath %>js/data/dataAnnoMan.js"></script>
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
.sort:hover{
	background-color: black;
	cursor: pointer;
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
			
		<article class="info">
			<!-- 顶部 -->
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
					<div class="select-small">
						<button type="button" class="btn btn-primary  btn-sm" data-toggle="modal" data-target="#announceModal"><span class="glyphicon glyphicon glyphicon-plus"></span>发布</button>
					</div>
				</section>
			<!-- 中部 -->
			<!-- 表单 -->	
				<div class="form">
					<table class="table table-striped table-hover">
							<thead class="Table-header">
								<tr>
									<th>公告名</th>
									<th>公告发布人</th>
									<th onclick="changeSort()" class="sort">公告发布时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="annoVO.announcement" id="list">
								<tr>
									<th><s:property value="#list.announcement_name"/></th>
									<th><s:property value="#list.announcement_author"/></th>
									<th><s:property value="#list.announcement_gmt_create"/></th>
									<th><button onclick="detailsAnnouncement(this)" data-toggle="modal" data-target="#detailsModal" class="btn btn-primary btn-sm" id="<s:property value="#list.announcement_id"/>">查看详情</button> 
										<button onclick="deleteAnnouncement(this)" class="btn btn-danger btn-sm" id="<s:property value="#list.announcement_id"/>">删除</button>
									</th>	
								</tr>
							</s:iterator>
							</tbody>
						</table>
				</div>	
			<!-- 底部 -->	
				<div class="page-go">共有<span><s:property value="annoVO.totalSize"/></span>条记录
					<span>共<span id="totalPage"><s:property value="annoVO.totalPage"/></span>页</span>
					<input type="text" id="currPage" value='<s:property value="annoVO.currPage"/>'><a class="go" onclick="jumpToPage()">跳转</a>
					<span><a class="go" onclick="indexPage()">首页</a><a class="go" onclick="lastPage()">上一页</a><a class="go" onclick="nextPage()">下一页</a><a class="go" onclick="finalPage()">末页</a></span></div>
			</article>	
	
	</div>


<!--------------------------------------------------------------------发布模态框开始--------------------------------------------------------------  -->

<div class="modal fade" id="announceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">发布公告</h4>
      </div>
      <div class="modal-body" style="margin:0 auto;">
			<div class="bumen">
			     <label class="label1">公告名:</label>
                 <input type="text" id="announcement_name" name="announcement_name"/>
			</div>
			<div class="bumen">
			    <label class="label1">公告配图：</label>
			    <div onclick="chooseImg()" class="img-upload" style="cursor: pointer;">
			 	 	<img id="showImg" alt="" src="" style="height: 150px; width:150px;">
			  		<input type="file" onchange="showImg()" id="announcement_image" name="announcement_image" style="display: none;">
				</div>
			 </div>
			 <div class="bumen">
			 	<label class="label1">公告内容：</label>
			 	<textarea class="form-control textarea" rows="6" id="announcement_content" name="announcement_content"></textarea>
			 </div>	
			 <div>
			 	<button onclick="chooseFile()" class="btn btn-warning btn-sm">上传附件</button>
			 	<input type="file" onchange="showFileName(this)" id="announcement_files" name="announcement_files" style="display: none;">
			 	<span id="showFilename"></span>
			 </div>
			 <div style="line-height:30px; height: 30px; text-align:center; width: 100%;"><div style="background: #99FFCC; margin-top: 5px; line-height:30px; height: 30px; border-radius: 10px; display: none;" id="loaded"><span style="margin:0 auto;" id="loadNum"></span></div></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addAnnouncement()">发布</button>
      </div>
    </div>
  </div>
</div>
		
		
		
		


<!--------------------------------------------------------------------发布模态框结束--------------------------------------------------------------  -->



<!--------------------------------------------------------------------查看详情--------------------------------------------------------------  -->

<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">公告详情</h4>
      </div>
      <div class="modal-body" style="margin:0 auto;">
      	<div id="detailsAnnouncement" style="display:none;">
			<div class="bumen">
			     <label class="label1">公告名:</label>
                 <input type="text" id="details_announcement_name" readonly="true" name="announcement_name"/>
			</div>
			<div class="bumen">
			    <label class="label1">公告配图：</label>
			    <div  class="img-upload" id="img-upload">
			 	 	<img id="detalis_img"  style="height: 150px; width:150px;">
				</div>
			 </div>
			 <div class="bumen">
			 	<label class="label1">公告内容：</label>
			 	<textarea class="form-control textarea" readonly="true" rows="6" id="details_sannouncement_content" name="announcement_content"></textarea>
			 </div>	
			 <div>
			 	<a id="details_announcement_file"><button class="btn btn-warning btn-sm">下载附件</button></a>
			 </div>
		</div> 
		<div style="margin-left: 100px;" id="loadingDiv">
			<img src="<%=basePath %>img/loading.gif">
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="removeLoading()" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
		
		
</div>


<!--------------------------------------------------------------------查看详情结束--------------------------------------------------------------  -->



	<script type="text/javascript" src="<%=basePath %>js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/admin.js"></script>
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
			$('#datetimepicker').datetimepicker('update');
		</script>
</body>
</html>