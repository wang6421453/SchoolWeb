package com.wl.school.admin.schoolPersonInfo.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.wl.school.admin.schoolPersonInfo.model.SchoolPersonInfoVo;


public interface ISchoolPersonInfoService {
	
	/**获取列表*/
	public List<SchoolPersonInfoVo> getSchoolPersonInfoList(SchoolPersonInfoVo schoolPersonInfoVo);
	
	/**根据id获取对象*/
	public SchoolPersonInfoVo getSchoolPersonInfoById(String id);
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolPersonInfoCount(SchoolPersonInfoVo schoolPersonInfoVo);
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo);
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolPersonInfo(List<String> ids);
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolPersonInfo(List<String> ids);
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolPersonInfo(SchoolPersonInfoVo schoolPersonInfoVo);
	
}
