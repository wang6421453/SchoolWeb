package com.wl.school.admin.schoolPersonInfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.schoolPersonInfo.dao.SchoolPersonInfoDao;
import com.wl.school.admin.schoolPersonInfo.model.SchoolPersonInfoVo;
import com.wl.school.admin.schoolPersonInfo.service.ISchoolPersonInfoService;

@SuppressWarnings("restriction")
@Service
public class SchoolPersonInfoService implements ISchoolPersonInfoService{

	@Resource
    private SchoolPersonInfoDao dao;
	
	/**获取列表*/
	public List<SchoolPersonInfoVo> getSchoolPersonInfoList(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoList";
		return dao.selectList(statement, schoolPersonInfoVo);
	}
	
	/**根据id获取对象*/
	public SchoolPersonInfoVo getSchoolPersonInfoById(String id){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoById";
		return dao.selectById(statement, id);
	}
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolPersonInfoCount(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoCount";
		return dao.selectCount(statement, schoolPersonInfoVo);
	}
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.addSchoolPersonInfo";
		int result = dao.insert(statement, schoolPersonInfoVo);
		return result;
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolPersonInfo(List<String> ids){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.deleteSchoolPersonInfo";
		int result = dao.delete(statement, ids);
		return result;
	}
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolPersonInfo(List<String> ids){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.commitSchoolPersonInfo";
		int result = dao.commitProject(statement, ids);
		return result;
	}
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.updateSchoolPersonInfo";
		int result = dao.update(statement, schoolPersonInfoVo);
		return result;
	}
	
}
