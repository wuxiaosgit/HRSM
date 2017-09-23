package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhhy.dao.RoleDao;
import com.xhhy.domain.RoleBean;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	public List<RoleBean> listRole(RoleBean roleBean) {
		// TODO Auto-generated method stub
		return roleDao.listRole(roleBean);
	}

	public RoleBean getRoleById(Integer roleId) {
		// TODO Auto-generated method stub
		return roleDao.getRoleById(roleId);
	}

	public List<RoleBean> SelectRoleDept() {
		// TODO Auto-generated method stub
		return roleDao.SelectRoleDept();
	}

	public List<RoleBean> selectRoleByDeptName(String deptName) {
		// TODO Auto-generated method stub
		return roleDao.selectRoleByDeptName(deptName);
	}

	public RoleBean selectRoleByRoleName(String roleName) {
		// TODO Auto-generated method stub
		System.out.println(roleName);
		return roleDao.selectRoleByRoleName(roleName);
	}

}
