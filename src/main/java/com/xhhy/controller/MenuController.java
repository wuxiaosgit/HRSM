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
	
	
	
	@RequestMapping("insertMenu.do")
	public ModelAndView insretMenu(MenuBean menuBean){
		if (menuBean.getMenuId()==null) {
			//添加该做的事
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
		}else{
			menuService.updateMenu(menuBean);
		}
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
		Integer max=menuService.max(menuBean);
		/*for (MenuBean menuBean2 : menuBeans) {
			System.out.println(menuBean2);
		}*/
		
		mav.addObject("menuBeans",menuBeans);
		mav.addObject("menuName",menuBean.getMenuName());
		mav.addObject("menuState",menuBean.getMenuState());
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", menuBean.getCurrentNum());
		return mav;
	}
	@RequestMapping("getMenu.do")
	public ModelAndView getMenu(Integer menuId){
		
		ModelAndView mav= new ModelAndView("../html/resource/demo8/add.jsp");
		mav.addObject("topMenus",menuService.getTopMenu());
		if (menuId!=null) {
			
			mav.addObject("menuBean",menuService.getMenuById(menuId));
			
		}
		return mav;
	}
	@RequestMapping("deleteMenu.do")
	public ModelAndView deleteMenu(Integer menuId){
		menuService.deleteMenu(menuId);
		return selectMenu(null);
	}
	@RequestMapping("noDeleteMenu.do")
	public ModelAndView noDeleteMenu(Integer menuId){
		MenuBean menu = menuService.getMenuById(menuId);
		menu.setMenuState(0);
		menuService.updateMenu(menu);
		return selectMenu(null);
	}
}
