package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.JianliDao;
import com.xhhy.domain.JianliBean;
@Transactional
@Service
public class JianliServiceImpl implements JianliService{
	@Autowired
	private JianliDao jianliDao;
	public List<JianliBean> selectAll() {
		// TODO Auto-generated method stub
		return jianliDao.selectAll();
	}
	public void updateByPrimaryKeySelective(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		jianliDao.updateByPrimaryKeySelective(jianliBean);
	}
	public JianliBean selectByPrimaryKey(int jianliId) {
		// TODO Auto-generated method stub
		return jianliDao.selectByPrimaryKey(jianliId);
	}
	public void insertSelective(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		jianliDao.insertSelective(jianliBean);
	}

}
