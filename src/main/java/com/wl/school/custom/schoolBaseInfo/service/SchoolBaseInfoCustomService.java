package com.wl.school.custom.schoolBaseInfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;
import com.wl.school.custom.schoolBaseInfo.dao.SchoolBaseInfoCustomDao;

@SuppressWarnings("restriction")
@Service
public class SchoolBaseInfoCustomService {

	@Resource
    private SchoolBaseInfoCustomDao dao;
    
	/**
     * 获取最近发布基本信息
     * @return  最新基本信息实体集合
     */
	
	public List<SchoolBaseInfoVo> getSchoolLastestBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolLastestBaseInfo";
		return dao.getSchoolLastestBaseInfo(statement, schoolBaseInfoVo);
	}
	
	/**获取基本信息列表*/
	public List<SchoolBaseInfoVo> getSchoolBaseInfoList(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoList";
		return dao.getSchoolBaseInfoList(statement, schoolBaseInfoVo);
	}
	
	/**根据id获取基本信息对象*/
	public SchoolBaseInfoVo getSchoolBaseInfoById(String id){
		//增加点击率
		String statement = "wl.mapping.school.schoolBaseInfoMapper.addClickRate";
		dao.addClickRate(statement, id);
		//获取信息
		statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoById";
		SchoolBaseInfoVo schoolBaseInfoVo = dao.getSchoolBaseInfoById(statement, id);
		
		return schoolBaseInfoVo;
	}
	
	/**
     * 获取基本信息数量
     * @return  数量
     */
	public int getSchoolBaseInfoCount(SchoolBaseInfoVo schoolBaseInfoVo){
		String statement = "wl.mapping.school.schoolBaseInfoMapper.getSchoolBaseInfoCount";
		return dao.getSchoolBaseInfoCount(statement, schoolBaseInfoVo);
	}
	
	
}
