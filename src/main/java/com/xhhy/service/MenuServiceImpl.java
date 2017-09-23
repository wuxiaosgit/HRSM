package com.xhhy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhhy.dao.MenuDao;
import com.xhhy.domain.MenuBean;
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;
	
	public List<MenuBean> getMenu(Integer roleId) {
		// TODO Auto-generated method stub
		List<MenuBean> LIST=new ArrayList<MenuBean>();
		List<MenuBean> list=menuDao.getMenu(roleId);
		for (MenuBean menuBean : list) {
			if (menuBean.getTopId()==0) {
				LIST.add(menuBean);
			}
		}
		for (MenuBean menuBean : LIST) {
			for (MenuBean m : list) {
				if (m.getTopId()==menuBean.getMenuId()) {
					menuBean.getMenuList().add(m);
				}
			}
		}
		return LIST;
	}

	public List<MenuBean> selectMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		return menuDao.selectMenu(menuBean);
	}

	public void insertMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		menuDao.insertMenu(menuBean);
	}

	public List<MenuBean> getTopMenu() {
		// TODO Auto-generated method stub
		return menuDao.getTopMenu();
	}

	public Integer getMaxPaixu() {
		// TODO Auto-generated method stub
		return menuDao.getMaxPaixu();
	}

	public MenuBean getMenuById(Integer menuId) {
		// TODO Auto-generated method stub
		return menuDao.getMenuById(menuId);
	}

	public void updateMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		menuDao.updateMenu(menuBean);
	}

	public void deleteMenu(Integer menuId) {
		// TODO Auto-generated method stub
		menuDao.deleteMenu(menuId);
	}

}
