package com.wl.school.admin.schoolPersonInfo.action;

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
import com.wl.school.admin.schoolPersonInfo.model.SchoolPersonInfoVo;
import com.wl.school.admin.schoolPersonInfo.service.ISchoolPersonInfoService;
import com.wl.school.common.utils.SessionUtils;

/*
 * author 王磊
 * 获取后台学校人员信息Action
 * date 2017-2-7
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/schoolPersonInfo")
public class SchoolPersonInfoAction {

	private static Logger logger = Logger.getLogger(SchoolPersonInfoAction.class);
	@Resource
	private ISchoolPersonInfoService schoolPersonInfoService;
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
		int count = schoolPersonInfoService.getSchoolPersonInfoCount(schoolPersonInfoVo);
		List<SchoolPersonInfoVo> lstSchoolPersonInfoVo = new ArrayList<SchoolPersonInfoVo>();
		if(count > 0){
			lstSchoolPersonInfoVo = schoolPersonInfoService.getSchoolPersonInfoList(schoolPersonInfoVo);
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

		SchoolPersonInfoVo result = schoolPersonInfoService.getSchoolPersonInfoById(id);
		
		return result;
	}
	
	/**
	 * 增加人员信息
	 * @param schoolPersonInfoVo
	 * @return
	 */
	@RequestMapping("/addSchoolPersonInfo.ac")
	@ResponseBody
	public int addSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		logger.info("新增学校人员信息");
		int result = 0;
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		schoolPersonInfoVo.setCreateUser(currentUser.getId());
		result = schoolPersonInfoService.addSchoolPersonInfo(schoolPersonInfoVo);
		
		return result;
	}
	
	/**
	 * 删除人员信息
	 */
	@RequestMapping("/deleteSchoolPersonInfo.ac")
	@ResponseBody
	public int deleteSchoolPersonInfo(@RequestParam("ids[]")List<String> ids){
		logger.info("删除学校人员信息");
		int result = 0;
		result = schoolPersonInfoService.deleteSchoolPersonInfo(ids);
		return result;
	}
	
	/**
	 * 发布人员信息
	 */
	@RequestMapping("/commitSchoolPersonInfo.ac")
	@ResponseBody
	public int commitSchoolPersonInfo(@RequestParam("ids[]")List<String> ids){
		logger.info("发布学校人员信息");
		int result = 0;
		result = schoolPersonInfoService.commitSchoolPersonInfo(ids);
		return result;
	}
	
	/**
	 * 更新人员信息
	 * @param schoolPersonInfoVo
	 * @return
	 */
	@RequestMapping("/updateSchoolPersonInfo.ac")
	@ResponseBody
	public int updateSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		logger.info("更新学校人员信息");
		int result = 0;
		result = schoolPersonInfoService.updateSchoolPersonInfo(schoolPersonInfoVo);
		return result;
	}
}
