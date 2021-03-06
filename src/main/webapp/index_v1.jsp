<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<meta charset="UTF-8"/> 
<html>
<head>
<title>田畈街镇中学</title>

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=webRoot%>/css/wl.css">
<script src="<%=webRoot%>/js/dropdownmenu.js"></script>
</head>

<body>
   <div class="main">
      <div class="top">
         <div class="logo">
            <a href="<%=webRoot%>/index.jsp"><img alt="华南理工大学 首页" src="./img/logo.png"/></a>
         </div>
         <div class="topLink">
            <a href="">电子邮件</a>
            <a href="">办公门户</a>
         </div>
      </div>
      
      <div class="menu">
       <div class="mainMenu" id="mainMenu">
         <ul>
            <li><a href="">首页</a></li>
            <li><a href="" rel="dropmenu1">学校概况</a></li>
            <li><a href="" rel="dropmenu2">新闻中心</a></li>
            <li><a href="" rel="dropmenu3">师生天地</a></li>
            <li><a href="" rel="dropmenu4">辉煌成就</a></li>
            <li><a href="" rel="dropmenu5">招生专栏</a></li>
            <li><a href="" rel="dropmenu6">高考在线</a></li>
         </ul>
       </div>
       <div class="dropmenuDiv" id="dropmenu1">
          <a href="">学校简介</a>
          <a href="">现任领导</a>
          <a href="">学校特色</a>
       </div>
       <div class="dropmenuDiv" id="dropmenu2">
          <a href="">及时新闻</a>
          <a href="">公告通知</a>
          <a href="">校务公开</a>
       </div>
       <div class="dropmenuDiv" id="dropmenu3">
          <a href="">教学教研</a>
          <a href="">名师风采</a>
          <a href="">校园之星</a>
       </div>
       <div class="dropmenuDiv" id="dropmenu4">
          <a href="">集体荣誉</a>
          <a href="">教师荣誉</a>
          <a href="">学生荣誉</a>
       </div>
       <div class="dropmenuDiv" id="dropmenu5">
          <a href=""></a>
          <a href="">招生简章</a>
          <a href="">招生政策</a>
          <a href="">招生咨询</a>
       </div>
       <div class="dropmenuDiv" id="dropmenu6">
          <a href="">高考新闻</a>
          <a href="">高考答疑</a>
       </div>
      </div>
      
      <div class="show_window">
         <ul class="focus-box">
	         <li class="curr_pic">
	             <a href=""><img src="upload/showWindow/1.jpg" title="【第197期】北湖风光" alt="【第197期】北湖风光" width=100% height=300px/></a>
	         </li>
	         <li>
	             <a href=""><img src="upload/showWindow/2.jpg" title="【第197期】北湖风光" alt="【第197期】北湖风光" width=100% height=300px/></a>
	         </li>
	         <li>
	             <a href=""><img src="upload/showWindow/3.jpg" title="【第197期】北湖风光" alt="【第197期】北湖风光" width=100% height=300px/></a>
	         </li>
	         <li>
	             <a href=""><img src="upload/showWindow/4.jpg" title="【第197期】北湖风光" alt="【第197期】北湖风光" width=100% height=300px/></a>
	         </li>
	         <li>
	             <a href=""><img src="upload/showWindow/5.jpg" title="【第197期】北湖风光" alt="【第197期】北湖风光" width=100% height=300px/></a>
	         </li>
         </ul>
         <div class="focus-pagination">
             <a class="focus-page focus-page-active"><span>1</span></a>
             <a class="focus-page"><span>2</span></a>
             <a class="focus-page"><span>3</span></a>
             <a class="focus-page"><span>4</span></a>
             <a class="focus-page"><span>5</span></a>
         </div>
      </div>
      
      <div class="content">
          <div class="indexLeft">
	         <div class="school_introduction">
	                <div class="title">
	                   <b>学校简介</b>
	                   <span><a href="">详细》</a></span>
	                </div>
	                <div class="infoBox">
	                  <div align="center"><a href=""><img border="0" src="img/school.gif" width="240" height="57"></a></div>
	                  <div >
	                       &nbsp; &nbsp;田畈街中学创办于1958年，学校位于鄱北中心城市田畈街镇，占地面积60余亩，地理位置优越，交通便捷，校园树林葱郁，环境优雅。学校拥有宏伟壮观的教学楼、实验楼、学生公寓、学生食堂，有多媒体阶梯教室、微机室、语音室、图书室、阅览室、标准田径场、水泥篮球场等教学和生活设施。新艺术大楼即将动工兴建，将为学生的学习和生活创建更加美好的硬件条件。
	                  </div>
	                </div>
	          </div>
	          <div class="school_news">
	                <div class="title">
	                   <b>学校要闻</b>
	                   <span><a href="">进入新闻网》</a></span>
	                </div>
	                <div class="infoBox">
	                  <ul class="schoolNewsList">
	                      <!-- <li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
	                      <li>
	                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
	                      </li>
	                      <li>
	                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
	                      </li> -->
	                   </ul>
	                </div>
             </div>
             <div class="affairs">
                <div class="title">
                   <b>校务公开</b>
                   <span><a href="">更多》</a></span>
                </div>
                <div class="infoBox">
                  <ul class="notesList">
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                   </ul>
                </div>
             </div>
             
          </div>
          <div class="indexRight">
             <div class="digit_school">
                <div class="title">数字校园</div>
                <div class="digit_school_content">
                    <li>
                        <a href=""><img src="img/icon_mail.jpg"></img></a>
                        <h3><a href="">校长信箱</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_work_platform.jpg"></img></a>
                        <h3><a href="">办公平台</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_blog.jpg"></img></a>
                        <h3><a href="">校园博客</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_techer_res.jpg"></img></a>
                        <h3><a href="">教学资源</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_library.jpg"></img></a>
                        <h3><a href="">数字图书馆</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_small_class.jpg"></img></a>
                        <h3><a href="">校园微课</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_student_works.jpg"></img></a>
                        <h3><a href="">学生作品</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_friendship.jpg"></img></a>
                        <h3><a href="">校友联谊</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_class_blog.jpg"></img></a>
                        <h3><a href="">班级博客</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_home_school.jpg"></img></a>
                        <h3><a href="">家校平台</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_techer_forum.jpg"></img></a>
                        <h3><a href="">教师论坛</a></h3>
                    </li>
                    <li>
                        <a href=""><img src="img/icon_school_magazine.jpg"></img></a>
                        <h3><a href="">《拙诚》</a></h3>
                    </li>
                    
                </div>
             </div>
             <div class="clearBoth"></div>
             <div class="teach_feature">
                <div class="title">
                   <b>教学特色</b>
                   <span><a href="">更多》</a></span>
                </div>
                <div class="infoBox">
                  <ul class="teach_feature_list">
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                      <li>
                         <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                      </li>
                   </ul>
                </div>
             </div>
          </div>
          <div class="clearBoth"></div>
      </div>
      
      <div class="teacher_studets_show">
          <div class="title">
             <div style="float:left;width:400px;border-top:2px solid blue;margin-top:15px"></div>
             <div style="float:left;width:150;padding-left:50px">
                 <h1>名师风采</h1>
             </div>
             <div style="float:right;width:400px;border-top:2px solid blue;margin-top:15px"></div>
          </div>
	      <div class="teachers">
	        <ul>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241439440001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241446070001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241447470001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241458250001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241459550001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241500490001.gif" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241501080001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241501270001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241501270001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241501270001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	         <li>
		         <a href="">
		            <img src="upload/teachers/201403241439440001.jpg" width=105 height=136px>
		         </a>
		         <strong></strong>
		         <em>数学特级教</em>
	         </li>
	        </ul>
	      </div>
	      <div class="clearBoth"></div>
      </div>
      
      <div class="three_col">
         <div class="schoolmaster_said">
            <div class="title">
                 <b>校长寄语</b>
                 <span><a href="">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="schoolNewsList">
                    <!-- <li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li> -->
                 </ul>
	         </div>
         </div>
         <div class="collegeExamin_online">
             <div class="title">
                 <b>高考在线</b>
                 <span><a href="">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="schoolNewsList">
                    <!-- <li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li> -->
                 </ul>
	         </div>
         </div>
         <div class="recruitStudent">
             <div class="title">
                 <b>招生专栏</b>
                 <span><a href="">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="schoolNewsList">
                    <!-- <li><a href="" target="_blank">华南理工大学“两学一做”学习教育网</a></li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li>
                    <li>
                       <a href="" target="_blank">华南理工大学“两学一做”学习教育网</a>
                    </li> -->
                 </ul>
	         </div>
         </div>  
      </div>
      
      <div class="teacher_studets_show">
          <div class="title">
             <div style="float:left;width:400px;border-top:2px solid red;margin-top:15px"></div>
             <div style="float:left;width:150;padding-left:50px">
                 <h1>校园之星</h1>
             </div>
             <div style="float:right;width:400px;border-top:2px solid red;margin-top:15px"></div>
          </div>
	      <div class="students">
		        <ul>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241439440001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241446070001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241447470001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241458250001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241459550001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241500490001.gif" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		         <li>
			         <a href="">
			            <img src="upload/teachers/201403241501080001.jpg" width=105 height=136px>
			         </a>
			         <strong></strong>
			         <em>数学特级教</em>
		         </li>
		        </ul>
		      </div>
	  </div>  
	  
	  <div class="friend_link">
	      <span>友情链接:</span>
	      <ul>
	         <li><a href="">南昌大学</a></li>
	         <li><a href="http://www.scut.edu.cn/new/" target="_blank">华南理工大学</a></li>
	      </ul>
	  </div>
	  
      <div class="footer">
          <i>wl 版权所有 翻版必究  地址：广东省深圳西丽大学城</i>
      </div>
   
   </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/my/wl.js?ver=1"></script>
</html>