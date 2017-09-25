package com.xhhy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.xhhy.domain.WageBean;

public interface WageDao {
	public List<WageBean> selectAll();
	public void insertWage(WageBean wage);
	public WageBean selectById(int wageId);
	public void updateWage(WageBean wage);
	public void deleteWage(int wageId);
	public List<WageBean> selectBySta(int wageSta);
}
