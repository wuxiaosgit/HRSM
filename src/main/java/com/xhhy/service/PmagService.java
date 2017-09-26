package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.xhhy.domain.PmagBean;
import com.xhhy.utils.PageUtilPmag;
@Service
public interface PmagService {
	
	public List<PmagBean> queryLike(Map<String, Object> keys);//模糊查询
	public List<PmagBean> selectLike(PageUtilPmag page,Map<String, Object> keys);
	public PmagBean selectAll(int pmagId);//明细
	public void pmagByDt(int pmagId);//删除档案状态
	public void pmagByHf(int pmagId);//恢复档案状态
	public void deletePmag(int pmagId);//永久删除
	public PmagBean pmagXG(int pmagId);//修改
	
	public List<PmagBean> queryLike2(Map<String, Object> keys);//模糊查询
	public List<PmagBean> selectLike2(PageUtilPmag page,Map<String, Object> keys);
	public void insertPmag(PmagBean pmag);//审核
	public PmagBean pmagReView(int pmagId);//复核
	public void updateFail(PmagBean pmag);//驳回
	public void updateSuccess(PmagBean pmag);//审核通过
}
