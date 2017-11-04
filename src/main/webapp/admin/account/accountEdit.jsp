<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp" %>

<html>
<head>
<meta charset="UTF-8"/>
<title>田畈街镇中学后台管理——账号详细信息</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css">
<style type="text/css">
   .accountInfo{
      margin-top:20px;
   }
   
   td:nth-child(1){
      text-align:right;
   }
}
</style>
</head>
<body>
<div class="content">
   <div class="title"><span id="businessName">修改信息</span></div>
	<form action="<%=webRoot%>/wl/school/admin/account/modifyAcount.ac">
	<input name="id" type="hidden" value="${param.id}" >
		<div class="accountInfo">
	        <div>
				<table>
					<tr>
						<td>账号：</td>
						<td><input class="wl_input" type="text" name="userName"  disabled/>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input class="wl_input" type="text" name="realName" disabled/>
					</tr>
					<tr>
						<td>密&nbsp;码：</td>
						<td><input class="wl_input" type="password" name="password" disabled/>
					</tr>
					<tr style="display:none" id="tr_OldPassword">
						<td>操作人密码：</td>
						<td><input class="wl_input" type="password" name="oldPassword" id="oldPassword"/>
					</tr>
				</table>
			</div>
			<div style="margin-top:10px;text-align:center">
			    <input class="wl_btn" id="modify" type="button" value="修改"/>
			    <input class="wl_btn" id="back" type="button" value="返回"/>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
var id = "${param.id}";

function loadData(){
   	$.post(webRoot + "/wl/school/admin/account/getAccountById.ac",{id:id}, function(result){
   		if(result != ""){
   			$("input[name=userName]").val(result.userName);
   			$("input[name=realName]").val(result.realName);
   			$("input[name=password]").val(result.password);
   		}
   	});
}

function check(){
	var userName = $("input[name=userName]").val();
	var realName = $("input[name=realName]").val();
	var password = $("input[name=password]").val();
	var oldPassword = $("input[name=oldPassword]").val();
	if(oldPassword == ""){
		alert("请输入原始密码。");
		return false;
	}
	if(userName == "" || realName == "" || password == ""){
		alert("请输入完整信息");
		return false;
	}else{		
		return true;
	}
}

function modify(){
	var val = $("#modify").val();
	if(val == "修改"){
		$("input[name=realName]").attr("disabled", false);
		$("input[name=password]").attr("disabled", false);
		$("#tr_OldPassword").show();
		$("#modify").val("确定修改");
	}else if(val == "确定修改"){
		if(check()){
			$("form").submit();
		}
	}
}

$(function(){
	 if(id != ""){
		 loadData();
	 }
	 var error = "${error}";
	 if(error != ""){
	    $(".wl_input").attr("disabled", false);
		$("#tr_OldPassword").show();
		$("#modify").val("确定修改");
	    alert(error);
	 }
	 $("#modify").click(modify);
	 $("#back").click(function(){
		 window.location = webRoot + "/admin/schoolIntroduction/schoolIntroduction.jsp";
	 });
});
</script>
</body>
</html>