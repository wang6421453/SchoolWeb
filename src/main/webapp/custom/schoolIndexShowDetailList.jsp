<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<link rel="stylesheet" href="<%=webRoot%>/css/wl_pagination.css">
<title></title>
<style>
   .navigation{
       height:25px;
       margin-top:10px;
       font-size:20px;
       border-bottom:2px solid blue;
   }
   
   .navigation a{
	   color:blue;
   }
   
   a:hover{
	   color:red;
   }
   
   #content{
      margin-top:10px;
      /* text-align:center */
   }
   
   #contentList em{
	   font-style: normal;
	   color: #0057A6;
	   float: right;
	   margin-right:5px;
   }

	#contentList li{
		height:30px;
		list-style: none;
        background: url(../img/q.gif) no-repeat 0 7px;
        padding-left: 10px;
        border-bottom: 1px dashed #CCC;
        line-height:24px;
        font-size:20px;
	}
	
	#contentList li a{
		width:75%;
		white-space:nowrap; /**不进行换行*/
		overflow:hidden;
		text-overflow:ellipsis; /**超出部分显示...*/
		float:left;
	}

</style>
</head>
<body>

   <div class="main" id ="main"> 
       <jsp:include page="/headFrame.jsp" flush="true"/>
       
       <div class="navigation"><a id="businessName" href=""></a></div>
       <div id="content">
          <ul id="contentList">
          </ul>
       </div>
       <div class="pagination" id="pagination">
             
        </div>
   </div>

</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=2"></script>
<script src="<%=webRoot%>/js/my/wl_pagination.js"></script>
<script src="<%=webRoot%>/js/my/wl_util.js"></script>
<script>
//业务类别
var businessType = "${param.businessType}";
//记录id
var id = "${param.id}";
	
var wl_Pagination = new Wl_Pagination("pagination", loadData, 20);

var searchInfo = {
	pageNo : wl_Pagination.pageNo,
	pageSize : wl_Pagination.pageSize,
	businessType : businessType,
	status : 2
};

$(function(){
	//设置标题名称
	var businessName = Wl_BusinessType[businessType];
	$("#businessName").text(businessName);
	//设置父标题
	var parents = businessType.split(",");
	var pTitle = "";
	if(parents.length > 2){
		var bType = "";
		for(var i = 0; i < parents.length-2; i++){
			bType = bType + parents[i] + ",";
			pTitle += "<a href=" + webRoot + "/custom/schoolIndexShowDetailList.jsp?businessType=" + bType + ">" + Wl_BusinessType[bType] +"></a>";
		}
	}
	$("#businessName").before(pTitle);
    loadData();
});



function loadData(){
	searchInfo.pageNo = wl_Pagination.pageNo;
	$.post(webRoot + "/wl/school/custom/schoolIndexShow/getSchoolIndexShowList.ac", searchInfo,
			function(result) {
				var lstSchoolIndexShowVo = result.lstSchoolIndexShowVo;
				//<li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
				var totalCount = result.totalCount;
				var length = lstSchoolIndexShowVo.length;
				var contentList = $("#contentList");
				contentList.empty(); //先清空旧数据
				for(var i = 0; i < length; i++){
					var title = lstSchoolIndexShowVo[i].title;
					var time = Wl_Util.formatDate(lstSchoolIndexShowVo[i].commitTime);
					
					contentList.append("<li><a href=" + webRoot + "/custom/schoolIndexShowDetail.jsp?id=" + lstSchoolIndexShowVo[i].id + "&businessType=" + lstSchoolIndexShowVo[i].businessType + " target='_blank'>" + title + "</a><em>" + time + "</em></li>");
				}
				//加载分页组建
				wl_Pagination.loadPagination(totalCount);
	});
}

</script>
</html>