package com.xhhy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.RoleDao;
import com.xhhy.domain.RoleBean;
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	public List<RoleBean> listRole(RoleBean roleBean) {
		// TODO Auto-generated method stub
		roleBean.setCurrentNum((roleBean.getCurrentNum()-1)*8);
		List<RoleBean> listRole = roleDao.listRole(roleBean);
		roleBean.setCurrentNum(roleBean.getCurrentNum()/8+1);
		return listRole;
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
		return roleDao.selectRoleByRoleName(roleName);
	}
	
	public void insertRole(RoleBean roleBean,List<Integer> menu) {
		// TODO Auto-generated method stub
		roleDao.insertRole(roleBean);
		System.out.println(roleBean);
		for (Integer integer : menu) {
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("roleId", roleBean.getRoleId());
			map.put("menuId", integer);
			roleDao.insertRoleMenu(map);
		}
		
	}

	public void updateRole(RoleBean roleBean,List<Integer> menu) {
		// TODO Auto-generated method stub
		roleDao.updateRole(roleBean);
		roleDao.deleteRoleMenu(roleBean.getRoleId());
		for (Integer integer : menu) {
			
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("roleId", roleBean.getRoleId());
			map.put("menuId", integer);
			roleDao.insertRoleMenu(map);
		}
	}

	public void deleteRole(Integer roleId) {
		// TODO Auto-generated method stub
		roleDao.deleteRole(roleId);
	}

	public Integer max(RoleBean roleBean) {
		// TODO Auto-generated method stub
		return roleDao.max(roleBean);
	}

}
