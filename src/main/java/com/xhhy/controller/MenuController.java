package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.MenuBean;
import com.xhhy.service.MenuService;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("selectMenu.do")
	public ModelAndView selectMenu(MenuBean menuBean){
		//System.out.println(menuBean);
		ModelAndView mav=new ModelAndView("../html/resource/demo8/list.jsp");
		
		if (menuBean.getMenuState()!=null&&menuBean.getMenuState()==-1) {
			menuBean.setMenuState(null);
		}
		List<MenuBean> menuBeans= menuService.selectMenu(menuBean);
		for (MenuBean menuBean2 : menuBeans) {
			//System.out.println(menuBean2);
		}
		
		mav.addObject("menuBeans",menuBeans);
		return mav;
	}
	
}
