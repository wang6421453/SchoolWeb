/**
 * 分页组建
 * author wl
 * data 2017-01-14
 */

/**
 * 分页组建构造函数
 * @param pagination_id 分页div id(必要)
 * @param loadData 列表重新加载数据function指针（必要，触发事件时调用）
 * @param pageSize : 每页最大数量（可选，默认20）
 * @param linkSize : 链接显示数量（暂时还未用上）
 * @exampe: 
 *     创建实例：
 *       var wl_Pagination = new Wl_Pagination("pagination", loadData, 5);
 *     在loadData获取数据后加载分页组建：
	     wl_Pagination.loadPagination(totalCount);
 * 
 */
function Wl_Pagination(pagination_id, loadData, pageSize, linkSize){
	/**
	 * 分页基本属性
	 */
	this.pageNo = 1; //当前页码
	this.pageSize = (pageSize==undefined ? 20 : pageSize); //每页最大数量
	this.linkSize = (linkSize==undefined ? 5 : linkSize);  //链接显示数量
	this.pagination_id = pagination_id; //分页div的id
	this.loadData = loadData;
};

/**
 * 加载分页组建
 * @param totalCount 总条数(只有第一次调用需要传入)
 */
Wl_Pagination.prototype.loadPagination = function(totalCount){
	var _this = this; //保存this指针，事件函数里使用
	if(totalCount != undefined){
		this.totalCount = totalCount;
	}
	var totalPages = Math.ceil(this.totalCount/this.pageSize);
	var innerHtml ="";
	innerHtml += "<span class='current link'>" + this.pageNo + "</span>";
	if(totalPages > this.pageNo){
		innerHtml += "<a>" + (this.pageNo + 1) + "</a>";
		if(totalPages > this.pageNo + 2){
			innerHtml += "<span>...<span>";	
		}
		if(totalPages > this.pageNo + 1){ //判断是否前面已经绘制了第一页链接
			innerHtml += "<a>" + totalPages + "</a>";
		}
		innerHtml += "<a>下一页 > </a>";
	}
	if(this.pageNo != 1){
		innerHtml = "<a>" + (this.pageNo - 1) + "</a>" + innerHtml;
		if(this.pageNo > 3){
			innerHtml = "<span class='text'>...<span>" + innerHtml;
		}
		if(this.pageNo > 2){ //判断是否前面已经绘制了最后页链接
			innerHtml = "<a>" + 1 + "</a>" + innerHtml;
		}
		innerHtml = "<a>< 上一页</a>" + innerHtml;
	}
	innerHtml += "<span class='text'>总共" + "<span style='color:blue;font-weight:bold'>" + this.totalCount + "</span>条</span>";
	if(totalPages > 1){
		innerHtml += "<span class='text'> 跳转到 <input type='input' name='skipToPageNo' onKeyPress='if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;'/> <span>";
		innerHtml += " <input type='button' name='skip' value='跳转'/> ";
	}
	$("#" + this.pagination_id).html(innerHtml);
	
	//绑定页码和上下一页点击事件
	$("#" + this.pagination_id + " a").click(function(){
		var text = $(this).text();
		if(Number(text)){
			_this.pageNo = Number(text);
		}else if(text == "下一页 > "){
			_this.pageNo++;
		}else if(text == "< 上一页"){
			_this.pageNo--;
		}
		_this.loadData();
	});
	
	//绑定跳转事件
	$("#" + this.pagination_id + " input[name='skip']").click(function(){
		var skipToPageNo = $("#" + _this.pagination_id + " input[name='skipToPageNo']").val();
		if(Number(skipToPageNo)){
			skipToPageNo = Number(skipToPageNo);
			if(skipToPageNo != _this.pageNo && skipToPageNo > 0 && skipToPageNo <= totalPages){
				_this.pageNo = skipToPageNo;
				_this.loadData();
			}
		}
	});
};


