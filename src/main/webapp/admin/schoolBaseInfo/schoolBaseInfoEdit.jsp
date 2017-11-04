<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>学校信息列表</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css">
</head>
<body>
   <div class="content">
       <div class="title"><span id="businessName"></span></div>
       <div class="main">
           <div class="btn_lst">
               <input type="button" class="wl_btn" name="back" onclick="back()" value="返回"/>
            <input type="button" class="wl_btn" name="update" onclick="update()" value="更新"/>
            <input type="button" class="wl_btn" name="submit" onclick="submit()" value="直接发布"/>
        </div>
           <div>
               <div style="float:left;font-weight: bold;line-height: 20px;">信息标题：</div>
               <div style="float:left">
                   <input type="input" id="title">
               </div>
               <div class="clearBoth"></div>
           </div>
       
        <div class="editor">
            <textarea id="editor_id" style="width:100%;height:500px"></textarea>
        </div>
        
       </div>
   </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/editor/kindeditor-min.js"></script>
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=1"></script>

<script>
//业务类别
var businessType = "${param.businessType}";
//记录id
var id = "${param.id}";
var schoolBaseInfo = {
		id:id,
		title : "",
		content: "",
		businessType : businessType,
		status: 1
};
	
$(function () {
	//设置标题名称
	var businessName = Wl_BusinessType[businessType];
	$("#businessName").text(businessName + "--编辑");
	
	KindEditor.ready(function(K) {
         window.editor = K.create('#editor_id', {
	        	 uploadJson : webRoot + '/js/editor/jsp/upload_json.jsp',
	             fileManagerJson : webRoot + '/js/editor/jsp/file_manager_json.jsp',
	             allowFileManager : true
         });
     });
	 
	 //加载数据
	 $.post(webRoot + "/wl/school/admin/schoolBaseInfo/getSchoolBaseInfoById.ac",{id:id}, function(result){
		 if(result != null){
		    $("#title").val(result.title);
		    editor.html(result.content);
		 }
	 });
});

function update(){
	editor.sync(); //同步数据
	var title = $("#title").val();
	var content = $("#editor_id").val();
	if(title == "" || content == ""){
		alert("请填写标题和内容！");
		return;
	}
	schoolBaseInfo.title = title;
	schoolBaseInfo.content = content;
	$.post(webRoot + "/wl/school/admin/schoolBaseInfo/updateSchoolBaseInfo.ac",schoolBaseInfo, function(result){
		if(result == 1){
			alert("信息更新成功。");
			window.location = "schoolBaseInfoList.jsp?businessType=" + businessType;
		}else{
			alert("信息更新失败！");
		} 
	});
}

function submit(){
	editor.sync(); //同步数据
	var title = $("#title").val();
	var content = $("#editor_id").val();
	if(title == "" || content == ""){
		alert("请填写标题和内容！");
		return;
	}
	schoolBaseInfo.title = title;
	schoolBaseInfo.content = content;
	schoolBaseInfo.status = 2;
	$.post(webRoot + "/wl/school/admin/schoolBaseInfo/updateSchoolBaseInfo.ac",schoolBaseInfo, function(result){
		if(result == 1){
			alert("信息发布成功。");
			window.location = "schoolBaseInfoList.jsp?businessType=" + businessType;;
		}else{
			alert("信息发布失败！");
		}
	});
}

function back(){
	window.open("schoolBaseInfoList.jsp?businessType=" + businessType, "_self");
}
</script>
</html>