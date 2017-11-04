<%
/* 获取网址webRoot */
String webRoot = request.getContextPath();
if(webRoot.equals("/")) {
	webRoot = "";
}
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+webRoot+"/";

/*  获取当前用户  (使用shiro接管了，不需要页面硬编码了)*/
/* Object userName = request.getSession().getAttribute("adminUser");
String path = request.getRequestURI();
String url = path.substring(webRoot.length());
if(userName == null && !"/admin/login.jsp".equals(url) && url.contains("/admin/")){
	response.sendRedirect(webRoot + "/admin/login.jsp");
} */
%>


<script>
   webRoot = "<%=webRoot%>";
</script>