<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>学校信息列表</title>
<link rel="stylesheet" href="<%=webRoot%>/admin/css/content.css">
<link rel="stylesheet" href="<%=webRoot%>/js/cropper/cropper.css">
<style>
   .container{
     float:left;width:105px;height:136px;background-color:#CCCCCC;
   }
   
   .modify_container{
       width:800px;
       height:550px;
       position:absolute;
       top:50%;
       left:50%;
       margin:-275px 0 0 -400px;
       background-color:#CCCCCC;
       display:none;
   }
   .modify_pic{
       width:675px;
       height:500px;
       float:left;
   }
   .modify_btn{
       width:800px;
       height:50px;
       text-align:center;
       margin-top:10px;
   }
   .preview{
       width:125px;
       height:500px;
       float:left;
   }
   
   .preview_pic{
       width:105px;
       height:136px;
       margin-left:10px;
   }
</style>
</head>
<body>
    <div class="content">
        <div class="title"><span id="businessName"></span></div>
        <div class="main">
            <div class="btn_lst">
                <input type="button" class="wl_btn" name="back" onclick="back()" value="返回"/>
	            <input type="button" class="wl_btn" name="save" onclick="save()" value="保存草稿"/>
	            <input type="button" class="wl_btn" name="submit" onclick="submit()" value="直接发布"/>
	        </div>
	        <div>
                <div style="float:left;font-weight: bold;line-height: 20px;width:80px;">姓名：</div>
                <div style="float:left">
                    <input type="input" id="name">
                </div>
                <div class="clearBoth"></div>
            </div>
            <div style="margin-top:10px;">
                <div style="float:left;font-weight: bold;line-height: 20px;width:80px;">职位/称号：</div>
                <div style="float:left">
                    <input type="input" id="title">
                </div>
                <div class="clearBoth"></div>
            </div>
            <div style="margin-top:10px;">
                <div style="float:left;font-weight: bold;line-height: 20px;width:80px;">头像：</div>
                <div class="container">
                   <img width ="105" height="136" id="headPic" src="" alt="自动识别详细描述中图片">
                </div>
                <div style="float:left;margin-left:5px;">
                    <!-- <div id="changeHeadPic" style="display:none">
                        <input type="button" value="修改" onclick="changeHeadPic()"/>
                    </div> -->
                    <div id="changeOtherHeadPic" style="margin-top:10px;display:none">
                        <input type="button" value="换一张" onclick="changeOtherHeadPic()"/>
                    </div>
                </div>
                
                <div class="clearBoth"></div>
            </div>
        
	        <div class="editor">
	            <textarea id="editor_id" style="width:100%;height:500px"></textarea>
	        </div>
	        
	      <div class="modify_container">
	        <div class="modify_pic">
	            <img id="modify_headPic" src="">
	        </div>
	        <div class="preview">
	            <div class="preview_pic">
	                <img width ="105" height="136" style="position:absolute;" id="preview_pic" src=""/>
	            </div>
	        </div>
	        <div class="clearBoth"></div>
	        <div class="modify_btn">
	            <input type="button" class="wl_btn" value="确定"/>
	            <input type="button" class="wl_btn" value="取消" onclick="cancelModify()"/>
	        </div>
         </div>
        </div>
    </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/editor/kindeditor-min.js"></script>
<script src="<%=webRoot%>/js/my/wl_businessType.js?v=1"></script>
<script src="<%=webRoot%>/js/cropper/cropper.js"></script>

<script>
var businessType = "${param.businessType}";

var schoolPersonInfo = {
		name : "",
		title : "",
		content: "",
		businessType : businessType,
		status: 1,
		no : 0,
		headPic : ""
};
	
