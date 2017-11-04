package com.wl.school.admin.schoolIntroduction.dao;


import org.springframework.stereotype.Repository;
import com.wl.school.admin.schoolIntroduction.model.SchoolIntroductionVo;
import com.wl.school.common.dao.BaseDao;

@Repository
public class SchoolIntroductionDao extends BaseDao<SchoolIntroductionVo>{

    //private static Logger logger = Logger.getLogger(SchoolNewsDao.class);	
	
	/**获取学校简介*/
	public SchoolIntroductionVo getSchoolIntroduction(String statement){
		SchoolIntroductionVo schoolIntroductionVo = this.selectOne(statement);
		return schoolIntroductionVo;
	}
	
	/**新增学校简介*/
	public int addSchoolIntroduction(String statement, SchoolIntroductionVo schoolIntroductionVo){
		return this.insert(statement, schoolIntroductionVo);
	}
	
	/**更新学校简介*/
	public int updateSchoolIntroduction(String statement, SchoolIntroductionVo schoolIntroductionVo){
		return this.update(statement, schoolIntroductionVo);
	}
	
}
