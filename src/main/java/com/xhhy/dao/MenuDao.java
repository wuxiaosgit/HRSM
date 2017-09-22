package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.MenuBean;

public interface MenuDao {
	public List<MenuBean> getMenu(Integer roleId);
	public List<MenuBean> selectMenu(MenuBean menuBean);
}
