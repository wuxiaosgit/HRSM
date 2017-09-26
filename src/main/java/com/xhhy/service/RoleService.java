package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.RoleBean;

public interface RoleService {
	public List<RoleBean> listRole(RoleBean roleBean);
	public Integer max(RoleBean roleBean);
	public RoleBean getRoleById(Integer roleId);
	public List<RoleBean> SelectRoleDept();
	public List<RoleBean> selectRoleByDeptName(String deptName);
	public RoleBean selectRoleByRoleName(String roleName);
	public void insertRole(RoleBean roleBean,List<Integer> menu);
	public void updateRole(RoleBean roleBean,List<Integer> menu);
	public void deleteRole(Integer roleId);
	
}
