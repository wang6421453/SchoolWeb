<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp" %>

<html>
<head>
<meta charset="UTF-8"/>
<title>田畈街镇中学后台管理——添加账号</title>
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
   <div class="title"><span id="businessName">添加账号</span></div>
	<form action="<%=webRoot%>/wl/school/admin/account/addAcount.ac">
		<div class="accountInfo">
	        <div>
				<table>
					<tr>
						<td>账号：</td>
						<td><input class="wl_input" type="text" name="userName"/>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input class="wl_input" type="text" name="realName"/>
					</tr>
					<tr>
						<td>密&nbsp;码：</td>
						<td><input class="wl_input" type="password" name="password"/>
					</tr>
				</table>
			</div>
			<div style="margin-top:10px;text-align:center">
			    <input class="wl_btn" id="add" type="button" value="确定"/>
			    <input class="wl_btn" id="back" type="button" value="返回"/>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script type="text/javascript">

function check(){
	var userName = $("input[name=userName]").val();
	var realName = $("input[name=realName]").val();
	var password = $("input[name=password]").val();
	if(userName == "" || realName == "" || password == ""){
		alert("请输入完整信息");
		return false;
	}else{		
		return true;
	}
}

function add(){
   if(check()){
	  $("form").submit();
   }
}

$(function(){
	 var error = "${error}";
	 if(error != ""){
	    alert(error);
	 }
	 //监听按钮事件
	 $("#add").click(add);
	 $("#back").click(function(){
		 window.location = webRoot + "/admin/account/accountList.jsp";
	 });
});
</script>
</body>
</html>