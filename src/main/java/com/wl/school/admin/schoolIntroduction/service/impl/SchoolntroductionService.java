package com.wl.school.admin.schoolIntroduction.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.schoolIntroduction.dao.SchoolIntroductionDao;
import com.wl.school.admin.schoolIntroduction.model.SchoolIntroductionVo;
import com.wl.school.admin.schoolIntroduction.service.ISchoolntroductionService;

@SuppressWarnings("restriction")
@Service
@Transactional
public class SchoolntroductionService implements ISchoolntroductionService{

	@Resource
    private SchoolIntroductionDao dao;	
	
	/**获取学校简介*/
	public SchoolIntroductionVo getSchoolIntroduction(){
		String statement = "wl.mapping.school.schoolIntroductionMapper.getSchoolIntroduction";
		return dao.getSchoolIntroduction(statement);
	}
	
	/**新增学校简介*/
	public int addSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo){
		String statement = "wl.mapping.school.schoolIntroductionMapper.addSchoolIntroduction";
		int result = dao.addSchoolIntroduction(statement, schoolIntroductionVo);
		return result;
	}
	
	/**更新学校简介*/
	public int updateSchoolIntroduction(SchoolIntroductionVo schoolIntroductionVo){
		String statement = "wl.mapping.school.schoolIntroductionMapper.updateSchoolIntroduction";
		int result = dao.updateSchoolIntroduction(statement, schoolIntroductionVo);
		return result;
	}
	
}
