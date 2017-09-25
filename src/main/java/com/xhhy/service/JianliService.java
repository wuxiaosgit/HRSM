package com.xhhy.service;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.JianliBean;
import com.xhhy.domain.ZhaopinBean;

public interface JianliService {
	public List<JianliBean> selectAll();
	public void updateByPrimaryKeySelective(JianliBean jianliBean);
	public JianliBean selectByPrimaryKey(int jianliId);
	public void insertSelective(JianliBean jianliBean);
	public List<JianliBean> selectJianliRoleDeptPages(Map<String, Object> map);
	public List<JianliBean> selectJianliRoleDept();
	public void updateByPrimaryKeyAndState(int state, int roleId);
}
