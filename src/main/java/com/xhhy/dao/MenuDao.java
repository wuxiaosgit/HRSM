package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.MenuBean;

public interface MenuDao {
	public List<MenuBean> getMenu(Integer roleId);
	public MenuBean getMenuById(Integer menuId);
	public List<MenuBean> selectMenu(MenuBean menuBean);
	public void insertMenu(MenuBean menuBean);
	public void updateMenu(MenuBean menuBean);
	public void deleteMenu(Integer menuId);
	public List<MenuBean> getTopMenu();
	public Integer getMaxPaixu();
}
