<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title></title>
<style>
   .navigation{
       height:30px;
       margin-top:10px;
       font-size:20px;
       border-bottom:2px solid blue;
   }
   
   .navigation a:hover{
	   color:red;
   }
   
   #content{
      margin-top:10px;
      min-height:580px;
      /* text-align:center */
   }

</style>
</head>
<body>

<div class="main" id ="main"> 
    <jsp:include page="/headFrame.jsp" flush="true"/>
    
    <div class="navigation">学校简介</div>
    <div id="content"></div>
    <jsp:include page="/footFrame.jsp" flush="true"/>
</div>

</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script>

	
$(function(){
	 //加载数据
	 $.post(webRoot + "/wl/school/custom/schoolIntroduction/getSchoolIntroduction.ac", function(result){
		 if(result != null){
		    $("#content").html(result.content);
		 }
	 });
});


</script>
</html>