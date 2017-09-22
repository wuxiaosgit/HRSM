package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.JianliBean;

public interface JianliService {
	public List<JianliBean> selectAll();
	public void updateByPrimaryKeySelective(JianliBean jianliBean);
	public JianliBean selectByPrimaryKey(int jianliId);
	public void insertSelective(JianliBean jianliBean);
}
