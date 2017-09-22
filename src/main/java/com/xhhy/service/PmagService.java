package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.xhhy.domain.PmagBean;
@Service
public interface PmagService {
	public void insertPmag(PmagBean pmag);//审核
	public List<PmagBean> queryLike(Map<String, Object> keys);//模糊查询
}
