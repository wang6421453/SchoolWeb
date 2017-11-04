package com.wl.school.common.service;

public class ProjectPath {
	//项目路径(D:\JavaCode\works\GetUserInfo\Web\)
	private static String projectPathName ="";
	//网站跟目录(/wl)
	private static String webRoot ="";
	//mybatis配置路径--线上
    //private static String mybatisConfPath ="";

	public static String getProjectPathName() {
		return projectPathName;
	}

	public static void setProjectPathName(String pathName) {
		projectPathName = pathName;
	}

	public static String getWebRoot() {
		return webRoot;
	}

	public static void setWebRoot(String webRoot) {
		ProjectPath.webRoot = webRoot;
	}

	/*public static String getMybatisConfPath() {
		return mybatisConfPath;
	}

	public static void setMybatisConfPath(String mybatisConfPath) {
		ProjectPath.mybatisConfPath = mybatisConfPath;
	}*/
	
	
}
