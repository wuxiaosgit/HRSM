package com.xhhy.domain;

public class ZhaopinBean {
	private int zhaopinId;
	private int deptId;
	private String zhaopinType;
	private int zhaopinNum;
	private int roleId;
	private String dengjiren;
	private String startTime;
	private String endTime;
	private String jobmiaoshu;
	private String yaoqiu;
	private int state;
	private RoleBean roleBean;
	
	public String getZhaopinType() {
		return zhaopinType;
	}
	public void setZhaopinType(String zhaopinType) {
		this.zhaopinType = zhaopinType;
	}
	public int getZhaopinNum() {
		return zhaopinNum;
	}
	public void setZhaopinNum(int zhaopinNum) {
		this.zhaopinNum = zhaopinNum;
	}
	
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
	public String getDengjiren() {
		return dengjiren;
	}
	public void setDengjiren(String dengjiren) {
		this.dengjiren = dengjiren;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getJobmiaoshu() {
		return jobmiaoshu;
	}
	public void setJobmiaoshu(String jobmiaoshu) {
		this.jobmiaoshu = jobmiaoshu;
	}
	public String getYaoqiu() {
		return yaoqiu;
	}
	public void setYaoqiu(String yaoqiu) {
		this.yaoqiu = yaoqiu;
	}
	public int getZhaopinId() {
		return zhaopinId;
	}
	public void setZhaopinId(int zhaopinId) {
		this.zhaopinId = zhaopinId;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	public RoleBean getRoleBean() {
		return roleBean;
	}
	public void setRoleBean(RoleBean roleBean) {
		this.roleBean = roleBean;
	}
	@Override
	public String toString() {
		return "ZhaopinBean [zhaopinId=" + zhaopinId + ", deptId=" + deptId + ", zhaopinType=" + zhaopinType
				+ ", zhaopinNum=" + zhaopinNum + ", roleId=" + roleId + ", dengjiren=" + dengjiren + ", startTime="
				+ startTime + ", endTime=" + endTime + ", jobmiaoshu=" + jobmiaoshu + ", yaoqiu=" + yaoqiu + ", state="
				+ state + ", roleBean=" + roleBean + "]";
	}

	
	
	
		
	
}
