package com.wl.school.custom.schoolIndexShow.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.school.admin.schoolIndexShow.model.SchoolIndexShowVo;
import com.wl.school.custom.schoolIndexShow.dao.SchoolIndexShowCustomDao;

@SuppressWarnings("restriction")
@Service
public class SchoolIndexShowCustomService {

	@Resource
    private SchoolIndexShowCustomDao dao;
    
	/**
     * 获取最近发布首页展示信息
     * @return  最新首页展示信息实体集合
     */
	
	public List<SchoolIndexShowVo> getSchoolLastestIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolLastestIndexShow";
		return dao.selectList(statement, schoolIndexShowVo);
	}
	
	/**获取首页展示信息列表*/
	public List<SchoolIndexShowVo> getSchoolIndexShowList(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowList";
		return dao.selectList(statement, schoolIndexShowVo);
	}
	
	/**根据id获取首页展示信息对象*/
	public SchoolIndexShowVo getSchoolIndexShowById(String id){
		//增加点击率
		String statement = "wl.mapping.school.schoolIndexShowMapper.addClickRate";
		dao.addClickRate(statement, id);
		//获取信息
		statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowById";
		SchoolIndexShowVo schoolIndexShowVo = dao.selectById(statement, id);
		
		return schoolIndexShowVo;
	}
	
	/**
     * 获取首页展示信息数量
     * @return  数量
     */
	public int getSchoolIndexShowCount(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowCount";
		return dao.selectCount(statement, schoolIndexShowVo);
	}
	
	
}
