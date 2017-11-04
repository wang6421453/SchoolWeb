<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>学校信息列表</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css?v=1">
<link rel="stylesheet" href="<%=webRoot%>/css/wl_pagination.css">
</head>
<body>
<!-- 隐藏字段 -->
<%-- <input type="hidden" name="businessType" id="businessType" value="${param.businessType}"/> --%>

    <div class="content">
        <div class="title"><span id="businessName"></span></div>
        <div class="top_box">
           <div class="btn_list">
               <input class="wl_btn" type="button" value="新增" onclick="addSchoolIndexShow()">
               <input class="wl_btn" type="button" value="编辑" onclick="editSchoolIndexShow()">
               <input class="wl_btn" type="button" value="删除" onclick="deleteSchoolIndexShow()">
               <input class="wl_btn" type="button" value="发布" onclick="commitSchoolIndexShow()">
           </div>
        </div>
        <div style="width:100%" class="tableContainer">
	        <table id="tb_schoolIndexShow" cellpadding="8" cellspacing="0" width="100%">
	           <thead>
	            <tr>
	               <th style="width:5%"><input type="checkbox" name="checkAll" id="checkAll"/></th>
	               <th style="width:5%">序号</th>
	               <th style="width:15%">标题</th>
	               <th style="width:35%">详细介绍</th>
	               <th style="width:10%">创建人</th>
	               <th style="width:10%">状态</th>
	               <th style="width:10%">创建时间</th>
	            </tr>
	           </thead>
	           <tbody id="lst_schoolIndexShow">
	           </tbody>
	        </table>
        </div>
        <div class="pagination" id="pagination">
             
        </div>
    </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/my/wl_util.js"></script>
<script src="<%=webRoot%>/js/my/wl_checkBoxListener.js"></script>
<script src="<%=webRoot%>/js/my/wl_pagination.js"></script>
<script src="<%=webRoot%>/js/my/wl_StringBuffer.js"></script>
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=5"></script>
<script>
//业务类别
var businessType = "${param.businessType}";

$(function () {
	//设置标题名称
	var businessName = Wl_BusinessType[businessType];
	$("#businessName").text(businessName);
	//获取学校最新信息
	getSchoolLastestIndexShow();
});

var wl_Pagination = new Wl_Pagination("pagination", loadData, 5);

var searchInfo = {
	pageNo : wl_Pagination.pageNo,
	pageSize : wl_Pagination.pageSize,
	businessType : businessType
};


//获取学校最新信息
function getSchoolLastestIndexShow(){
	loadData();
}

function loadData(){
	searchInfo.pageNo = wl_Pagination.pageNo;
	$.post(webRoot + "/wl/school/admin/schoolIndexShow/getSchoolIndexShowList.ac", searchInfo,
			function(result) {
				var lstSchoolIndexShowVo = result.lstSchoolIndexShowVo;
				var totalCount = result.totalCount;
				var length = lstSchoolIndexShowVo.length;
				var schoolIndexShowBody = $("#lst_schoolIndexShow");
				schoolIndexShowBody.empty(); //先清空旧数据
				var sb = new Wl_StringBuffer();
				for(var i = 0; i < length; i++){
					var status = lstSchoolIndexShowVo[i].status == 2 ? "已发布":"草稿";
					var content = lstSchoolIndexShowVo[i].content;
					content = Wl_Util.replaceTd(content); //缩小图片并替换掉换行
					sb.append("<tr style='height:47px'>");
					sb.append("<td><input type='checkbox' name='check' value='" + lstSchoolIndexShowVo[i].id + "'/></td>");
					sb.append("<td>" + ((wl_Pagination.pageNo - 1) * wl_Pagination.pageSize + (i+1)) + "</td>");
					sb.append("<td>" + lstSchoolIndexShowVo[i].title + "</td>");
					sb.append("<td>" + content + "</td>");
					sb.append("<td>" + lstSchoolIndexShowVo[i].createUser + "</td>");
					sb.append("<td>" + status + "</td>");
					sb.append("<td>" + Wl_Util.formatDate(lstSchoolIndexShowVo[i].createTime) + "</td>");
					sb.append("</tr>");
				}
				schoolIndexShowBody.append(sb.toString());
				//加载分页组建
				wl_Pagination.loadPagination(totalCount);
				//添加选择框监听事件(需要等列表加载完才能添加监听事件)
				wl_CheckListener.addCheckListener("lst_schoolIndexShow");
	});
}

//添加信息
function addSchoolIndexShow(){
	window.open("schoolIndexShowAdd.jsp?businessType=" + businessType, "_self");
}

//删除信息
function deleteSchoolIndexShow(){
	var checked = $("input[name=check]:checked");
	var size = checked.size();
	var ids = new Array();
	if(size == 0){
		alert("请勾选需要删除的信息");
		return;
	}else{
		for(var i = 0; i < size; i++){
			ids[i] = checked.eq(i).val();
		}
		$.post(webRoot + "/wl/school/admin/schoolIndexShow/deleteSchoolIndexShow.ac",{ids:ids},function(result){
			if(result == 0){
				alert("信息删除失败。");
			}else{
				alert("成功删除" + result + "条信息");
				loadData();
			} 
		});
	}
}

//发布信息
function commitSchoolIndexShow(){
	var checked = $("input[name=check]:checked");
	var size = checked.size();
	var ids = new Array();
	if(size == 0){
		alert("请勾选需要发布的信息");
		return;
	}else{
		for(var i = 0; i < size; i++){
			ids[i] = checked.eq(i).val();
		}
		$.post(webRoot + "/wl/school/admin/schoolIndexShow/commitSchoolIndexShow.ac",{ids:ids},function(result){
			if(result == 0){
				alert("信息发布失败。");
				return;
			}else{
				alert("成功发布" + result + "条信息");
				loadData();
			} 
		});
	}
}

//编辑信息
function editSchoolIndexShow(){
	var checked = $("input[name=check]:checked");
	var size = checked.size();
	if(size == 0){
		alert("请勾选需要编辑的信息");
		return;
	}else if(size > 1){
	    alert("每次只能勾选一条信息进行编辑");
	}else{
		var id = checked.val();
		window.location = "schoolIndexShowEdit.jsp?businessType=" + businessType + "&id=" + id;
	}
}

</script>
</html>