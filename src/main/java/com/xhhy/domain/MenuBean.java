package com.xhhy.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MenuBean implements Serializable {
	private Integer menuId;
	private Integer topId;
	private Integer menuState;
	private String  menuName;
	private String  menuUrl;
	private List<MenuBean> menuList=new ArrayList<MenuBean>();
	
	
	public Integer getTopId() {
		return topId;
	}
	public void setTopId(Integer topId) {
		this.topId = topId;
	}
	public List<MenuBean> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<MenuBean> menuList) {
		this.menuList = menuList;
	}
	
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public Integer getMenuState() {
		return menuState;
	}
	public void setMenuState(Integer menuState) {
		this.menuState = menuState;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	@Override
	public String toString() {
		return "MenuBean [menuId=" + menuId + ", topId=" + topId + ", menuState=" + menuState + ", menuName=" + menuName
				+ ", menuUrl=" + menuUrl + "]";
	}
	
	
}
