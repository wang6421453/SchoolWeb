package com.wl.school.admin.schoolBaseInfo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;
import com.wl.school.admin.schoolBaseInfo.service.ISchoolBaseInfoService;
import com.wl.school.common.utils.SessionUtils;

/*
 * author 王磊
 * 获取后台学校基本信息Action
 * date 2017-2-7
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/schoolBaseInfo")
public class SchoolBaseInfoAction {

	private static Logger logger = Logger.getLogger(SchoolBaseInfoAction.class);
	@Resource
	private ISchoolBaseInfoService schoolBaseInfoService;
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
		int count = schoolBaseInfoService.getSchoolBaseInfoCount(schoolBaseInfoVo);
		List<SchoolBaseInfoVo> lstSchoolBaseInfoVo = new ArrayList<SchoolBaseInfoVo>();
		if(count > 0){
			lstSchoolBaseInfoVo = schoolBaseInfoService.getSchoolBaseInfoList(schoolBaseInfoVo);
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

		SchoolBaseInfoVo result = schoolBaseInfoService.getSchoolBaseInfoById(id);
		
		return result;
	}
	
	/**
	 * 增加基本信息
	 * @param schoolBaseInfoVo
	 * @return
	 */
	@RequestMapping("/addSchoolBaseInfo.ac")
	@ResponseBody
	public int addSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		logger.info("新增学校基本信息");
		int result = 0;
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		schoolBaseInfoVo.setCreateUser(currentUser.getId());
		result = schoolBaseInfoService.addSchoolBaseInfo(schoolBaseInfoVo);
		
		return result;
	}
	
	/**
	 * 删除基本信息
	 */
	@RequestMapping("/deleteSchoolBaseInfo.ac")
	@ResponseBody
	public int deleteSchoolBaseInfo(@RequestParam("ids[]")List<String> ids){
		logger.info("删除学校基本信息");
		int result = 0;
		result = schoolBaseInfoService.deleteSchoolBaseInfo(ids);
		return result;
	}
	
	/**
	 * 发布基本信息
	 */
	@RequestMapping("/commitSchoolBaseInfo.ac")
	@ResponseBody
	public int commitSchoolBaseInfo(@RequestParam("ids[]")List<String> ids){
		logger.info("发布学校基本信息");
		int result = 0;
		result = schoolBaseInfoService.commitSchoolBaseInfo(ids);
		return result;
	}
	
	/**
	 * 更新基本信息
	 * @param schoolBaseInfoVo
	 * @return
	 */
	@RequestMapping("/updateSchoolBaseInfo.ac")
	@ResponseBody
	public int updateSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		logger.info("更新学校基本信息");
		int result = 0;
		result = schoolBaseInfoService.updateSchoolBaseInfo(schoolBaseInfoVo);
		return result;
	}
}
