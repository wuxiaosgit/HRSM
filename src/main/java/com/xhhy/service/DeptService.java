package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.UserBean;

public interface DeptService {
	public List<DeptBean> listDept();
	public List<DeptBean> getListDept();
	public List<DeptBean> getTopDept();
	public DeptBean getDeptById(Integer deptId);
	public void insertDept(DeptBean deptBean);
	public void updateDept(DeptBean deptBean);
	public void deleteDept(Integer deptId);
}
