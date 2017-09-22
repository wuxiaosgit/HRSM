package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.MianshiBean;

public interface MianshiService {

	List<MianshiBean> selectAll();

	MianshiBean selectByPrimaryKey(int mianshiId);

	void updateByPrimaryKeySelective(MianshiBean mianshiBean);

	void insertSelective(MianshiBean mianshiBean);

}
