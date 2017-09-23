package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.MenuBean;
import com.xhhy.service.MenuService;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("ajaxMenu.do")
	public @ResponseBody List<MenuBean> ajaxMenu(){
		return menuService.getTopMenu();
	}
	
	@RequestMapping("insertMenu.do")
	public ModelAndView insretMenu(MenuBean menuBean){
		if (menuBean.getTopId()!=0) {
			MenuBean topMenu=menuService.getMenuById(menuBean.getTopId());
			menuBean.setMenuPaixu(topMenu.getMenuPaixu()+1);
		}else{
			int paixu=menuService.getMaxPaixu();
			if (paixu%2==0) {
				menuBean.setMenuPaixu(paixu+1);
				
			}else{ 
				menuBean.setMenuPaixu(paixu+2);
			}
		}
		menuService.insertMenu(menuBean);
		return selectMenu(null);
	}
	
	@RequestMapping("selectMenu.do")
	public ModelAndView selectMenu(MenuBean menuBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo8/list.jsp");
		if (menuBean==null) {
			menuBean=new MenuBean();
		}
		if (menuBean.getMenuState()!=null&&menuBean.getMenuState()==-1) {
			menuBean.setMenuState(null);
		}
		List<MenuBean> menuBeans= menuService.selectMenu(menuBean);
		for (MenuBean menuBean2 : menuBeans) {
			System.out.println(menuBean2);
		}
		
		mav.addObject("menuBeans",menuBeans);
		return mav;
	}
	
}
