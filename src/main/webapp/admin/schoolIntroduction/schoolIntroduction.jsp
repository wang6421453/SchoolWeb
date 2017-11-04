<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>学校简介</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css">
</head>
<body>
    <div class="content">
        <div class="title"><span>学校简介</span></div>
        <div class="main">
            <div class="btn_lst">
                <input type="button" class="wl_btn" name="edit" id="edit" onclick="edit()" value="编辑"/>
                <input type="button" class="wl_btn" name="cancel" id="cancel" onclick="cancel()" value="取消"/>
	            <input type="button" class="wl_btn" name="update" id="update" onclick="update()" value="更新"/>
	        </div>
        
	        <div class="editor" id="editor">
	            <!-- <textarea id="editor_id" style="width:100%;height:500px"></textarea> -->
	        </div>
	        
        </div>
    </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/editor/kindeditor-min.js"></script>

<script>
var schoolIntroduction = {
		id:"",
		content: ""
};

//加载数据
function reload(){
	$.post(webRoot + "/wl/school/admin/schoolIntroduction/getSchoolIntroduction.ac", function(result){
		 if(result != null){
			schoolIntroduction.id = result.id;
			schoolIntroduction.content = result.content;
		    $("#editor").html(result.content);
		 }
	 });
}

$(function () {
	$("#update").hide();
	$("#cancel").hide();
	
	//加载数据
	reload();
});

function edit(){
	$("#edit").hide();
	$("#cancel").show();
	$("#update").show();
	
	$("#editor").html("<textarea id='editor_id' style='width:100%;height:500px'></textarea>");
    window.editor = KindEditor.create('#editor_id', {
     	 uploadJson : webRoot + '/js/editor/jsp/upload_json.jsp',
          fileManagerJson : webRoot + '/js/editor/jsp/file_manager_json.jsp',
          allowFileManager : true
    });
    editor.html(schoolIntroduction.content);
}

function cancel(){
	window.location = "schoolIntroduction.jsp";
}

function update(){
	editor.sync(); //同步数据
	var content = $("#editor_id").val();
	schoolIntroduction.content = content;
	if(schoolIntroduction.id == undefined){
		$.post(webRoot + "/wl/school/admin/schoolIntroduction/addSchoolIntroduction.ac",schoolIntroduction, function(result){
			if(result == 1){
				alert("学校简介更新成功。");
				window.location = "schoolIntroduction.jsp";
			}else{
				alert("学校简介更新失败！");
			} 
		});
	}else{
		$.post(webRoot + "/wl/school/admin/schoolIntroduction/updateSchoolIntroduction.ac",schoolIntroduction, function(result){
			if(result == 1){
				alert("学校简介更新成功。");
				window.location = "schoolIntroduction.jsp";
			}else{
				alert("学校简介更新失败！");
			} 
		});
	}
	
}
</script>
</html>