package com.xhhy.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping("insertUser.do")
	public ModelAndView insertUser(UserBean userBean){
		userService.insertUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("updateUser.do")
	public ModelAndView updateUser(UserBean userBean){
		userService.updateUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("deleteUser.do")
	public ModelAndView deleteUser(Integer userId){
		userService.deleteUser(userId);
		return selectUser(null);
	}
	@RequestMapping("noDeleteUser.do")
	public ModelAndView noDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(0);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	
	@RequestMapping("selectUser.do")
	public ModelAndView selectUser(UserBean userBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/list.jsp");
		if (userBean==null) {
			 userBean=new UserBean();
		}
		if (userBean.getDeptId()!=null&&userBean.getDeptId()==-1) {
			userBean.setDeptId(null);
		}
		if (userBean.getRoleId()!=null&&userBean.getRoleId()==-1) {
			userBean.setRoleId(null);
		}
		List<UserBean> userBeans=userService.listUser(userBean);
		/*for (UserBean userBean2 : userBeans) {
			System.out.println(userBean2);
		}*/
		mav.addObject("userBeans",userBeans);
		mav.addObject("deptBeans",deptService.listDept());
		mav.addObject("userName",userBean.getUserName());
		return mav;
	}

	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest re,UserBean userBean){
		ServletContext servletContext = re.getSession().getServletContext();
		
		ModelAndView mav=new ModelAndView("../html/index.jsp");
		UserBean user=userService.login(userBean);
	
	
		if (user==null) {
			mav.setViewName("../html/login.jsp");
		}else{
			mav.addObject("user",user);
			servletContext.setAttribute("user",user);
			System.out.println(user);
			List<MenuBean> menus=menuService.getMenu(user.getRoleId());
			/*for (MenuBean menuBean : menus) {
				System.out.println();
				System.out.println(menuBean);
				for (MenuBean m : menuBean.getMenuList()) {
					System.out.println(m);
				}
				System.out.println();
			}*/
			mav.addObject("menus",menus);
			
		}
		
		return mav;
	}
}
