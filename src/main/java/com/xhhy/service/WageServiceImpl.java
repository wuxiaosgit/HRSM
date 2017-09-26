package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.WageDao;
import com.xhhy.domain.WageBean;
@Service("wage")
@Transactional
public class WageServiceImpl implements WageService{
	@Autowired
	private WageDao wageDao;

	public void insertWage(WageBean wage) {
		wageDao.insertWage(wage);
	}

	public List<WageBean> listWage() {
		
		return wageDao.selectAll();
	}

	public WageBean selectById(int wageId) {
		WageBean wage = wageDao.selectById(wageId);
		return wage;
	}

	public void updateWage(WageBean wage) {
		wageDao.updateWage(wage);
	}

	public void deleteWage(int wageId) {
		wageDao.deleteWage(wageId);
	}

	public List<WageBean> selectBySta(int wageSta) {
		return wageDao.selectBySta(wageSta);
	}

	@Override
	public List<WageBean> queryByLike(Map<String, Object> map) {
		return wageDao.queryByLike(map);
	}
}
