/**
 * 列表选择框组建
 * author wl
 * data 2017-01-11
 */
//选中高亮事件(加载完了再绑定，不然绑定不了)
var wl_CheckListener = {
	/***
	 * 列表选择框监听事件
	 * @param tbody_id table组建的body ID默认值：lst_body
	 * @param color 选中后的高亮颜色 默认值：#D0F2C3
	 * @param check_name 选择框名字 默认值：check
	 * @param checkAll_id 全选框id 默认值：checkAll
	 */
	addCheckListener : 	function(tbody_id, color, check_name, checkAll_id){
		tbody_id = tbody_id==undefined?'lst_body':tbody_id;
		check_name = check_name==undefined?'check':check_name;
		checkAll_id = checkAll_id==undefined?'checkAll':checkAll_id;
		color = color==undefined?"#D0F2C3":color;
		
		//选中高亮事件
		$("input[name=" + check_name + "]").click(function(){
			if($(this).attr('checked')){
				$(this).parent().parent().css("background",color);
				if($("input[name=" + check_name + "]").size() == $("input[name=" + check_name + "]:checked").size()){
					$("#" + checkAll_id).attr("checked", true);
				}
			}else{
				$(this).parent().parent().css("background","");
				$("#" + checkAll_id).attr("checked", false);
			}
		});
		
		//全选
	    $("#" + checkAll_id).click(function(){
	    	if($(this).attr('checked')){
	    		$("input[name='" + check_name + "']").attr("checked", true);
	    		$("#" + (tbody_id==undefined?'lst_body':tbody_id) + " tr").css("background",color);
	    	}else{
	    		$("input[name='" + check_name + "']").attr("checked", false);
	    		$("#" + tbody_id + " tr").css("background","");
	    	}
	    });
	}

};
