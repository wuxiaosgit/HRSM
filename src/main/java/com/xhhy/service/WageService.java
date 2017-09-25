package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.WageBean;

public interface WageService {
	public  void insertWage(WageBean wage);
	public List<WageBean> listWage();
	public WageBean selectById(int wageId);
	public void updateWage(WageBean wage);
	public void deleteWage(int wageId);
	public List<WageBean> selectBySta(int wageSta);
}
