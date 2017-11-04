<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta charset="UTF-8"/> 
<link rel="stylesheet" href="<%=webRoot%>/admin/css/admin.css?v=8">
<title>田畈街镇中学后台管理界面</title>

</head>
<body>
<div class="main">
  <div class="top">
     <div class="logo">
     </div>
     <ul class="topLink">
        <li class="logout"><a href="<%=webRoot%>/wl/school/admin/login/logout.ac">安全退出</a></li>
        <shiro:hasRole name="root">
           <li><a href="account/accountList.jsp" target="left_content">账号管理</a></li>
        </shiro:hasRole>
        <li>欢迎您&nbsp;<a href="account/accountEdit.jsp?id=${currentUser.id}" target="left_content"><shiro:principal/></a></li>
     </ul>
  </div>
  
  <div class="content">
	  <div class="left_box">
		  <div class="left_index_bar">
		      <dl>
		        <dt class="has_sub"><a href="javascript:void(0)" target="left_content">学校概况</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolIntroduction/schoolIntroduction.jsp" target="left_content">学校简介</a></li>
		                <li><a href="schoolPersonInfo/schoolPersonInfoList.jsp?businessType=xxgk,xrld," target="left_content">现任领导</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=xxgk,xxts," target="left_content">学校特色</a></li>
		            </ul>
		        </dd>
		        <dt><a href="schoolIndexShow/schoolIndexShowList.jsp?businessType=index,show," target="left_content">首页展示</a></dt>
		        <dt class="has_sub"><a href="javascript:void(0)" target="left_content">新闻中心</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=xwzx,jsxw," target="left_content">及时新闻</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=xwzx,ggtz," target="left_content">公告通知</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=xwzx,xwgk," target="left_content">校务公开</a></li>
		            </ul>
		        </dd>
		        <dt class="has_sub"><a href="javascript:void(0)" target="left_content">师生天地</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=sstd,jxjy," target="left_content">教学教研</a></li>
		                <li><a href="schoolPersonInfo/schoolPersonInfoList.jsp?businessType=sstd,msfc," target="left_content">名师风采</a></li>
		                <li><a href="schoolPersonInfo/schoolPersonInfoList.jsp?businessType=sstd,xyzx," target="left_content">校园之星</a></li>
		            </ul>
		        </dd>
		        <dt class="has_sub"><a href="javascript:void(0)" target="left_content">辉煌成就</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=hhcj,jtry," target="left_content">集体荣誉</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=hhcj,jsry," target="left_content">教师荣誉</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=hhcj,xsry," target="left_content">学生荣誉</a></li>
		            </ul>
		         </dd>
		        <dt class="has_sub"><a href="javascript:void(0)" target="left_content">高考在线</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=gkzj,gkxw," target="left_content">高考新闻</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=gkzj,gkdy," target="left_content">高考答疑</a></li>
		            </ul>
		         </dd>
		        <dt class="has_sub"><a href="javascript:void(0)," target="left_content">招生专栏</a></dt>
		        <dd>
		            <ul>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=zszl,zsjz," target="left_content">招生简章</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=zszl,zszc," target="left_content">招生政策</a></li>
		                <li><a href="schoolBaseInfo/schoolBaseInfoList.jsp?businessType=zszl,zszx," target="left_content">招生咨询</a></li>
		            </ul>
		         </dd>
		      </dl>
		  </div>
	  </div>
	  <div class="right_box">
	    <iframe height="100%" width="100%" src="schoolIntroduction/schoolIntroduction.jsp" name="left_content" frameborder="0"></iframe>
	  </div>
	  <div class="clearBoth"></div>
  </div>
</div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script>
	$(function(){
		$("dt a").click(function(){
			if(!$(this).parent().hasClass("dt_selected")){
				$(".left_index_bar dt").removeClass("dt_selected");
				$(this).parent().addClass("dt_selected");
			}
			//展开子项
			if($(this).parent().hasClass("has_sub")){
			    $(this).parent().next("dd").toggle();
			}
		});
	});
	
</script>
</html>