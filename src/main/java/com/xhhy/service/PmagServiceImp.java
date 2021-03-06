package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.PmagDao;
import com.xhhy.domain.PmagBean;
import com.xhhy.utils.PageUtilPmag;

@Service
@Transactional
public class PmagServiceImp implements PmagService {
	@Autowired
	private PmagDao pmagDao;
	public PmagDao getPmagDao() {
		return pmagDao;
	}
	public void setPmagDao(PmagDao pmagDao) {
		this.pmagDao = pmagDao;
	}
	//删除档案状态
	public void pmagByDt(int pmagId) {
		pmagDao.pmagByDt(pmagId);
	}
	//恢复档案状态
	public void pmagByHf(int pmagId) {
		pmagDao.pmagByHf(pmagId);		
	}
	//删除
	public void deletePmag(int pmagId) {
		pmagDao.deletePmag(pmagId);	
	}
	//模糊查询
	public List<PmagBean> queryLike(Map<String, Object> keys) {	
			return pmagDao.queryLike(keys);
		}
	public List<PmagBean> queryLike2(Map<String, Object> keys) {		
		return pmagDao.queryLike2(keys);
	}
	public List<PmagBean> selectLike(PageUtilPmag page,Map<String, Object> keys) {
		// 第一步查询总条数
		int totleRows = Integer.parseInt(this.pmagDao.selectLike(keys) + "" );
		// 封装分页信息
		page.setTotleRows(totleRows);
		// 计算总页数
		page.setTotlePages(totleRows%page.getPageRows()==0?totleRows/page.getPageRows():totleRows/page.getPageRows()+1);
		// 查询目标集合列表
		return pmagDao.queryLike(keys);
	}
	public List<PmagBean> selectLike2(PageUtilPmag page, Map<String, Object> keys) {
		// 第一步查询总条数
			int totleRows = Integer.parseInt(this.pmagDao.selectLike2(keys) + "" );
		// 封装分页信息
			page.setTotleRows(totleRows);
		// 计算总页数
			page.setTotlePages(totleRows%page.getPageRows()==0?totleRows/page.getPageRows():totleRows/page.getPageRows()+1);
		// 查询目标集合列表
			return pmagDao.queryLike2(keys);
	}
	
	//驳回和成功
		public void updateFail(PmagBean pmag) {
			pmagDao.updateFail(pmag);
		}
	//修该和明细 和复核和办理
		public PmagBean pmagXG(int pmagId) {
			return pmagDao.pmagXG(pmagId);
		}
	//起草和待审核
		public void insertPmag(PmagBean pmag){
			pmagDao.insertPmag(pmag);
		}
	//有起草到审核状态
		public void pmagupdate(PmagBean pmag) {
			// TODO Auto-generated method stub
			pmagDao.pmagupdate(pmag);
		}
}
