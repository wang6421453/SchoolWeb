package com.wl.school.admin.account.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.login.model.AdminUserVo;

public interface IAccountService {
	
    public List<AdminUserVo> getAdminUserList(AdminUserVo adminUserVo);
	
	/**根据id获取对象*/
	public AdminUserVo getAdminUserById(String id);
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getAdminUserCount(AdminUserVo adminUserVo);
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addAdminUser(AdminUserVo adminUserVo);
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteAdminUser(List<String> ids);
	
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateAdminUser(AdminUserVo adminUserVo);
}
