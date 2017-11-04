package com.wl.school.common.service;

import java.io.File;

import com.wl.school.common.utils.TxtHelper;

/*
 * author 王磊
 * 统计总访问量
 */


public class TotalVisterCounter {
	//总访问人数
	private static int totalVisterNum = 0;
	private static String dataPath = ProjectPath.getProjectPathName() + File.separator + "WEB-INF" + File.separator + "data" + File.separator + "visterData.txt";

	public static int getTotalVisterNum() {
		return totalVisterNum;
	}

	public static void addTotalVisterNum() {
		totalVisterNum++;
	}
	
	public static void initTotalVisterNum(){
		
		totalVisterNum = Integer.parseInt(TxtHelper.readTxtFile(dataPath));
	}
	
	public static void saveDataWhenShutDown(){
		TxtHelper.writeTxtFile(dataPath, String.valueOf(totalVisterNum));
	}

}
