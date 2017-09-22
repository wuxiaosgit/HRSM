package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.ZhaopinDao;
import com.xhhy.domain.ZhaopinBean;
@Transactional
@Service
public class ZhaopinServiceImpl implements ZhaopinService {
	@Autowired
	private ZhaopinDao zhaopinDao;

	public List<ZhaopinBean> selectAll() {
		// TODO Auto-generated method stub
		return zhaopinDao.selectAll();
	}

	public void updateByPrimaryKeySelective(ZhaopinBean zhaopinBean) {
		// TODO Auto-generated method stub
		zhaopinDao.updateByPrimaryKeySelective(zhaopinBean);
	}

	public void insertSelective(ZhaopinBean zhaopinBean) {
		// TODO Auto-generated method stub
		zhaopinDao.insertSelective(zhaopinBean);
	}

	public ZhaopinBean selectByPrimaryKey(int zhaopinId) {
		// TODO Auto-generated method stub
		return zhaopinDao.selectByPrimaryKey(zhaopinId);
	}
	
	
}
