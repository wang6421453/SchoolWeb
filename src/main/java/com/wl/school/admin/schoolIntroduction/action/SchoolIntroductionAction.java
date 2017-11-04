package com.wl.school.admin.schoolIntroduction.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.schoolIntroduction.model.SchoolIntroductionVo;
import com.wl.school.admin.schoolIntroduction.service.ISchoolntroductionService;
import com.wl.school.common.utils.SessionUtils;

/*
 * author 王磊
 * 学校简介Action
 * date 2017-1-17
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/schoolIntroduction")
public class SchoolIntroductionAction {

	private static Logger logger = Logger.getLogger(SchoolIntroductionAction.class);
	@Resource
	ISchoolntroductionService schoolntroductionService;
	
	/**
	 * 获取学校简介
	 * @return
	 */
	@RequestMapping("/getSchoolIntroduction.ac")
	@ResponseBody
	public SchoolIntroductionVo getSchoolIntroduction(){
		logger.info("获取学校新闻");

		 SchoolIntroductionVo result = schoolntroductionService.getSchoolIntroduction();
		
		return result;
	}
	
	/**
	 * 新增学校简介
	 * @return
	 */
	@RequestMapping("/addSchoolIntroduction.ac")
	@ResponseBody
	public int addSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo){
		logger.info("新增学校简介");
		int result = 0;
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		schoolIntroductionVo.setCreateUser(currentUser.getId());
		result = schoolntroductionService.addSchoolIntroduction(schoolIntroductionVo);
		return result;
	}
	
	/**
	 * 更新学校简介
	 * @return
	 */
	@RequestMapping("/updateSchoolIntroduction.ac")
	@ResponseBody
	public int updateSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo){
		logger.info("更新学校简介");
		int result = 0;
		result = schoolntroductionService.updateSchoolIntroduction(schoolIntroductionVo);
		return result;
	}
	
}
