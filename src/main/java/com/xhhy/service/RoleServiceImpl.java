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

}
