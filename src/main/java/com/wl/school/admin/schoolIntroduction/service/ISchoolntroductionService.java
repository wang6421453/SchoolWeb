package com.wl.school.admin.schoolIntroduction.service;

import com.wl.school.admin.schoolIntroduction.model.SchoolIntroductionVo;


public interface ISchoolntroductionService {
	
	/**获取学校简介*/
	public SchoolIntroductionVo getSchoolIntroduction();
	
	/**新增学校简介*/
	public int addSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo);
	
	/**更新学校简介*/
	public int updateSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo);
	
}
