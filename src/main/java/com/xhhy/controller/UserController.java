package com.xhhy.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jndi.url.dns.dnsURLContext;
import com.xhhy.domain.DeptBean;
import com.xhhy.domain.MenuBean;
import com.xhhy.domain.UserBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.MenuService;
import com.xhhy.service.UserService;
//王连杰
@Controller
@RequestMapping("user")
@SessionAttributes(value={"user","menus"}, types={UserBean.class,MenuBean.class})
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("selectUser.do")
	public ModelAndView selectUser(UserBean userBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/list.jsp");
		if (userBean.getDeptId()!=null&&userBean.getDeptId()==-1) {
			userBean.setDeptId(null);
		}
		userBean.setRoleId(4);
		List<UserBean> userBeans=userService.listUser(userBean);
		for (UserBean userBean2 : userBeans) {
			//System.out.println(userBean2);
		}
		mav.addObject("userBeans",userBeans);
		mav.addObject("deptBeans",deptService.listDept());
		mav.addObject("userName",userBean.getUserName());
		return mav;
	}

	@RequestMapping("login.do")
	public ModelAndView login(UserBean userBean){
		ModelAndView mav=new ModelAndView("../html/index.jsp");
		UserBean user=userService.login(userBean);
	
	
		if (user==null) {
			mav.setViewName("../html/login.jsp");
		}else{
			mav.addObject("user",user);
			System.out.println(user);
			List<MenuBean> menus=menuService.getMenu(user.getRoleId());
			for (MenuBean menuBean : menus) {
				//System.out.println();
				//System.out.println(menuBean);
				for (MenuBean m : menuBean.getMenuList()) {
					//System.out.println(m);
				}
				//System.out.println();
			}
			mav.addObject("menus",menus);
			
		}
		
		return mav;
	}
}
