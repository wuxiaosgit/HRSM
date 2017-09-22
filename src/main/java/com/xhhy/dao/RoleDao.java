package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.RoleBean;

public interface RoleDao {
	public List<RoleBean> listRole(RoleBean roleBean);
	public RoleBean getRoleById(Integer roleId);
	public List<RoleBean> SelectRoleDept();
}
