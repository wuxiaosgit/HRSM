package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.PmagDao;
import com.xhhy.domain.PmagBean;

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
	public void insertPmag(PmagBean pmag){
		pmagDao.insertPmag(pmag);
	}
	public List<PmagBean> queryLike(Map<String, Object> keys) {
		return pmagDao.queryLike(keys);
	}
	
	

}
