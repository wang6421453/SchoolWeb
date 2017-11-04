<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"  language="java" %>
<%@ include file="/base.jsp" %>
<html>
<head>
<meta charset="UTF-8"/> 
<title>田畈街镇中学</title>
<link rel="stylesheet" href="<%=webRoot%>/css/wl.css?v=5">
</head>

<body>
   <div class="main">
      
      <jsp:include page="headFrame.jsp" flush="true"/>
       
      <div class="show_window">
         <ul class="focus-box">
         </ul>
         <div class="focus-pagination">
         </div>
         <a class="focus-navigation focus-prev"></a>
         <a class="focus-navigation focus-next"></a>
      </div>
      
      <div class="content">
          <div class="indexLeft">
	         <div class="school_introduction">
	                <div class="title">
	                   <b>学校简介</b>
	                   <span><a href="custom/schoolIntroductionDetail.jsp" target='_blank'>详细》</a></span>
	                </div>
	                <div class="infoBox" id='school_introduction'>
	                    
	                </div>
	          </div>
	          <div class="school_news">
	                <div class="title">
	                   <b>及时新闻</b>
	                   <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=xwzx,jsxw,">更多》</a></span>
	                </div>
	                <div class="infoBox" style="padding: 0px 0 0 9px">
	                  <ul class="schoolNewsList">
	                   </ul>
	                </div>
             </div>
             <div class="affairs">
                <div class="title">
                   <b>校务公开</b>
                   <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=xwzx,xwgk,">更多》</a></span>
                </div>
                <div class="infoBox">
                  <ul class="schoolAffairsList">
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
             <div class="school_feature">
                <div class="title">
                   <b>学校特色</b>
                   <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=xxgk,xxts,">更多》</a></span>
                </div>
                <div class="infoBox">
                  <ul class="schoolFeatureList">
                      
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
	        <ul id="teachersList">	         
	        </ul>
	        <a class="focus-navigation focus-prev"></a>
            <a class="focus-navigation focus-next"></a>
	      </div>
	      <div class="clearBoth"></div>
      </div>
      
      <div class="three_col">
         <div class="brilliant_achievements">
            <div class="title">
                 <b>辉煌成就</b>
                 <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=hhcj,">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="brilliantAchievementsList">
                 </ul>
	         </div>
         </div>
         <div class="collegeExamin">
             <div class="title">
                 <b>高考在线</b>
                 <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=gkzj,">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="collegeExaminList">
                 </ul>
	         </div>
         </div>
         <div class="recruitStudent">
             <div class="title">
                 <b>招生专栏</b>
                 <span><a href="custom/schoolBaseInfoDetailList.jsp?businessType=zszl,">更多》</a></span>
            </div>
            <div class="infoBox">
                <ul class="recruitStudentList">
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
	         <ul id="studentsList">
	         </ul>
	         <a class="focus-navigation focus-prev"></a>
             <a class="focus-navigation focus-next"></a>
		  </div>
	  </div> 
	  <jsp:include page="footFrame.jsp" flush="true"/>
   </div>
</body>
<script src="<%=webRoot%>/js/jquery-1.8.2.js"></script>
<script src="<%=webRoot%>/js/my/wl_util.js?ver=2"></script>
<script src="<%=webRoot%>/js/my/wl_StringBuffer.js"></script>
<script src="<%=webRoot%>/js/my/wl.js?ver=9"></script>
</html>