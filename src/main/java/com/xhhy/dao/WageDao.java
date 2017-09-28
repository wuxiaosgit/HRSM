package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.xhhy.domain.WageBean;

public interface WageDao {
	public void insertWage(WageBean wage);
	public void updateWage(WageBean wage);
	public void deleteWage(int wageId);   
	public List<WageBean> queryWage(Map<String,Object> map);
	public long selectAllCount();
	public WageBean selectById(int wageId);
	public  List<WageBean> listWage();
}
