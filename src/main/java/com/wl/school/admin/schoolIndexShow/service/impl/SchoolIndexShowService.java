package com.wl.school.admin.schoolIndexShow.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.schoolIndexShow.dao.SchoolIndexShowDao;
import com.wl.school.admin.schoolIndexShow.model.SchoolIndexShowVo;
import com.wl.school.admin.schoolIndexShow.service.ISchoolIndexShowService;

@SuppressWarnings("restriction")
@Service
public class SchoolIndexShowService implements ISchoolIndexShowService{

	@Resource
    private SchoolIndexShowDao dao;
	
	/**获取列表*/
	public List<SchoolIndexShowVo> getSchoolIndexShowList(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowList";
		return dao.selectList(statement, schoolIndexShowVo);
	}
	
	/**根据id获取对象*/
	public SchoolIndexShowVo getSchoolIndexShowById(String id){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowById";
		return dao.selectById(statement, id);
	}
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolIndexShowCount(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.getSchoolIndexShowCount";
		return dao.selectCount(statement, schoolIndexShowVo);
	}
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.addSchoolIndexShow";
		int result = dao.insert(statement, schoolIndexShowVo);
		return result;
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolIndexShow(List<String> ids){
		String statement = "wl.mapping.school.schoolIndexShowMapper.deleteSchoolIndexShow";
		int result = dao.delete(statement, ids);
		return result;
	}
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolIndexShow(List<String> ids){
		String statement = "wl.mapping.school.schoolIndexShowMapper.commitSchoolIndexShow";
		int result = dao.commitProject(statement, ids);
		return result;
	}
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		String statement = "wl.mapping.school.schoolIndexShowMapper.updateSchoolIndexShow";
		int result = dao.update(statement, schoolIndexShowVo);
		return result;
	}
	
}
