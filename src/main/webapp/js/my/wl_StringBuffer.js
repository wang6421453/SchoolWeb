/**
 * 字符串StringBuffer类
 * author wl
 * data 2017-01-15
 */

/**
 * 构造函数
 * string : 初始化字符串
 */
function Wl_StringBuffer(string){
	this._string = new Array();
	if(string != undefined){
		this._string.push(string);
	}
};

/**
 * append方法
 */
Wl_StringBuffer.prototype.append = function(string){
	this._string.push(string);
	return this;
};

/**
 * toString方法
 */
Wl_StringBuffer.prototype.toString = function(){
	return this._string.join("");
};
