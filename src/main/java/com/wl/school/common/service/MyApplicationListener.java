package com.wl.school.common.service;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyApplicationListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		//设置代码目录和网站根目录
		ProjectPath.setProjectPathName(servletContextEvent.getServletContext().getRealPath("/"));  //D:\JavaCode\works\wl\Web\
		ProjectPath.setWebRoot(servletContextEvent.getServletContext().getContextPath());  // /wl
		//设置mybatis路径(貌似一定要放到class里才行,整合到spring了)
		//ProjectPath.setMybatisConfPath(servletContextEvent.getServletContext().getInitParameter("mybatisConfPath"));
		//初始化总访问量
		TotalVisterCounter.initTotalVisterNum();
		//初始化log4j（整合到spring，可以省略这步了）
		/*System.setProperty("projectPath", servletContextEvent.getServletContext().getRealPath("/")); //配置文件中要用到
		String log4jPro = servletContextEvent.getServletContext().getInitParameter("log4jProper");
		PropertyConfigurator.configure(servletContextEvent.getServletContext().getRealPath("/") + log4jPro);*/
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {
		//关闭时保存访问量数据
		TotalVisterCounter.saveDataWhenShutDown();
	}

}
