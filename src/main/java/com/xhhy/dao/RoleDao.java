package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.RoleBean;

public interface RoleDao {
	public List<RoleBean> listRole(RoleBean roleBean);
	public Integer max(RoleBean roleBean);
	public RoleBean getRoleById(Integer roleId);
	public List<RoleBean> SelectRoleDept();
	public List<RoleBean> selectRoleByDeptName(String deptName);
	public RoleBean selectRoleByRoleName(String roleName);
	public void insertRole(RoleBean roleBean);
	public void insertRoleMenu(Map<String, Object> map);
	public void updateRole(RoleBean roleBean);
	public void deleteRole(Integer roleId);
	public void deleteRoleMenu(Integer roleId);
}
