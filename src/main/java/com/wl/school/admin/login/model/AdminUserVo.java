package com.wl.school.admin.login.model;

import java.util.Date;

import com.wl.school.common.model.BaseVo;

public class AdminUserVo extends BaseVo{
	
	/**id*/
	private String id;
	/**用户名*/
	private String userName;
	/**密码*/
	private String password;
	/**ip*/
	private String ip;
	/**realName*/
	private String realName;
	/**创建时间*/
	Date createTime;
	//角色
	String roleName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
