package com.wl.school.admin.schoolBaseInfo.model;

import java.util.Date;

import com.wl.school.common.model.BaseVo;

public class SchoolBaseInfoVo extends BaseVo{

	//id
	private String id;
	//标题
	private String title;
	//内容
	private String content;
	//业务类别
	private String businessType;
	//创建时间
	private Date createTime;
	//更新时间
	private Date commitTime;
	//创建者
	private String createUser;
	//发布状态
	private int status;
	//点击量
	private int clickRate;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getCommitTime() {
		return commitTime;
	}
	public void setCommitTime(Date commitTime) {
		this.commitTime = commitTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getClickRate() {
		return clickRate;
	}
	public void setClickRate(int clickRate) {
		this.clickRate = clickRate;
	}
	
}
