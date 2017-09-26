package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.DeptBean;

public interface DeptDao {
	public List<DeptBean> listDept();
	public DeptBean getDeptById(Integer deptId);
	public void insertDept(DeptBean deptBean);
	public void updateDept(DeptBean deptBean);
	public void deleteDept(Integer deptId);
	public List<DeptBean> getTopDept();
}
