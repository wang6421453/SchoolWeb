package com.wl.school.admin.login.utils;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.login.service.IAdminLoginService;
import com.wl.school.common.model.RoleVo;

@SuppressWarnings("restriction")
public class ShiroAdminRealm extends AuthorizingRealm{
  
	private static Logger logger = Logger.getLogger(ShiroAdminRealm.class);
	
	@Resource
	private IAdminLoginService adminLoginService;
	
	//认证方法
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //toke强转
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken)authenticationToken;
		String userName = usernamePasswordToken.getUsername();
		//根据用户名查询密码，有安全管理器负责对比查询出的数据库中的密码和页面输入的密码是否一致
		AdminUserVo adminUser = adminLoginService.getAdminUserByUserName(userName);
		if(adminUser == null){
			return null;
		}
		String passwordFromDB = adminUser.getPassword();
		//最后的比对需要交给安全管理器
        //三个参数进行初步的简单认证信息对象的包装
		AuthenticationInfo info = new SimpleAuthenticationInfo(userName, passwordFromDB, this.getName());
		return info;
	}
		
	// 授权方法
    // 执行的时期
    /**
     * 在访问需要控制的时候需要权限
     */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		
		//根据当前登录用户，查询用户的角色，根据角色对应获得的权限添加到信息对象中

        //程序任何位置都可以拿到user对象
		//方法一
		String userName = (String) principalCollection.getPrimaryPrincipal();
		AdminUserVo adminUser = adminLoginService.getAdminUserByUserName(userName);;
		//方法二
		/*Subject subject = SecurityUtils.getSubject();
		AdminUserVo adminUser = (AdminUserVo) subject.getPrincipal(); */
		//为用户赋予角色和授权
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<RoleVo> lstRoles = new ArrayList<RoleVo>();
		List<String> lstRoleName = new ArrayList<String>();
		List<Integer> lstRoleId = new ArrayList<Integer>();
		lstRoles = adminLoginService.getAdminUserRolesByUserId(adminUser.getId());
		for(RoleVo role : lstRoles){
			lstRoleName.add(role.getRoleName());
			lstRoleId.add(role.getId());
			logger.info("roleName:" + role.getRoleName());
		}
		info.addRoles(lstRoleName);
		return info;
	}

	

}
