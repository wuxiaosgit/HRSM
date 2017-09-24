package com.xhhy.service;

import java.util.ArrayList;
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
		return deptDao.listDept();
	}

	public DeptBean getDeptById(Integer deptId) {
		return deptDao.getDeptById(deptId);
	}

	public List<DeptBean> getListDept() {
		List<DeptBean> LIST=new ArrayList<DeptBean>();
		List<DeptBean> list=deptDao.listDept();
		for (DeptBean deptBean : list) {
			if (deptBean.getDeptUp()==0) {
				LIST.add(deptBean);
			}
		}
		for (DeptBean deptBean : LIST) {
			for (DeptBean d : list) {
				if (d.getDeptUp()==deptBean.getDeptId()) {
					deptBean.getDeptBeans().add(d);
				}
			}
		}
		return LIST;
	}

	public void insertDept(DeptBean deptBean) {
		deptDao.insertDept(deptBean);
	}

	public void updateDept(DeptBean deptBean) {
		deptDao.updateDept(deptBean);
	}

	public void deleteDept(Integer deptId) {
		deptDao.deleteDept(deptId);
	}

	public List<DeptBean> getTopDept() {
		return deptDao.getTopDept();
	}

}
