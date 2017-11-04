package com.wl.school.custom.schoolPersonInfo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.schoolPersonInfo.model.SchoolPersonInfoVo;
import com.wl.school.custom.schoolPersonInfo.service.SchoolPersonInfoCustomService;

/*
 * author 王磊
 * 获取首页人员信息信息Action
 * date 2016-12-30
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/custom/schoolPersonInfo")
public class SchoolPersonInfoCustomAction {

	private static Logger logger = Logger.getLogger(SchoolPersonInfoCustomAction.class);
	@Resource
	SchoolPersonInfoCustomService schoolPersonInfoCustomService;
	
	/**
	 * 首页获取最近的人员信息消息标题
	 * @return
	 */
	@RequestMapping("/getSchoolLastestPersonInfo.ac")
	@ResponseBody
	public Map<String, Object> getSchoolLastestPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		logger.info("获取学校人员信息");
		Map<String, Object> result = new HashMap<String, Object>();
		List<SchoolPersonInfoVo> lstSchoolPersonInfoVo = schoolPersonInfoCustomService.getSchoolLastestPersonInfo(schoolPersonInfoVo);
		result.put("lstSchoolPersonInfoVo", lstSchoolPersonInfoVo);
		return result;
	}
	
	/**
	 * 获取人员信息列表
	 * @param schoolPersonInfoVo
	 * @return
	 */
	@RequestMapping("/getSchoolPersonInfoList.ac")
	@ResponseBody
	public Map<String, Object> getSchoolPersonInfoList(SchoolPersonInfoVo schoolPersonInfoVo){
		logger.info("获取学校人员信息");
		Map<String, Object> result = new HashMap<String, Object>();
		int count = schoolPersonInfoCustomService.getSchoolPersonInfoCount(schoolPersonInfoVo);
		List<SchoolPersonInfoVo> lstSchoolPersonInfoVo = new ArrayList<SchoolPersonInfoVo>();
		if(count > 0){
			lstSchoolPersonInfoVo = schoolPersonInfoCustomService.getSchoolPersonInfoList(schoolPersonInfoVo);
		}
		result.put("totalCount", count);
		result.put("lstSchoolPersonInfoVo", lstSchoolPersonInfoVo);
		return result;
	}
	
	/**
	 * 根据id获取人员信息对象
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSchoolPersonInfoById.ac")
	@ResponseBody
	public SchoolPersonInfoVo getSchoolPersonInfoById(String id){
		logger.info("根据id获取学校人员信息");
		SchoolPersonInfoVo result = schoolPersonInfoCustomService.getSchoolPersonInfoById(id);
		return result;
	}
}
