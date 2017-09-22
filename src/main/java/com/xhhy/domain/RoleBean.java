package com.xhhy.domain;

import java.io.Serializable;
import java.util.List;

public class RoleBean implements Serializable{
	private Integer roleId;
	private Integer deptId;
	private DeptBean deptBean;
	private String roleName;
	private String roleNumber;
	private String roleDescribe;
	private String roleRemark;
	private Integer roleState;
	
	public String getRoleNumber() {
		return roleNumber;
	}
	public void setRoleNumber(String roleNumber) {
		this.roleNumber = roleNumber;
	}
	public DeptBean getDeptBean() {
		return deptBean;
	}
	public void setDeptBean(DeptBean deptBean) {
		this.deptBean = deptBean;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDescribe() {
		return roleDescribe;
	}
	public void setRoleDescribe(String roleDescribe) {
		this.roleDescribe = roleDescribe;
	}
	public String getRoleRemark() {
		return roleRemark;
	}
	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
	}
	public Integer getRoleState() {
		return roleState;
	}
	public void setRoleState(Integer roleState) {
		this.roleState = roleState;
	}
	@Override
	public String toString() {
		return "RoleBean [roleId=" + roleId + ", deptId=" + deptId + ", roleName=" + roleName + ", roleDescribe="
				+ roleDescribe + ", roleRemark=" + roleRemark + ", roleState=" + roleState + "]";
	}
	
	
}
