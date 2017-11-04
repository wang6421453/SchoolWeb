package com.wl.school.custom.schoolBaseInfo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;
import com.wl.school.custom.schoolBaseInfo.service.SchoolBaseInfoCustomService;

/*
 * author 王磊
 * 获取首页基本信息信息Action
 * date 2016-12-30
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/custom/schoolBaseInfo")
public class SchoolBaseInfoCustomAction {

	private static Logger logger = Logger.getLogger(SchoolBaseInfoCustomAction.class);
	@Resource
	SchoolBaseInfoCustomService schoolBaseInfoCustomService;
	
	/**
	 * 首页获取最近的基本信息消息标题
	 * @return
	 */
	@RequestMapping("/getSchoolLastestBaseInfo.ac")
	@ResponseBody
	public Map<String, Object> getSchoolLastestBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		logger.info("获取学校基本信息");
		Map<String, Object> result = new HashMap<String, Object>();
		List<SchoolBaseInfoVo> lstSchoolBaseInfoVo = schoolBaseInfoCustomService.getSchoolLastestBaseInfo(schoolBaseInfoVo);
		result.put("lstSchoolBaseInfoVo", lstSchoolBaseInfoVo);
		return result;
	}
	
	/**
	 * 获取基本信息列表
	 * @param schoolBaseInfoVo
	 * @return
	 */
	@RequestMapping("/getSchoolBaseInfoList.ac")
	@ResponseBody
	public Map<String, Object> getSchoolBaseInfoList(SchoolBaseInfoVo schoolBaseInfoVo){
		logger.info("获取学校基本信息");
		Map<String, Object> result = new HashMap<String, Object>();
		int count = schoolBaseInfoCustomService.getSchoolBaseInfoCount(schoolBaseInfoVo);
		List<SchoolBaseInfoVo> lstSchoolBaseInfoVo = new ArrayList<SchoolBaseInfoVo>();
		if(count > 0){
			lstSchoolBaseInfoVo = schoolBaseInfoCustomService.getSchoolBaseInfoList(schoolBaseInfoVo);
		}
		result.put("totalCount", count);
		result.put("lstSchoolBaseInfoVo", lstSchoolBaseInfoVo);
		return result;
	}
	
	/**
	 * 根据id获取基本信息对象
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSchoolBaseInfoById.ac")
	@ResponseBody
	public SchoolBaseInfoVo getSchoolBaseInfoById(String id){
		logger.info("根据id获取学校基本信息");
		SchoolBaseInfoVo result = schoolBaseInfoCustomService.getSchoolBaseInfoById(id);
		return result;
	}
}
