package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.MenuBean;

public interface MenuService {
	public List<MenuBean> getMenu(Integer roleId);
	public List<MenuBean> selectMenu(MenuBean menuBean);

}
