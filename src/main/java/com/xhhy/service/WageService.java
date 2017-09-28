package com.xhhy.service;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.WageBean;

public interface WageService {
	public  void insertWage(WageBean wage);
	public void updateWage(WageBean wage);
	public void deleteWage(int wageId);
	public List<WageBean> queryWage(Map<String,Object> map);
	public  List<WageBean> listWage();
	public long selectAllCount();
	public WageBean selectById(int wageId);
}