$(function () {
	//设置标题名称
	var businessName = Wl_BusinessType[businessType];
	$("#businessName").text(businessName + "--新增");
	 KindEditor.ready(function(K) {
         window.editor = K.create('#editor_id', {
	        	 uploadJson : webRoot + '/js/editor/jsp/upload_json.jsp',
	             fileManagerJson : webRoot + '/js/editor/jsp/file_manager_json.jsp',
	             allowFileManager : true,
	             afterUpload : function(url){ //文件上传回调函数
	            	 showHeadPic(url);
	             }
        	 });
     });
});

function showHeadPic(url){
	var reg = /\.(jpg|png|bmp|gif|jpeg)$/i;
	if(reg.test(url)){
		if($("#headPic").attr("src") == undefined || $("#headPic").attr("src") == ""){
			$("#headPic").attr("src", url);
			//$("#changeHeadPic").show();
		}else{
			$("#changeOtherHeadPic").show();
		}
	}
}

function changeHeadPic(){
	var currentPic = $("#headPic").attr("src");
	$('.modify_container').show();
	$("#modify_headPic").attr("src", currentPic);
	$("#preview_pic").attr("src", currentPic);
	$('.modify_pic > img').cropper({
		  aspectRatio : 105/136,
		  crop: function(data) {
		    // Output the result data for cropping image.
		    console.log(data);
		    $("#preview_pic").css("clip", "rect(" + data.y + "px " + (data.x + data.width) + "px " + (data.y + data.height) + "px " + data.x + "px)");
		  }
	});
}

function cancelModify(){
	$('.modify_container').hide();
}

function changeOtherHeadPic(){
	var content = editor.html();
	var reg =  /<img src=\"(.*?)\".*?\/>/ig;
	var arrUrl = new Array();
	var tmp;
	while((tmp = reg.exec(content)) != null){
		arrUrl.push(tmp[1]);
	}
	//获取当前
	var currentUrl = $("#headPic").attr("src");
	if(arrUrl.length == 1){
		if(currentUrl == arrUrl[0]){
			alert("没有其他图片");
			$("#changeOtherHeadPic").hide();
		}else{
			$("#headPic").attr("src", arrUrl[0]);
		}
		return;
	}
	var i = getIndexFromArray(arrUrl, currentUrl);
	var next = Number(i) + 1;
	if(i == arrUrl.length - 1){
		next = 0;
	}
	$("#headPic").attr("src", arrUrl[next]);
}

//从数组中获取值的索引
function getIndexFromArray(arr, val){
	for(var i in arr){
		if(arr[i] == val){
			return i;
		}
	}
}

function save(){
	if(getDate()){
		$.post(webRoot + "/wl/school/admin/schoolPersonInfo/addSchoolPersonInfo.ac",schoolPersonInfo, function(result){
			if(result == 1){
				alert("信息保存成功。");
				window.location = "schoolPersonInfoList.jsp?businessType=" + businessType;
			}else{
				alert("信息保存失败！");
			} 
		});
	}
	
}

function submit(){
	
	if(getDate()){
		schoolPersonInfo.status = 2;
		$.post(webRoot + "/wl/school/admin/schoolPersonInfo/addSchoolPersonInfo.ac",schoolPersonInfo, function(result){
			if(result == 1){
				alert("信息发布成功。");
				window.location = "schoolPersonInfoList.jsp?businessType=" + businessType;
			}else{
				alert("信息发布失败！");
			}
		});
	}
	
}

function getDate(){
	editor.sync(); //同步数据
	var name = $("#name").val();
	var title = $("#title").val();
	var content = $("#editor_id").val();
	var headPic = $("#headPic").attr("src");
	if(name == "" || title == "" || content == "" || headPic == ""){
		alert("请填写完整信息！");
		return false;
	}
	schoolPersonInfo.name = name;
	schoolPersonInfo.title = title;
	schoolPersonInfo.content = content;
	schoolPersonInfo.headPic = headPic;
	return true;
}

function back(){
	window.open("schoolPersonInfoList.jsp?businessType=" + businessType, "_self");
}
</script>
</html>