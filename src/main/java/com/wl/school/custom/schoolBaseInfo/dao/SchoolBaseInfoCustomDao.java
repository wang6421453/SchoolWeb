package com.wl.school.custom.schoolBaseInfo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;
import com.wl.school.common.dao.BaseDao;

@Repository
public class SchoolBaseInfoCustomDao extends BaseDao<SchoolBaseInfoVo>{

    //private static Logger logger = Logger.getLogger(SchoolBaseInfoDao.class);
	
	/**
     * 获取最近发布基本信息
     * @return  最新基本信息实体集合
     */
	public List<SchoolBaseInfoVo> getSchoolLastestBaseInfo(String statement, SchoolBaseInfoVo schoolBaseInfoVo){
		List<SchoolBaseInfoVo> lstSzcloudUserVO = this.selectList(statement, schoolBaseInfoVo);
		return lstSzcloudUserVO;
	}
	
	/**获取基本信息列表*/
	public List<SchoolBaseInfoVo> getSchoolBaseInfoList(String statement, SchoolBaseInfoVo schoolBaseInfoVo){
		List<SchoolBaseInfoVo> lstSzcloudUserVO = this.selectList(statement, schoolBaseInfoVo);		
		return lstSzcloudUserVO;
	}
	
	/**根据id获取基本信息对象*/
	public SchoolBaseInfoVo getSchoolBaseInfoById(String statement, String id){
		SchoolBaseInfoVo lstSzcloudUserVO = this.selectById(statement, id);		
		return lstSzcloudUserVO;
	}
	
	/**
     * 获取最近发布基本信息数量
     * @return  数量
     */
	public int getSchoolBaseInfoCount(String statement, SchoolBaseInfoVo schoolBaseInfoVo){
		return this.selectCount(statement, schoolBaseInfoVo);
	}
	
}
