function indexPage()
{	var currCorporation = document.getElementById("currCorporation");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var queryDepartment = document.getElementById("queryDepartment");
	var member_status = document.getElementById("member_status");
	var queryName = document.getElementById("queryName");
	window.location="/corporation/manager/manager_showMemberMan?" +
			"queryMemberStatus="+member_status.value+"&queryDepartment="+queryDepartment.value+"&member_corporation="+currCorporation.innerHTML+"" +
					"&queryStartTime="+datetimeStart.value+"&queryEndTime="+datetimeEnd.value+
					"&queryName="+queryName.value+"&timeSort="+currSort.innerHTML+"&currPage=1";
}

function lastPage()
{	var currCorporation = document.getElementById("currCorporation");
	var currPage = document.getElementById("currPage");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var queryDepartment = document.getElementById("queryDepartment");
	var member_status = document.getElementById("member_status");
	var queryName = document.getElementById("queryName");
	if(currPage.value=="1")
		{
			toastr.error("已经是第一页");
		}
	else
		{
			var curr = currPage.value-1;
			window.location="/corporation/manager/manager_showMemberMan?" +
					"queryMemberStatus="+member_status.value+"&queryDepartment="+queryDepartment.value+"&member_corporation="+currCorporation.innerHTML+"" +
							"&queryStartTime="+datetimeStart.value+"&queryEndTime="+datetimeEnd.value+
							"&queryName="+queryName.value+"&timeSort="+currSort.innerHTML+"&currPage="+curr;
		}
}
	

function nextPage()
{	var currCorporation = document.getElementById("currCorporation");
	var totalPage = document.getElementById("totalPage");
	var currPage = document.getElementById("currPage");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var queryDepartment = document.getElementById("currDepartment");
	var member_status = document.getElementById("currStatus");
	var queryName = document.getElementById("queryName");
	if(totalPage.innerHTML==currPage.value)
		{
			toastr.error("已经是最后一页");
		}
	else
		{
			var curr = parseInt(currPage.value)+1;
			window.location="/corporation/manager/manager_showMemberMan" +
					"?queryMemberStatus="+member_status.value+"&queryDepartment="+queryDepartment.value+"&member_corporation="+currCorporation.innerHTML+"" +
							"&queryStartTime="+datetimeStart.value+"&queryEndTime="+datetimeEnd.value+
							"&timeSort="+currSort.innerHTML+"&currPage="+curr+"&queryName="+queryName.value;
		}
	
}

function finalPage()
{	var currCorporation = document.getElementById("currCorporation");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var totalPage = document.getElementById("totalPage");
	var queryDepartment = document.getElementById("currDepartment");
	var member_status = document.getElementById("currStatus");
	var queryName = document.getElementById("queryName");
	window.location="/corporation/manager/manager_showMemberMan?queryMemberStatus=" +member_status.value+
			"&queryDepartment="+queryDepartment.value+"&member_corporation=" +
			""+currCorporation.innerHTML+"&queryStartTime="+datetimeStart.value+"" +
			"&queryEndTime="+datetimeEnd.value+"&queryName="+queryName.value+"&timeSort="+currSort.innerHTML+"&currPage="+totalPage.innerHTML;
}


function jumpToPage()
{
	var totalPage = document.getElementById("totalPage");
	var currPage = document.getElementById("currPage");
	var queryName= document.getElementById("queryName");
	var currCorporation = document.getElementById("currCorporation");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var queryDepartment = document.getElementById("currDepartment");
	var member_status = document.getElementById("currStatus");
	if(currPage.value>totalPage.innerHTML||currPage.value<"1")
		{
			toastr.error("不存在该页");
		}
	else
		{
		window.location="/corporation/manager/manager_showMember?queryMemberStatus=" +member_status.value+
		"&queryDepartment="+queryDepartment.value+"&member_corporation=" +
		""+currCorporation.innerHTML+"&queryStartTime="+datetimeStart.value+"" +
		"&queryEndTime="+datetimeEnd.value+"&queryName="+queryName.value+"&timeSort="+currSort.innerHTML+"&currPage="+currPage.value;
	
		}
}

function queryMember()
{
	var queryName= document.getElementById("queryName");
	var currCorporation = document.getElementById("currCorporation");
	var currSort  = document.getElementById("currSort");
	var datetimeStart = document.getElementById("datetimeStart");
	var datetimeEnd = document.getElementById("datetimeEnd");
	var queryDepartment = document.getElementById("currDepartment");
	var member_status = document.getElementById("currStatus");
	window.location="/corporation/manager/manager_showMemberMan?queryMemberStatus=" +member_status.value+
	"&queryDepartment="+queryDepartment.value+"&member_corporation=" +
	""+currCorporation.innerHTML+"&queryStartTime="+datetimeStart.value+"" +
	"&queryEndTime="+datetimeEnd.value+"&queryName="+queryName.value+"&timeSort="+currSort.innerHTML+"&currPage=1";
}


function changeMemberRole(event)
{
	var currCoproration = document.getElementById("currCorporation").innerHTML;
	var member_id = event.name;
	var member_role = event.value;
	ajaxChangeMemberRole("/corporation/manager/manager_changeMemberRole?member_corporation="+currCoproration+"&member_id="+member_id+"&member_role="+member_role);
}
function ajaxChangeMemberRole(url)
{
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlHttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlHttp.open("GET", url, true);
	xmlHttp.send();
}

function changeDepartment(event)
{
	var currDepartment  = document.getElementById("currDepartment");
	
	currDepartment.value =event.value;
}

function changeStatus(event)
{
	var currStatus = document.getElementById("currStatus");
	currStatus.value = event.value;
}

function showQuit(event)
{
	var quitLabel = document.getElementById("quitLabel");
	var datetimeQuit = document.getElementById("datetimeQuit");
	if(event.value="0")
		{
			quitLabel.setAttribute("style", "display:block;");
			datetimeQuit.setAttribute("style", "display:block;");
		}
	else
		{
		quitLabel.setAttribute("style", "display:none;");
		datetimeQuit.setAttribute("style", "display:none;");
		}
}