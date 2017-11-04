package com.wl.school.admin.schoolBaseInfo.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.wl.school.admin.schoolBaseInfo.model.SchoolBaseInfoVo;

public interface ISchoolBaseInfoService {
	
	/**获取列表*/
	public List<SchoolBaseInfoVo> getSchoolBaseInfoList(SchoolBaseInfoVo schoolBaseInfoVo);
	
	/**根据id获取对象*/
	public SchoolBaseInfoVo getSchoolBaseInfoById(String id);
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getSchoolBaseInfoCount(SchoolBaseInfoVo schoolBaseInfoVo);
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo);
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteSchoolBaseInfo(List<String> ids);
	
	/**
	 * 发布
	 */
	@Transactional
	public int commitSchoolBaseInfo(List<String> ids);
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateSchoolBaseInfo(SchoolBaseInfoVo schoolBaseInfoVo);
	
}
