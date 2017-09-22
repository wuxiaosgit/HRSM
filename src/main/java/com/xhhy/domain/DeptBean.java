package com.xhhy.domain;

import java.io.Serializable;

public class DeptBean implements Serializable {
	private Integer deptId;
	private Integer deptState;
	private String deptName;
	private String deptShortName;
	private String deptUp;
	private String deptAdress;
	private String deptJianjie;
	private String deptRemark;
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public Integer getDeptState() {
		return deptState;
	}
	public void setDeptState(Integer deptState) {
		this.deptState = deptState;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptShortName() {
		return deptShortName;
	}
	public void setDeptShortName(String deptShortName) {
		this.deptShortName = deptShortName;
	}
	public String getDeptUp() {
		return deptUp;
	}
	public void setDeptUp(String deptUp) {
		this.deptUp = deptUp;
	}
	public String getDeptAdress() {
		return deptAdress;
	}
	public void setDeptAdress(String deptAdress) {
		this.deptAdress = deptAdress;
	}
	public String getDeptJianjie() {
		return deptJianjie;
	}
	public void setDeptJianjie(String deptJianjie) {
		this.deptJianjie = deptJianjie;
	}
	public String getDeptRemark() {
		return deptRemark;
	}
	public void setDeptRemark(String deptRemark) {
		this.deptRemark = deptRemark;
	}
	@Override
	public String toString() {
		return "DeptBean [deptId=" + deptId + ", deptState=" + deptState + ", deptName=" + deptName + ", deptShortName="
				+ deptShortName + ", deptUp=" + deptUp + ", deptAdress=" + deptAdress + ", deptJianjie=" + deptJianjie
				+ ", deptRemark=" + deptRemark + "]";
	}
	
	
}
