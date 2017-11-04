package com.wl.school.admin.login.service;

import java.util.List;
import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.common.model.RoleVo;

public interface IAdminLoginService {
	
	/**********************************shiro****************************************/
	
	
	/**根据名字获取对象*/
	public AdminUserVo getAdminUserByUserName(String userName);
    
    /**根据用户Id获取角色列表*/
    public List<RoleVo> getAdminUserRolesByUserId(String id);
}
