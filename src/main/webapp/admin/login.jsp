<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp" %>

<html>
<head>
<meta charset="UTF-8"/>
<title>田畈街镇中学后台管理——登陸</title>

<style type="text/css">
body{
   font-size:12px;
   background-image:url(imgs/login.jpg);
}

.login {
   width:300px;
   height:300px;
   position:absolute;
   top:50%;
   left:50%;
   margin:-150px 0 0 -150px;
   /* text-align: center; */
}
td{
  font-size:18px;
}
.wl_input{
  width:170px;
  height:25px;
  border: 1px solid #ccc;
  font-size:14px;
  border-radius: 4px;
  background-color: #fff;
}

.button{
   background: green;
   border:1px #008000 solid;
   cursor: pointer;
   width:100px;
   height:30px;
   font-size:18px;
}
.button:hover{
   background: #0C6BB8;
}
img{
  cursor: pointer;
}
</style>
</head>
<body onload="loadTopWindow()">
<form action="<%=webRoot%>/wl/school/admin/login/login.ac" method="post" onsubmit="return check()">
	<div class="login">
	    <div><h1>田畈街镇中学网站管理系统</h1></div>
        <div>
			<table>
				<tr>
					<td>用户名：</td>
					<td><input class="wl_input" type="text" name="userName"/>
				</tr>
				<tr>
					<td>密&nbsp;码：</td>
					<td><input class="wl_input" type="password" name="password"/>
				</tr>
				<tr>
					<td>验证码：</td>
					<td>
					   <div style="float:left"><input type="input" class="wl_input"  name="authCode" style="width:100px"/></div>
					   <div style="float:left"><img id="authCodeImg" src="<%=webRoot %>/createAuthCode" alt="验证码" title="点击更换" height=29px width=68px onclick="createAuthCode()" /></div>
					</td>
					
				</tr>
			</table>
		</div>
		<div style="margin:10px 30px">
		    <input class="button" type="submit" value="登 录"/>
		    <input class="button" type="reset" value="清空"/>
		</div>
	</div>
</form>	
<script type="text/javascript" src="../js/jquery-1.8.2.js"></script>
<script type="text/javascript">
//判断是否是顶级页面显示
function loadTopWindow(){
	if(window.top != null && window.top.document.URL != document.URL){
		window.top.location = document.URL;
	}
}

function check(){
	var userName = $("input[name=userName]").val();
	var password = $("input[name=password]").val();
	var authCode = $("input[name=authCode]").val();
	if(authCode == ""){
		alert("请输入验证码。");
		return false;
	}
	if(userName == "" || password == ""){
		if(userName == "" && password == ""){
		   alert("请输入用户名和密码。");
		}else if(userName == ""){
			alert("请输入用户名。");
		}else{
			alert("请输入密码。");
		}
		return false;
	}else{		
		return true;
	}
}


function createAuthCode(){
	$("#authCodeImg").attr("src", webRoot + "/createAuthCode?date=" + new Date());
}

$(function(){
	 var error = "${param.error}";
	 if(error != ""){
	    alert(error);
	 }
	 //生成验证码
	 createAuthCode();
});
</script>
</body>
</html>