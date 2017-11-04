package com.wl.school.admin.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.school.admin.login.dao.AdminLoginDao;
import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.login.service.IAdminLoginService;
import com.wl.school.common.model.RoleVo;

@SuppressWarnings("restriction")
@Service
public class AdminLoginService implements IAdminLoginService{

	@Resource
    private AdminLoginDao dao;

	/**********************************shiro****************************************/
	
	/**根据名字获取对象*/
	public AdminUserVo getAdminUserByUserName(String userName) {
		String statement = "wl.mapping.school.loginMapper.getAdminUserByUserName";
		return dao.getAdminUserByUserName(statement, userName);
	}

	/**根据用户Id获取角色列表*/
	public List<RoleVo> getAdminUserRolesByUserId(String id) {
		String statement = "wl.mapping.school.loginMapper.getAdminUserRolesByUserId";
		return dao.getAdminUserRolesByUserId(statement, id);
	}
	
}
