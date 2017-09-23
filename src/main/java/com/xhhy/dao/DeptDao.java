package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.DeptBean;

public interface DeptDao {
	public List<DeptBean> listDept();
	public DeptBean getDeptById(Integer deptId);
	
}
