package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.PmagBean;

public interface PmagDao {
	public void insertPmag(PmagBean pmag);//审核
	public List<PmagBean> queryLike(Map<String, Object> keys);//模糊查
	public List<PmagBean> selectAll();
	//public void pemaByHf(int pmagId);//恢复
	//public void deletePema(int pmagId);//删除
	
}
