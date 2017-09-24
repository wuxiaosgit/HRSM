package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.WageBean;

public interface WageService {
	public  void insertWage(WageBean wage);
	public List<WageBean> listWage();
}
