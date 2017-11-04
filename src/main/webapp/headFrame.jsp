<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<meta charset="UTF-8"/>
<html>
<head>
  <link rel="stylesheet" href="<%=webRoot%>/css/wl_headFrame.css">
</head>
<body>
<div class="head">
	<div class="top">
	   <div class="logo">
	      <a href="<%=webRoot%>/index.jsp"><img alt="华南理工大学 首页" src="<%=webRoot%>/img/logo.png"/></a>
	   </div>
	   <div class="topLink">
	      <!-- <a href="">电子邮件</a>
	      <a href="">办公门户</a> -->
	   </div>
	</div>

	<div class="menu">
	 <div class="mainMenu" id="mainMenu">
	   <ul>
	      <li><a href="<%=webRoot%>/index.jsp">首页</a></li>
	      <li><a href="" rel="dropmenu1">学校概况</a></li>
	      <li><a href="" rel="dropmenu2">新闻中心</a></li>
	      <li><a href="" rel="dropmenu3">师生天地</a></li>
	      <li><a href="" rel="dropmenu4">辉煌成就</a></li>
	      <li><a href="" rel="dropmenu5">高考在线</a></li>
	      <li><a href="" rel="dropmenu6">招生专栏</a></li>
	   </ul>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu1">
	    <a href="<%=webRoot%>/custom/schoolIntroductionDetail.jsp" target='_blank'>学校简介</a>
	    <a href="<%=webRoot%>/custom/schoolPersonInfoDetailList.jsp?businessType=xxgk,xrld,">现任领导</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=xxgk,xxts,">学校特色</a>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu2">
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=xwzx,jsxw,">及时新闻</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=xwzx,ggtz,">公告通知</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=xwzx,xwgk,">校务公开</a>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu3">
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=sstd,jxjy,">教学教研</a>
	    <a href="<%=webRoot%>/custom/schoolPersonInfoDetailList.jsp?businessType=sstd,msfc,">名师风采</a>
	    <a href="<%=webRoot%>/custom/schoolPersonInfoDetailList.jsp?businessType=sstd,xyzx,">校园之星</a>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu4">
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=hhcj,jtry,">集体荣誉</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=hhcj,jsry,">教师荣誉</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=hhcj,xsry,">学生荣誉</a>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu5">
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=gkzj,gkxw,">高考新闻</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=gkzj,gkdy,">高考答疑</a>
	 </div>
	 <div class="dropmenuDiv" id="dropmenu6">
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=zszl,zsjz,">招生简章</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=zszl,zszc,">招生政策</a>
	    <a href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=zszl,zszx,">招生咨询</a>
	 </div>
	</div>
</div>
</body>
<script src="<%=webRoot%>/js/dropdownmenu.js"></script>
<script>
   cssdropdown.startchrome("mainMenu");
</script>
</html>