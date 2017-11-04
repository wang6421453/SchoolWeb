package com.wl.school.admin.schoolIndexShow.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.wl.school.admin.schoolIndexShow.model.SchoolIndexShowVo;

public interface ISchoolIndexShowService {
	
	/**获取列表*/
	public List<SchoolIndexShowVo> getSchoolIndexShowList(SchoolIndexShowVo schoolIndexShowVo);
	
	/**根据id获取对象*/
	public SchoolIndexShowVo getSchoolIndexShowById(String id);
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolIndexShowCount(SchoolIndexShowVo schoolIndexShowVo);
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo);
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolIndexShow(List<String> ids);
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolIndexShow(List<String> ids);
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolIndexShow(SchoolIndexShowVo schoolIndexShowVo);
	
}
