package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.DeptBean;

public interface DeptService {
	public List<DeptBean> listDept();
	public DeptBean getDeptById(Integer deptId);
}
