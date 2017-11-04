package com.wl.school.admin.schoolPersonInfo.model;

import java.util.Date;

import com.wl.school.common.model.BaseVo;

public class SchoolPersonInfoVo extends BaseVo{

	//id
	private String id;
	//名字
	private String name;
	//称号
	private String title;
	//介绍
	private String content;
	//类别
	private String businessType;
	//发布状态
	private int status;
	//创建时间
	private Date createTime;
	//更新时间
	private Date commitTime;
	//创建者
	private String createUser;
	//序号,用于排序
	private int No;
	//头像地址
	private String headPic;
	//点击量
	private int clickRate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public String getHeadPic() {
		return headPic;
	}
	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}
	public int getClickRate() {
		return clickRate;
	}
	public void setClickRate(int clickRate) {
		this.clickRate = clickRate;
	}
	
}
