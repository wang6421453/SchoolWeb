package com.wl.school.admin.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.common.dao.BaseDao;
import com.wl.school.common.model.RoleVo;

@Repository
public class AdminLoginDao extends BaseDao<AdminUserVo> {

	/**根据名字获取对象*/
	public AdminUserVo getAdminUserByUserName(String statement, String userName){
		return getSqlSession().selectOne(statement, userName);
	}
	
	/**根据用户Id获取角色列表*/
	public List<RoleVo> getAdminUserRolesByUserId(String statement, String id) {
		return getSqlSession().selectList(statement, id);
	}
}
