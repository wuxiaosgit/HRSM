package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.MenuBean;

public interface MenuService {
	public List<MenuBean> getMenu(Integer roleId);
	public MenuBean getMenuById(Integer menuId);
	public List<MenuBean> getTopMenu();
	public Integer getMaxPaixu();
	public List<MenuBean> selectMenu(MenuBean menuBean);
	public void insertMenu(MenuBean menuBean);
	public void updateMenu(MenuBean menuBean);
	public void deleteMenu(Integer menuId);
}
