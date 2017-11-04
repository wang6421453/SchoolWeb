package com.wl.school.admin.schoolBaseInfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.schoolBaseInfo.dao.SchoolBaseInfoDao;
import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;
import com.wl.school.admin.schoolBaseInfo.service.ISchoolBaseInfoService;

@SuppressWarnings("restriction")
@Service
public class SchoolBaseInfoService implements ISchoolBaseInfoService{

	@Resource
    private SchoolBaseInfoDao dao;
	
	/**获取列表*/
	public List<SchoolBaseInfoVo> getSchoolBaseInfoList(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoList";
		return dao.selectList(statement, schoolBaseInfoVo);
	}
	
	/**根据id获取对象*/
	public SchoolBaseInfoVo getSchoolBaseInfoById(String id){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoById";
		return dao.selectById(statement, id);
	}
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolBaseInfoCount(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoCount";
		return dao.selectCount(statement, schoolBaseInfoVo);
	}
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.addSchoolBaseInfo";
		int result = dao.insert(statement, schoolBaseInfoVo);
		return result;
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolBaseInfo(List<String> ids){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.deleteSchoolBaseInfo";
		int result = dao.delete(statement, ids);
		return result;
	}
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolBaseInfo(List<String> ids){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.commitSchoolBaseInfo";
		int result = dao.commitProject(statement, ids);
		return result;
	}
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.updateSchoolBaseInfo";
		int result = dao.update(statement, schoolBaseInfoVo);
		return result;
	}
	
}
