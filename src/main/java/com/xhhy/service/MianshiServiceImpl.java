package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.MianshiDao;
import com.xhhy.domain.MianshiBean;
@Transactional
@Service
public class MianshiServiceImpl implements MianshiService {
	@Autowired
	private MianshiDao mianshiDao;
	public List<MianshiBean> selectAll() {
		// TODO Auto-generated method stub
		return mianshiDao.selectAll();
	}

	public MianshiBean selectByPrimaryKey(int mianshiId) {
		// TODO Auto-generated method stub
		return mianshiDao.selectByPrimaryKey(mianshiId);
	}

	public void updateByPrimaryKeySelective(MianshiBean mianshiBean) {
		// TODO Auto-generated method stub
		mianshiDao.updateByPrimaryKeySelective(mianshiBean);
	}

	public void insertSelective(MianshiBean mianshiBean) {
		// TODO Auto-generated method stub
		mianshiDao.insertSelective(mianshiBean);
	}

	public List<MianshiBean> selectByJianliId(int jianliId) {
		// TODO Auto-generated method stub
		return mianshiDao.selectByJianliId(jianliId);
	}

}
