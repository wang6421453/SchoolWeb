/**
 * 主js
 * author wl
 * data 2016-05-19
 */

$(function(){
	init();
	//初始化翻页连接
	$(".show_window, .teachers, .students").hover(function(){
		var number = $(this).find("li").length;
		if(number > 8 || ($(this).hasClass("show_window") && number > 1) )
		$(this).children('.focus-navigation').css("display","block");
	},function(){
		$(".focus-navigation").css("display","none");
	});
});

function init(){
	school.startShowWindow();
	school.startTeachersShow();
	school.startStudentsShow();
	school.getSchoolLastestNews();
	school.getSchoolIntroduction();
	school.getSchoolLastestAffairs();
	school.getSchoolLastestFeature();
	school.getSchoolMasterSaid();
	school.getCollegeExamin();
	school.getRecruitStudentList();
}

var school ={
		
	name: "田畈街镇中学",
	showWindowClock:{}, //图片展示定时器id
	teachersShowClock:{}, //老师风采定时器id
	studentsShowClock:{}, //学生风采定时器id
	teacherShowDirection:0, //老师风采滚动方向（0：不动，1：向右，-1：向左）
	teacherShowRightOutNumber:0, //老师风采右边未显示的数量
	studentsShowDirection:0, //学生风采滚动方向（0：不动，1：向右，-1：向左）
	studentsShowRightOutNumber:0, //学生风采右边未显示的数量
	
	//开始循环播放
	startShowWindow:function(){
		school.initSchoolIndexShow("index,show,", ".focus-box", ".focus-pagination", function(){
			school.showWindowClock = setInterval(function(){
				school.switchShowWindowPic();
			  }, 3000);
			//绑定点击事件
			$(".focus-page").click(function(){
				clearInterval(school.showWindowClock);
				school.switchShowWindowPic($(this), $(this).text());
			});
			$(".show_window .focus-prev").click(function(){
				clearInterval(school.showWindowClock);
				school.switchShowWindowPic($(this), undefined, "prev");
			});
			$(".show_window .focus-next").click(function(){
				clearInterval(school.showWindowClock);
				school.switchShowWindowPic($(this), undefined, "next");
			});
		});
		
	},
    
	//切换图片（p:点击的this,n：页码, d:方向（next,prev））
    switchShowWindowPic:function(p, n, d){
    	var currPage = $(".focus-page-active");
    	var ulBox = $(".focus-box");
    	if(n != undefined){ //点击页码
    		currPage.removeClass("focus-page-active");
    		p.addClass("focus-page-active");
    		ulBox.animate({"left":(n-1) * -1000 + "px"}, "slow");
    		school.showWindowClock = setInterval(function(){
    			school.switchShowWindowPic();
    		  }, 3000);
    		return;
    	}
    	//自动切换或点击上下页
    	if(d == "next" || d == undefined){
    		school.switchNextShowWindowPic();
    	}else if(d == "prev"){
    		school.switchPrevShowWindowPic();
    	}
    	if(d != undefined){
    		school.showWindowClock = setInterval(function(){
			school.switchShowWindowPic();
		    }, 3000);
    	}
    },
    switchNextShowWindowPic : function(){
    	var currPage = $(".focus-page-active");
    	var ulBox = $(".focus-box");
    	if(currPage.next().length > 0){
    		currPage.next().addClass("focus-page-active");
    		currPage.removeClass("focus-page-active");
    		ulBox.animate({"left":"-=1000px"}, "slow");
    	}else{
    		currPage.siblings().eq(0).addClass("focus-page-active");
    		currPage.removeClass("focus-page-active");
    		ulBox.animate({"left":"0"}, "slow");
    	}
    	
    },
    switchPrevShowWindowPic : function(){
    	var currPage = $(".focus-page-active");
    	var ulBox = $(".focus-box");
    	if(currPage.prev().length > 0){
    		currPage.prev().addClass("focus-page-active");
    		currPage.removeClass("focus-page-active");
    		ulBox.animate({"left":"+=1000px"}, "slow");
    	}else{
    		/*currPage.siblings().last().addClass("focus-page-active");
    		currPage.removeClass("focus-page-active");
    		ulBox.animate({"left":"0"}, "slow");*/
    	}
    },
    //初始化首页展示图片
    initSchoolIndexShow : function(businessType, listDiv, pageDiv, callback){
    	$.post(webRoot + "/wl/school/custom/schoolIndexShow/getSchoolLastestIndexShow.ac", {"businessType" : businessType},
				function(result) {
					var lstSchoolIndexShowVo = result.lstSchoolIndexShowVo;
					//<li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
					var length = lstSchoolIndexShowVo.length;
					var sb = new Wl_StringBuffer();
					var sbPage = new Wl_StringBuffer();
					for(var i = 0; i < length; i++){
						var title = lstSchoolIndexShowVo[i].title;
						if(i == 0){
							sb.append("<li class='curr_pic'>");
							sbPage.append("<a class='focus-page focus-page-active'><span>" + (i+1) + "</span></a>");
						}else{
							sb.append("<li>");
							sbPage.append("<a class='focus-page'><span>" + (i+1) + "</span></a>");
						}
						
						sb.append("<a href='custom/schoolIndexShowDetail.jsp?id=" + lstSchoolIndexShowVo[i].id + "&businessType=" + lstSchoolIndexShowVo[i].businessType +  "' target='_blank'>");
						sb.append("<img src=" + lstSchoolIndexShowVo[i].showPic + " width=100% height=300px title=" + title+ " alt="+ title + ">");
						sb.append("</a>");
						sb.append("</li>");
						
					}
					$(listDiv).html(sb.toString());
					$(pageDiv).html(sbPage.toString());
					callback();
		});
    },
    //教师风采
    startTeachersShow:function(){
    	//初始化
    	school.initSchoolPerson('sstd,msfc,', "#teachersList", function(){
    		var ulBox = $(".teacher_studets_show .teachers ul");
        	var number = ulBox.children().length;
        	school.teacherShowRightOutNumber = number - 8;
        	//125是每张图片占的宽度，1000是展示窗口的宽度，当偏移距离大于超出部分就开始反向
        	if(school.teacherShowRightOutNumber > 0){
        		school.teacherShowDirection = 1;
        	}
        	if(school.teacherShowDirection == 1){
        		school.teachersShowClock = setInterval(function(){
        			school.switchTeachersShowPic();
        		  }, 3000);
        	}else{
        		var marginSize = (1000 - 105 * number) /(2 * number);
        		$(".teacher_studets_show .teachers ul li").css("margin","0 " + marginSize + "px 0 " + marginSize + "px");
        	}
        	
        	//绑定点击事件
        	$(".teachers .focus-prev").click(function(){
				clearInterval(school.teachersShowClock);
				school.switchTeachersShowPic("prev");
			});
			$(".teachers .focus-next").click(function(){
				clearInterval(school.teachersShowClock);
				school.switchTeachersShowPic("next");
			});
    	});
    	
    	
    	
		
    },
    
    //滚动老师照片
    switchTeachersShowPic: function(d){
    	var ulBox = $(".teacher_studets_show .teachers ul");
    	var number = ulBox.children().length;
    	if(d == "next"){
    		if(school.teacherShowRightOutNumber > 0){
    			school.teacherShowRightOutNumber--;
    			ulBox.animate({"left":"-=125px"}, "slow");
    		}
    	}else if(d == "prev"){
    		if((number - 8 - school.teacherShowRightOutNumber) > 0){
    			school.teacherShowRightOutNumber++;
    		    ulBox.animate({"left":"+=125px"}, "slow");
    		}
    	}else{
    		//114是每张图片占的宽度，1000是展示窗口的宽度，当偏移距离大于超出部分就开始反向
        	if((school.teacherShowRightOutNumber <= 0 && school.teacherShowDirection == 1) || ((number - 8 - school.teacherShowRightOutNumber) <= 0 && school.teacherShowDirection == -1)){
        		school.teacherShowDirection = -school.teacherShowDirection;
        	}
        	if(school.teacherShowDirection == 1){
        		school.teacherShowRightOutNumber--;
        		ulBox.animate({"left":"-=125px"}, "slow");
        	}else if(school.teacherShowDirection == -1){
        		school.teacherShowRightOutNumber++;
        		ulBox.animate({"left":"+=125px"}, "slow");
        	}
    	}
    	if(d != undefined){
    		school.teachersShowClock = setInterval(function(){
			school.switchTeachersShowPic();
		    }, 3000);
    	}
    },
    
    //学生风采
    startStudentsShow:function(){
    	//初始化
    	school.initSchoolPerson('sstd,xyzx,', "#studentsList", function(){
    		var ulBox = $(".teacher_studets_show .students ul");
        	var number = ulBox.children().length;
        	school.studentsShowRightOutNumber = number - 8;
        	//125是每张图片占的宽度，1000是展示窗口的宽度，当偏移距离大于超出部分就开始反向
        	if(school.studentsShowRightOutNumber > 0){
        		school.studentsShowDirection = 1;
        	}
        	if(school.studentsShowDirection == 1){
        		school.studentsShowClock = setInterval(function(){
        			school.switchStudentsShowPic();
        		  }, 3000);
        	}else{
        		var marginSize = (1000 - 105 * number) /(2 * number);
        		$(".teacher_studets_show .students ul li").css("margin","0 " + marginSize + "px 0 " + marginSize + "px");
        	}
        	
        	//绑定点击事件
        	$(".students .focus-prev").click(function(){
				clearInterval(school.studentsShowClock);
				school.switchStudentsShowPic("prev");
			});
			$(".students .focus-next").click(function(){
				clearInterval(school.studentsShowClock);
				school.switchStudentsShowPic("next");
			});
    	});
    	
    	
    },
    
    //滚动学生照片
    switchStudentsShowPic: function(d){
    	var ulBox = $(".teacher_studets_show .students ul");
    	var number = ulBox.children().length;
    	if(d == "next"){
    		if(school.studentsShowRightOutNumber > 0){
    			school.studentsShowRightOutNumber--;
    			ulBox.animate({"left":"-=125px"}, "slow");
    		}
    	}else if(d == "prev"){
    		if((number - 8 - school.studentsShowRightOutNumber) > 0){
    			school.studentsShowRightOutNumber++;
    		    ulBox.animate({"left":"+=125px"}, "slow");
    		}
    	}else{
	    	//114是每张图片占的宽度，1000是展示窗口的宽度，当偏移距离大于超出部分就开始反向
	    	if((school.studentsShowRightOutNumber <= 0 && school.studentsShowDirection == 1) || ((number - 8 - school.studentsShowRightOutNumber) <= 0 && school.studentsShowDirection == -1)){
	    		school.studentsShowDirection = -school.studentsShowDirection;
	    	}
	    	if(school.studentsShowDirection == 1){
	    		school.studentsShowRightOutNumber--;
	    		ulBox.animate({"left":"-=125px"}, "slow");
	    	}else if(school.studentsShowDirection == -1){
	    		school.studentsShowRightOutNumber++;
	    		ulBox.animate({"left":"+=125px"}, "slow");
	    	}
    	}
    	if(d != undefined){
    		school.studentsShowClock = setInterval(function(){
			school.switchStudentsShowPic();
		    }, 3000);
    	}
    },
    
    //初始化学校的人员（名师风采，校园之星等）
    initSchoolPerson : function(businessType, listDiv, callback){
    	$.post(webRoot + "/wl/school/custom/schoolPersonInfo/getSchoolLastestPersonInfo.ac", {"businessType" : businessType},
				function(result) {
					var lstSchoolPersonInfoVo = result.lstSchoolPersonInfoVo;
					//<li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
					var length = lstSchoolPersonInfoVo.length;
					var sb = new Wl_StringBuffer();
					for(var i = 0; i < length; i++){
						var title = lstSchoolPersonInfoVo[i].title;
						sb.append("<li>");
						sb.append("<a href='custom/schoolPersonInfoDetail.jsp?id=" + lstSchoolPersonInfoVo[i].id + "&businessType=" + lstSchoolPersonInfoVo[i].businessType +  "' target='_blank'>");
						sb.append("<img src=" + lstSchoolPersonInfoVo[i].headPic + " width=105 height=136px>");
						sb.append("</a>");
						sb.append("<strong></strong>");
						sb.append("<em>" + title + "</em>");
						sb.append("</li>");
					}
					$(listDiv).html(sb.toString());
					callback();
		});
    },
    
    //获取学校简介
	getSchoolIntroduction : function(){
		$.get(webRoot + "/wl/school/custom/schoolIntroduction/getSchoolIntroduction.ac",
			function(result) {
				if(result != null){
					var content = result.content;
					content = content.replace(/<img.*?src=/g, "<img style='height:50px' src=");
				    $("#school_introduction").html(content);
				 }
			});
	},
    
    //获取学校最新新闻
	getSchoolLastestNews: function(){
		school.getSchoolLastestBaseInfo('xwzx,jsxw,', ".schoolNewsList");
	},
	
	//获取学校最新校务
	getSchoolLastestAffairs: function(){
		school.getSchoolLastestBaseInfo('xwzx,xwgk,', ".schoolAffairsList");
	},
	
	//获取学校最新特色
	getSchoolLastestFeature: function(){
		school.getSchoolLastestBaseInfo('xxgk,xxts,', ".schoolFeatureList");
	},
	
	//获取辉煌成就
	getSchoolMasterSaid : function(){
		school.getSchoolLastestBaseInfo('hhcj,', ".brilliantAchievementsList");
	},
	
	//获取高考在线
	getCollegeExamin : function(){
		school.getSchoolLastestBaseInfo('gkzj,', ".collegeExaminList");
	},
	
	//获取招生专栏
	getRecruitStudentList : function(){
		school.getSchoolLastestBaseInfo('zszl,', ".recruitStudentList");
	},
	
	//获取学校信息（重构相同方法）
	getSchoolLastestBaseInfo : function(businessType, listDiv){
		$.post(webRoot + "/wl/school/custom/schoolBaseInfo/getSchoolLastestBaseInfo.ac", {"businessType" : businessType},
				function(result) {
					var lstSchoolBaseInfoVo = result.lstSchoolBaseInfoVo;
					//<li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
					var length = lstSchoolBaseInfoVo.length;
					for(var i = 0; i < length; i++){
						var title = lstSchoolBaseInfoVo[i].title;
						var time = Wl_Util.formatDate(lstSchoolBaseInfoVo[i].commitTime);
						
						$(listDiv).append("<li><a href='custom/schoolBaseInfoDetail.jsp?id=" + lstSchoolBaseInfoVo[i].id + "&businessType=" + lstSchoolBaseInfoVo[i].businessType + "' target='_blank'>" + title + "</a><em>" + time + "</em></li>");
					}
		});
	}

};