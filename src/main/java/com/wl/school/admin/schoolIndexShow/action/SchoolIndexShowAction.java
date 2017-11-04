package com.wl.school.admin.schoolIndexShow.action;

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
import com.wl.school.admin.schoolIndexShow.model.SchoolIndexShowVo;
import com.wl.school.admin.schoolIndexShow.service.ISchoolIndexShowService;
import com.wl.school.common.utils.SessionUtils;

/*
 * author 王磊
 * 获取后台首页展示信息Action
 * date 2017-2-7
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/schoolIndexShow")
public class SchoolIndexShowAction {

	private static Logger logger = Logger.getLogger(SchoolIndexShowAction.class);
	@Resource
	private ISchoolIndexShowService schoolIndexShowService;
	/**
	 * 获取人员信息列表
	 * @param schoolIndexShowVo
	 * @return
	 */
	@RequestMapping("/getSchoolIndexShowList.ac")
	@ResponseBody
	public Map<String, Object> getSchoolIndexShowList(SchoolIndexShowVo schoolIndexShowVo){
		logger.info("获取首页展示信息");
		Map<String, Object> result = new HashMap<String, Object>();
		int count = schoolIndexShowService.getSchoolIndexShowCount(schoolIndexShowVo);
		List<SchoolIndexShowVo> lstSchoolIndexShowVo = new ArrayList<SchoolIndexShowVo>();
		if(count > 0){
			lstSchoolIndexShowVo = schoolIndexShowService.getSchoolIndexShowList(schoolIndexShowVo);
		}
		result.put("totalCount", count);
		result.put("lstSchoolIndexShowVo", lstSchoolIndexShowVo);
		
		return result;
	}
	
	/**
	 * 根据id获取人员信息对象
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSchoolIndexShowById.ac")
	@ResponseBody
	public SchoolIndexShowVo getSchoolIndexShowById(String id){
		logger.info("根据id获取首页展示信息");

		SchoolIndexShowVo result = schoolIndexShowService.getSchoolIndexShowById(id);
		
		return result;
	}
	
	/**
	 * 增加人员信息
	 * @param schoolIndexShowVo
	 * @return
	 */
	@RequestMapping("/addSchoolIndexShow.ac")
	@ResponseBody
	public int addSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		logger.info("新增首页展示信息");
		int result = 0;
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		schoolIndexShowVo.setCreateUser(currentUser.getId());
		result = schoolIndexShowService.addSchoolIndexShow(schoolIndexShowVo);
		
		return result;
	}
	
	/**
	 * 删除人员信息
	 */
	@RequestMapping("/deleteSchoolIndexShow.ac")
	@ResponseBody
	public int deleteSchoolIndexShow(@RequestParam("ids[]")List<String> ids){
		logger.info("删除首页展示信息");
		int result = 0;
		result = schoolIndexShowService.deleteSchoolIndexShow(ids);
		return result;
	}
	
	/**
	 * 发布人员信息
	 */
	@RequestMapping("/commitSchoolIndexShow.ac")
	@ResponseBody
	public int commitSchoolIndexShow(@RequestParam("ids[]")List<String> ids){
		logger.info("发布首页展示信息");
		int result = 0;
		result = schoolIndexShowService.commitSchoolIndexShow(ids);
		return result;
	}
	
	/**
	 * 更新人员信息
	 * @param schoolIndexShowVo
	 * @return
	 */
	@RequestMapping("/updateSchoolIndexShow.ac")
	@ResponseBody
	public int updateSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		logger.info("更新首页展示信息");
		int result = 0;
		result = schoolIndexShowService.updateSchoolIndexShow(schoolIndexShowVo);
		return result;
	}
}
