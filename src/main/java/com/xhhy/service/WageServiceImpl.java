package com.xhhy.service;

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
}
