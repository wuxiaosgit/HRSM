package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xhhy.domain.PmagBean;

public interface PmagDao {
	public List<PmagBean> queryLike2(Map<String,Object> keys);//办理模糊查询
	public long selectLike2(Map<String,Object> keys);
	public void insertPmag(PmagBean pmag);//审核
	public PmagBean pmagReView(int pmagId);//复核
	public void updateFail(PmagBean pmag);//驳回
	public void updateSuccess(PmagBean pmag);//审核通过
	public PmagBean pmagXG(int pmagId);//修改
	
	
	
	public List<PmagBean> queryLike(Map<String,Object> keys);//档案模糊查询
	public long selectLike(Map<String,Object> keys);
	public PmagBean selectAll(int pmagId);//明细
	public void pmagByDt(int pmagId);//删除档案状态
	public void pmagByHf(int pmagId);//恢复档案状态
	public void deletePmag(int pmagId);//永久删除
		
}
