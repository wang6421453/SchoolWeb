<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title></title>
<link rel="stylesheet" href="<%=webRoot%>/css/wl_detail.css">
</head>
<body>

   <div class="main" id ="main"> 
       <jsp:include page="/headFrame.jsp" flush="true"/>
       
       <div class="navigation">
           <a id="businessName" href="<%=webRoot%>/custom/schoolBaseInfoDetailList.jsp?businessType=${param.businessType}"></a>
           <span id="newTitle"></span></div>
       <div class="content">
            <div class="title" id="title"></div>
            <div class="attach_msg" id="attach_msg"></div>
            <div id="content_body"></div>
       </div>
       <jsp:include page="/footFrame.jsp" flush="true"/>
   </div>

</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=1"></script>
<script src="<%=webRoot%>/js/my/wl_util.js?v=1"></script>
<script>
//业务类别
var businessType = "${param.businessType}";
//记录id
var id = "${param.id}";
	
$(function(){
	//设置标题名称
	var businessName = Wl_BusinessType[businessType];
	$("#businessName").text(businessName + ">");
	//设置父标题
	var parents = businessType.split(",");
	var pTitle = "";
	if(parents.length > 2){
		var bType = "";
		for(var i = 0; i < parents.length-2; i++){
			bType = bType + parents[i] + ",";
			pTitle += "<a href=" + webRoot + "/custom/schoolBaseInfoDetailList.jsp?businessType=" + bType + ">" + Wl_BusinessType[bType] +"></a>";
		}
	}
	$("#businessName").before(pTitle);
	//加载数据
	$.post(webRoot + "/wl/school/custom/schoolBaseInfo/getSchoolBaseInfoById.ac",{id:id}, function(result){
		 if(result != null){
			$("#newTitle").html(result.title);
			$("#title").html(result.title);
			$("#attach_msg").html("时间:" + Wl_Util.formatDate(result.commitTime) + " 点击:" + result.clickRate);
		    $("#content_body").html(result.content);
		 }
	 });
});


</script>
</html>