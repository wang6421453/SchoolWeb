package com.wl.school.admin.account.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wl.school.admin.account.dao.AccountDao;
import com.wl.school.admin.account.service.IAccountService;
import com.wl.school.admin.login.model.AdminUserVo;

@SuppressWarnings("restriction")
@Service
public class AccountService implements IAccountService{

	@Resource
    private AccountDao dao;
	
	/**获取列表*/
	public List<AdminUserVo> getAdminUserList(AdminUserVo adminUserVo){
		String statement = "wl.mapping.school.accountMapper.getAdminUserList";
		return dao.selectList(statement, adminUserVo);
	}
	
	/**根据id获取对象*/
	public AdminUserVo getAdminUserById(String id){
		String statement = "wl.mapping.school.accountMapper.getAdminUserById";
		return dao.selectById(statement, id);
	}
	
	/**
     * 获取数量
     * @return  数量
     */
	public int getAdminUserCount(AdminUserVo adminUserVo){
		String statement = "wl.mapping.school.accountMapper.getAdminUserCount";
		return dao.selectCount(statement, adminUserVo);
	}
	
	/**
	 * 新增
	 * @return  是否成功
	 */
	@Transactional
	public int addAdminUser(AdminUserVo adminUserVo){
		String id = UUID.randomUUID().toString();
		adminUserVo.setId(id);
		String statement = "wl.mapping.school.accountMapper.addAdminUser";
		int result = dao.insert(statement, adminUserVo);
		return result;
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public int deleteAdminUser(List<String> ids){
		String statement = "wl.mapping.school.accountMapper.deleteAdminUser";
		int result = dao.delete(statement, ids);
		return result;
	}
	
	
	/**
	 * 更新
	 */
	@Transactional
	public int updateAdminUser(AdminUserVo adminUserVo){
		String statement = "wl.mapping.school.accountMapper.updateAdminUser";
		int result = dao.update(statement, adminUserVo);
		return result;
	}
}
