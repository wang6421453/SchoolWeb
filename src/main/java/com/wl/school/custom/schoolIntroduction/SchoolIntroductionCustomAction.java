package com.wl.school.custom.schoolIntroduction;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.schoolIntroduction.action.SchoolIntroductionAction;
import com.wl.school.admin.schoolIntroduction.model.SchoolIntroductionVo;
import com.wl.school.admin.schoolIntroduction.service.ISchoolntroductionService;

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/custom/schoolIntroduction")
public class SchoolIntroductionCustomAction {

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
}
