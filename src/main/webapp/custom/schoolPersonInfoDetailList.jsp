<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<link rel="stylesheet" href="<%=webRoot%>/css/wl_pagination.css">
<title></title>
<style>
   #content li{
	 list-style: none;
	 height:178px;
   }
   
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
	   cursor:pointer;
   }
   
   #content{
      margin-top:10px;
      /* text-align:center */
   }

   .head_pic{
      padding: 4px;
      height: 160px;
      width: 128px;
      border: 1px solid #c1d2e2;
      float: left;
   }
   
   .introduction{
      float: right;
      height: 168px;
      width: 852px;
      background: #DCF2FF;
      border: 1px solid #c1d2e2;
      overflow:hidden;
      text-overflow:ellipsis;
   }
   
   .introduction .title h2 {
	    line-height: 30px;
	    margin: 0px auto;
	    height: 30px;
	    width: 832px;
	    border-bottom: 1px solid #FFF;
    }
    
    .introduction .info{
       padding:10px; 
       font-size: 12pt !important;
       font-family: 宋体  !important;
       line-height:25px !important;
    }
    
    .introduction .info *{
       font-size: 12pt !important;
       font-family: 宋体  !important;
       line-height:25px !important;
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
<script src="<%=webRoot%>/js/my/wl_StringBuffer.js?v=1"></script>
<script>
//业务类别
var businessType = "${param.businessType}";
	
var wl_Pagination = new Wl_Pagination("pagination", loadData, 7);

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
			pTitle += "<a href=" + webRoot + "/custom/schoolPersonInfoDetailList.jsp?businessType=" + bType + ">" + Wl_BusinessType[bType] +"></a>";
		}
	}
	$("#businessName").before(pTitle);
    loadData();
});



function loadData(){
	searchInfo.pageNo = wl_Pagination.pageNo;
	$.post(webRoot + "/wl/school/custom/schoolPersonInfo/getSchoolPersonInfoList.ac", searchInfo,
			function(result) {
				var lstSchoolPersonInfoVo = result.lstSchoolPersonInfoVo;
				//<li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
				var totalCount = result.totalCount;
				var length = lstSchoolPersonInfoVo.length;
				var contentList = $("#contentList");
				var sb = new Wl_StringBuffer();
				for(var i = 0; i < length; i++){
					var title = lstSchoolPersonInfoVo[i].title;
					var name = lstSchoolPersonInfoVo[i].name;
					var content = lstSchoolPersonInfoVo[i].content.replace(/<img.*?\/>/, "").replace(/<br \/>/gi, "");//.replace(/<p>([^<]*?)<\/p>/gi, "");
					var headPic = lstSchoolPersonInfoVo[i].headPic;
					sb.append("<li>");
					sb.append("<div class='head_pic'>");
					sb.append("<a href='schoolPersonInfoDetail.jsp?businessType=").append(businessType).append("&id=").append(lstSchoolPersonInfoVo[i].id).append("'>");
					sb.append("<img width='128' height='160' src='").append(headPic).append("' />");
					sb.append("</a>").append("</div>");
					sb.append("<div class='introduction'>");
					sb.append("<div class='title'>")
					sb.append("<a href='schoolPersonInfoDetail.jsp?businessType=").append(businessType).append("&id=").append(lstSchoolPersonInfoVo[i].id).append("'>");
					sb.append("<h2>");
					sb.append(title);
					sb.append(":");
					sb.append(name);
					sb.append("</h2>");
					sb.append("</a>");
					sb.append("</div>");
					sb.append("<div class='info'>");
					sb.append(content);
					sb.append("</div>");
					sb.append("</div>");
					sb.append("</li>");
				}
				contentList.html(sb.toString());
				//加载分页组建
				wl_Pagination.loadPagination(totalCount);
	});
}

</script>
</html>