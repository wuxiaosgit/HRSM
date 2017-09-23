package com.xhhy.service;

import java.util.List;
import java.util.Map;


import com.xhhy.domain.ZhaopinBean;


public interface ZhaopinService {
	public List<ZhaopinBean> selectAll();
	public void updateByPrimaryKeySelective(ZhaopinBean zhaopinBean);
	public void insertSelective(ZhaopinBean zhaopinBean);
	public ZhaopinBean selectByPrimaryKey(int zhaopinId);
	public List<ZhaopinBean> selectZhaoRoleDept();
	public ZhaopinBean selectAZhaoRoleDept(int zhaopinId);
	public List<ZhaopinBean> selectZhaoRoleDeptPages(Map<String, Object> map);
}
