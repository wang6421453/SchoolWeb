<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>学校账号列表</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css?v=1">
<link rel="stylesheet" href="<%=webRoot%>/css/wl_pagination.css">
</head>
<body>
   <div class="content">
       <div class="title"><span>账号管理</span></div>
       <div class="top_box">
          <div class="btn_list">
              <input class="wl_btn" type="button" value="新增" onclick="addAccount()">
              <input class="wl_btn" type="button" value="编辑" onclick="editAccount()">
              <input class="wl_btn" type="button" value="删除" onclick="deleteAccount()">
          </div>
       </div>
       <div style="width:100%" class="tableContainer">
        <table id="tb_Account" cellpadding="8" cellspacing="0" width="100%">
           <thead>
            <tr>
               <th style="width:5%"><input type="checkbox" name="checkAll" id="checkAll"/></th>
               <th style="width:5%">序号</th>
               <th style="width:35%">账号</th>
               <th style="width:30%">姓名</th>
               <th style="width:10%">角色</th>
               <th style="width:15%">创建时间</th>
            </tr>
           </thead>
           <tbody id="lst_account">
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
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=2"></script>
<script>
$(function () {
	//获取学校最新信息
	loadData();
});

var wl_Pagination = new Wl_Pagination("pagination", loadData, 5);

var searchInfo = {
	pageNo : wl_Pagination.pageNo,
	pageSize : wl_Pagination.pageSize
};

function loadData(){
	searchInfo.pageNo = wl_Pagination.pageNo;
	$.post(webRoot + "/wl/school/admin/account/getAccountList.ac", searchInfo,
			function(result) {
				var lstAccount = result.lstAccount;
				var totalCount = result.totalCount;
				var length = lstAccount.length;
				var accountBody = $("#lst_account");
				var sb = new Wl_StringBuffer();
				for(var i = 0; i < length; i++){
					sb.append("<tr style='height:47px'>");
					sb.append("<td><input type='checkbox' name='check' value='" + lstAccount[i].id + "'/></td>");
					sb.append("<td>" + ((wl_Pagination.pageNo - 1) * wl_Pagination.pageSize + (i+1)) + "</td>");
					sb.append("<td>" + lstAccount[i].userName + "</td>");
					sb.append("<td>" + lstAccount[i].realName + "</td>");
					sb.append("<td>" + lstAccount[i].roleName + "</td>");
					sb.append("<td>" + Wl_Util.formatDate(lstAccount[i].createTime) + "</td>");
					sb.append("</tr>");
				}
				accountBody.html(sb.toString());
				//加载分页组建
				wl_Pagination.loadPagination(totalCount);
				//添加选择框监听事件(需要等列表加载完才能添加监听事件)
				wl_CheckListener.addCheckListener("lst_account");
	});
}

//添加信息
function addAccount(){
	window.open("accountAdd.jsp", "_self");
}

//删除信息
function deleteAccount(){
	var checked = $("input[name=check]:checked");
	var size = checked.size();
	var ids = new Array();
	if(size == 0){
		alert("请勾选需要删除的账号");
		return;
	}else{
		for(var i = 0; i < size; i++){
			ids[i] = checked.eq(i).val();
		}
		$.post(webRoot + "/wl/school/admin/account/deleteAccount.ac",{ids:ids},function(result){
			if(result.result == 0){
				alert("账号删除失败  " + result.msg);
			}else{
				alert("成功删除" + result.result + "条账号");
				loadData();
			} 
		});
	}
}


//编辑信息
function editAccount(){
	var checked = $("input[name=check]:checked");
	var size = checked.size();
	if(size == 0){
		alert("请勾选需要编辑的账号");
		return;
	}else if(size > 1){
	    alert("每次只能勾选一条账号进行编辑");
	}else{
		var id = checked.val();
		window.location = "accountEdit.jsp?id=" + id;
	}
}

</script>
</html>