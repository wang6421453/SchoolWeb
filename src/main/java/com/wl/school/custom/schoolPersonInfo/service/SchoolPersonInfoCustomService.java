package com.wl.school.custom.schoolPersonInfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.school.admin.schoolPersonInfo.model.SchoolPersonInfoVo;
import com.wl.school.custom.schoolPersonInfo.dao.SchoolPersonInfoCustomDao;

@SuppressWarnings("restriction")
@Service
public class SchoolPersonInfoCustomService {

	@Resource
    private SchoolPersonInfoCustomDao dao;
    
	/**
     * 获取最近发布人员信息
     * @return  最新人员信息实体集合
     */
	
	public List<SchoolPersonInfoVo> getSchoolLastestPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolLastestPersonInfo";
		return dao.selectList(statement, schoolPersonInfoVo);
	}
	
	/**获取人员信息列表*/
	public List<SchoolPersonInfoVo> getSchoolPersonInfoList(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoList";
		return dao.selectList(statement, schoolPersonInfoVo);
	}
	
	/**根据id获取人员信息对象*/
	public SchoolPersonInfoVo getSchoolPersonInfoById(String id){
		//增加点击率
		String statement = "wl.mapping.school.schoolPersonInfoMapper.addClickRate";
		dao.addClickRate(statement, id);
		//获取信息
		statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoById";
		SchoolPersonInfoVo schoolPersonInfoVo = dao.selectById(statement, id);
		
		return schoolPersonInfoVo;
	}
	
	/**
     * 获取人员信息数量
     * @return  数量
     */
	public int getSchoolPersonInfoCount(SchoolPersonInfoVo schoolPersonInfoVo){
		String statement = "wl.mapping.school.schoolPersonInfoMapper.getSchoolPersonInfoCount";
		return dao.selectCount(statement, schoolPersonInfoVo);
	}
	
	
}
