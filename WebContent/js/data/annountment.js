function detailsAnnouncement(event)
{	
	var loadingDiv = document.getElementById("loadingDiv");
	loadingDiv.style.display="";
	var detailsAnnouncement = document.getElementById("detailsAnnouncement");
	detailsAnnouncement.style.display="none";
	var detalis_img = document.getElementById("detalis_img");
	var img_upload = document.getElementById("img-upload");
	img_upload.removeChild(detalis_img);
	ajaxDetailsAnnouncement("/corporation/manager/manager_getAnnouncementById",event.id);
}
function ajaxDetailsAnnouncement(url , announcement_id)
{
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlHttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var curCorporation = document.getElementById("currCorporation");
	var formData = new FormData();
	formData.append("member_corporation", curCorporation.innerHTML);
	formData.append("announcement_id", announcement_id);
	xmlHttp.open("POST", url, true);
	xmlHttp.send(formData);
	xmlHttp.onreadystatechange = ajaxDetailsAnnouncementBack;
	
}

function ajaxDetailsAnnouncementBack()
{	
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var result = xmlHttp.responseText;
		result = JSON.parse(result);
		var loading = document.getElementById("loadingDiv");
		document.getElementById("model_announcement_name").innerHTML = result.announcement_name;
		document.getElementById("model_announcement_author").innerHTML  =  result.announcement_name;
		document.getElementById("model_announcement_content").innerHTML  =  result.announcement_content;
		document.getElementById("model_announcement_gmt_create").innerHTML = result.announcement_gmt_create;
		
		document.getElementById("model_announcement_files").href  =  "/corporation/manager/apply_downloadImg?" +
															"fileDirc=announcementFile&filename="+result.announcement_files;
		var img = document.createElement("img");
		img.setAttribute("src", "/corporation/manager/apply_downloadImg?" +
								"fileDirc=announcementImage&filename="+result.announcement_image);
		img.style.width = "320px";
		img.style.height = "240px";
		img.id="detalis_img";
		var img_upload = document.getElementById("img-upload");
		var detailsAnnouncement = document.getElementById("detailsAnnouncement");
		img_upload.appendChild(img);
		loading.style.display="none";
		detailsAnnouncement.setAttribute("style", "");
		
	}
}



function removeLoading()
{
	var loadingDiv = document.getElementById("loadingDiv");
	loadingDiv.style.display="";
	var detailsAnnouncement = document.getElementById("detailsAnnouncement");
	detailsAnnouncement.style.display="none";
}


function queryAnnouncement()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryNameText");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var querySort = document.getElementById("querySort").value;
	window.location="/corporation/manager/manager_skipToShowAnno?" +
			"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
					"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage=1";
}



function indexPage()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryName");
	var datetimeStart = document.getElementById("queryStartTime");
	var datetimeEnd = document.getElementById("queryEndTime");
	var totalPage = document.getElementById("totalPage").innerHTML;
	var currPageNone = document.getElementById("currPageNone").value;
	var querySort = document.getElementById("querySort").value;
	window.location="/corporation/manager/manager_skipToShowAnno?" +
	"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
			"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage=1";
}

function nextPage()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryName");
	var datetimeStart = document.getElementById("queryStartTime");
	var datetimeEnd = document.getElementById("queryEndTime");
	var totalPage = document.getElementById("totalPage").innerHTML;
	var currPageNone = document.getElementById("currPageNone").value;
	var querySort = document.getElementById("querySort").value;
	if(currPageNone>=totalPage)
		{
		toastr.error("已经是最后一页");
		}
	else
		{
		currPageNone++;
		window.location="/corporation/manager/manager_skipToShowAnno?" +
		"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
				"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage="+currPageNone;
		}
	
	
}
function lastPage()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryName");
	var datetimeStart = document.getElementById("queryStartTime");
	var datetimeEnd = document.getElementById("queryEndTime");
	var totalPage = document.getElementById("totalPage").innerHTML;
	var currPageNone = document.getElementById("currPageNone").value;
	var querySort = document.getElementById("querySort").value;
	if(currPageNone<=1)
		{
			toastr.error("已经是第一页");
		}
	else
		{
		currPageNone--;
		window.location="/corporation/manager/manager_getAnnouncementByPage?" +
		"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
				"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage="+currPageNone;
		}
}

function finalPage()
{	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryName");
	var datetimeStart = document.getElementById("queryStartTime");
	var datetimeEnd = document.getElementById("queryEndTime");
	var totalPage = document.getElementById("totalPage").innerHTML;
	var currPageNone = document.getElementById("currPageNone").value;
	var querySort = document.getElementById("querySort").value;
	window.location="/corporation/manager/manager_skipToShowAnno?" +
	"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
			"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage="+totalPage;
}

function jumpToPage()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryName");
	var datetimeStart = document.getElementById("queryStartTime");
	var datetimeEnd = document.getElementById("queryEndTime");
	var totalPage = document.getElementById("totalPage").innerHTML;
	var currPageNone = document.getElementById("currPageNone").value;
	var querySort = document.getElementById("querySort").value;
	var currPage = document.getElementById("currPage").value;
	
	if(currPage>totalPage||currPage<"1")
		{
			toastr.error("不存在该页");
		}
	else
		{
	window.location="/corporation/manager/manager_skipToShowAnno?" +
	"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
			"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage="+currPage;
		}
}