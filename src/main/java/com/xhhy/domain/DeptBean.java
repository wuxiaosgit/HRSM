package com.xhhy.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DeptBean implements Serializable {
	private Integer deptId;
	private Integer deptState;
	private String deptName;
	private String deptShortName;
	private Integer deptUp;
	private String deptAddress;
	private String deptJianjie;
	private String deptRemark;
	private List<DeptBean> deptBeans=new ArrayList<DeptBean>();
	private DeptBean deptBean;
	
	
	public DeptBean getDeptBean() {
		return deptBean;
	}
	public void setDeptBean(DeptBean deptBean) {
		this.deptBean = deptBean;
	}
	public List<DeptBean> getDeptBeans() {
		return deptBeans;
	}
	public void setDeptBeans(List<DeptBean> deptBeans) {
		this.deptBeans = deptBeans;
	}
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
	
	public Integer getDeptUp() {
		return deptUp;
	}
	public void setDeptUp(Integer deptUp) {
		this.deptUp = deptUp;
	}
	
	public String getDeptAddress() {
		return deptAddress;
	}
	public void setDeptAddress(String deptAddress) {
		this.deptAddress = deptAddress;
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
				+ deptShortName + ", deptUp=" + deptUp + ", deptAddress=" + deptAddress + ", deptJianjie=" + deptJianjie
				+ ", deptRemark=" + deptRemark + ", deptBeans=" + deptBeans + "]";
	}
	
	
}
