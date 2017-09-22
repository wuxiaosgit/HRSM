package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhhy.dao.DeptDao;
import com.xhhy.domain.DeptBean;
@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptDao deptDao;
	
	public List<DeptBean> listDept() {
		// TODO Auto-generated method stub
		return deptDao.listDept();
	}

	public DeptBean getDeptById(Integer deptId) {
		// TODO Auto-generated method stub
		return deptDao.getDeptById(deptId);
	}

}
