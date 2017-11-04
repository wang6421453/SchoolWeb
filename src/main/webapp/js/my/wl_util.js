/**
 * 工具类
 * author wl
 * data 2015-09-28
 */
var Wl_Util ={};
//获取当前时间（yyyy-mm-dd HH:MM:ss）
Wl_Util.getNowFormatDate = function() {
    var date = new Date();
    var currentdate = Wl_Util.formatDate(date);
    return currentdate;
};

Wl_Util.formatFullDate = function(d){
	var date = new Date(d);
	var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var d = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return d;
};

Wl_Util.formatDate = function(d){
	var date = new Date(d);
	var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var d = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return d;
};

Wl_Util.replaceTd = function(content){
	content = content.replace(/<img.*?src=/g, "<img style='height:33px' src="); //缩小图片
	content = content.replace(/<p.*?>/g, "").replace(/<\/p>/g, "").replace(/<br \/>/g, "").replace(/&nbsp; /g, "").replace(/<h\d{1}>/g, "").replace(/<\/h\d{1}>/g, ""); //去掉换行和空格
	return content;
};
