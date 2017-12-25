function chooseImg()
{
	var announcement_image = document.getElementById("announcement_image");
	announcement_image.click();	
}

function showImg(){
	var announcement_image = document.getElementById("announcement_image");
	var url = window.URL.createObjectURL(announcement_image.files[0]);
	var showImg = document.getElementById("showImg");
	var f = document.getElementById("announcement_image").value;
	 if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(f))
     {
		    if (announcement_image.outerHTML) {
		    	announcement_image.outerHTML = announcement_image.outerHTML;
	         } else { // FF(包括3.5)
	        	 announcement_image.value = "";
	         }
		    toastr.error("请选择图片格式！");
     }
	 else
	 {
		 showImg.src = url;	 
	 }
	
}


function chooseFile()
{
	var announcement_files = document.getElementById("announcement_files");
	announcement_files.click();	
}

function showFileName(event){
	var showFilename = document.getElementById("showFilename");
	showFilename.innerHTML=event.files[0].name;
}

var xmlHttp;
function addAnnouncement()
{
	ajaxAddAnnouncement("/corporation/manager/manager_addAnnouncement");
}

function ajaxAddAnnouncement(url)
{
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlHttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var formData = new FormData();
	var announcement_name =  document.getElementById("announcement_name");
	var announcement_image =   document.getElementById("announcement_image");
	var announcement_content = document.getElementById("announcement_content");
	var announcement_files = document.getElementById("announcement_files");
	formData.append("announcement_name", announcement_name.value);
	if(announcement_image.value!="")
		{
			formData.append("announcement_image", announcement_image.files[0]);
		}
	formData.append("announcement_content", announcement_content.value);
	formData.append("member_corporation", document.getElementById("currCorporation").innerHTML);
	if(announcement_files.value!="")
		{
			formData.append("announcement_files", announcement_files.files[0]);
		}

	xmlHttp.open("POST", url, true);
	
	//	在send()之前调用
	xmlHttp.upload.onprogress = function(evt){
		var loaded  = evt.loaded; //获得已经上传的文件大小
		var tot = evt.total;	//获得总文件大小
		var per = Math.floor(100*loaded/tot);
		document.getElementById("loaded").setAttribute("style", "line-height:30px; background: #99FFCC; margin-top: 5px; height: 30px; border-radius: 10px; width: "+per+"%;");
		document.getElementById("loadNum").innerHTML=per+"%";
	 }
	
	
	xmlHttp.send(formData);
	xmlHttp.onreadystatechange = ajaxAddBack;

}

function ajaxAddBack()
{
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		toastr.success("上传成功");
		var curCorporation = document.getElementById("currCorporation");
		window.location="/corporation/manager/manager_getAnnouncementByPage?member_corporation="+curCorporation.innerHTML+"&queryStartTime=0000-00-00&queryEndTime=9999-99-99&queryName=&timeSort=desc&currPage=1";
	}
}

function deleteAnnouncement(event)
{
	ajaxDeleteAnnouncement("/corporation/manager/manager_deleteAnnouncement",event.id);
}

function ajaxDeleteAnnouncement(url,announcement_id)
{
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlHttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var formData = new FormData();
	formData.append("announcement_id", announcement_id);
	formData.append("member_corporation", document.getElementById("currCorporation").innerHTML);
	xmlHttp.open("POST", url, true);
	xmlHttp.send(formData);
	xmlHttp.onreadystatechange  = ajaxDelteBack;
}

function ajaxDelteBack()
{
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		toastr.success("删除成功");
		var curCorporation = document.getElementById("currCorporation");
		window.location="/corporation/manager/manager_getAnnouncementByPage?member_corporation="+curCorporation.innerHTML+"&queryStartTime=0000-00-00&queryEndTime=9999-99-99&queryName=&timeSort=desc&currPage=1";
	}
}

function queryAnnouncement()
{
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryNameText");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var querySort = document.getElementById("querySort").value;
	window.location="/corporation/manager/manager_getAnnouncementByPage?" +
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
	window.location="/corporation/manager/manager_getAnnouncementByPage?" +
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
		window.location="/corporation/manager/manager_getAnnouncementByPage?" +
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
	window.location="/corporation/manager/manager_getAnnouncementByPage?" +
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
	window.location="/corporation/manager/manager_getAnnouncementByPage?" +
	"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
			"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage="+currPage;
		}
}

function changeSort()
{
	var querySort = document.getElementById("querySort").value;
	if(querySort=="desc")
		{
		querySort="asc";
		}
	else
		{
		querySort = "desc";
		}
	var curCorporation = document.getElementById("currCorporation");
	var queryNameText = document.getElementById("queryNameText");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");

	window.location="/corporation/manager/manager_getAnnouncementByPage?" +
			"member_corporation="+curCorporation.innerHTML+"&queryStartTime="+datetimeStart.value +
					"&queryEndTime="+datetimeEnd.value+"&queryName="+queryNameText.value+"&timeSort="+querySort+"&currPage=1";
}

function detailsAnnouncement(event)
{	var detalis_img = document.getElementById("detalis_img");
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
		document.getElementById("details_announcement_name").value  =  result.announcement_name;
		document.getElementById("details_sannouncement_content").value  =  result.announcement_content;
		document.getElementById("details_announcement_file").href  =  "/corporation/manager/apply_downloadImg?" +
															"fileDirc=announcementFile&filename="+result.announcement_files;
		var img = document.createElement("img");
		img.setAttribute("src", "/corporation/manager/apply_downloadImg?" +
								"fileDirc=announcementImage&filename="+result.announcement_image);
		img.style.width = "150px";
		img.style.height = "150px";
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


	