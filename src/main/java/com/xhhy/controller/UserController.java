package com.xhhy.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jndi.url.dns.dnsURLContext;
import com.xhhy.domain.DeptBean;
import com.xhhy.domain.MenuBean;
import com.xhhy.domain.UserBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.MenuService;
import com.xhhy.service.RoleService;
import com.xhhy.service.UserService;

@Controller
@RequestMapping("user")
@SessionAttributes(value={"user","menus"}, types={UserBean.class,MenuBean.class})
//@SessionAttributes("menus")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("ajaxOldPaddword.do")
	@ResponseBody
	public String ajaxOldPaddword(UserBean userBean){
		UserBean oldPasswrod = userService.oldPasswrod(userBean);
		if (oldPasswrod==null) {
			return "no";
		}else{
			return "ok";
		}
	}
	@RequestMapping("ajaxLogin.do")
	@ResponseBody
	public String ajaxLogin(String ajaxLogin){
		List<UserBean> userBeans = userService.ajaxLogin(ajaxLogin);
		if (userBeans==null ||userBeans.size()==0) {
			return "no";
		}else{
			return "yes";
		}
	}
	@RequestMapping("insertUser.do")
	public ModelAndView insertUser(UserBean userBean){
		if (userBean.getUserId()==null) {
			
			userBean.setUserState(1);
			userService.insertUser(userBean);
		}else{
			userService.updateUser(userBean);
		}
		return selectUser(null);
	}
	/*@RequestMapping("updateUser.do")
	public ModelAndView updateUser(UserBean userBean){
		return selectUser(null);
	}*/
	@RequestMapping("gerenUser.do")
	public ModelAndView gerenUser(HttpServletRequest re,UserBean userBean,@RequestParam("file")MultipartFile mf){
//		System.out.println(userBean);
		String savePath="F:/webb/YXSS/src/main/webapp/html/protrait/"+mf.getOriginalFilename();
//		System.out.println(savePath);
		try {
			InputStream in= mf.getInputStream();
			OutputStream out=new FileOutputStream(savePath);
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		userBean.setUserPicture(savePath);
		userService.updateUser(userBean);
		
		ServletContext servletContext = re.getSession().getServletContext();
		servletContext.setAttribute("user",userBean);
		return new ModelAndView("../html/msg.jsp");
	}
	@RequestMapping("deleteUser.do")
	public ModelAndView deleteUser(Integer userId){
		userService.deleteUser(userId);
		return selectUser(null);
	}
	@RequestMapping("deleteUserAll.do")
	public ModelAndView deleteUserAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			userService.deleteUser(ids[i]);
		}
		return selectUser(null);
	}
	@RequestMapping("noDeleteUser.do")
	public ModelAndView noDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(0);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("yesDeleteUser.do")
	public ModelAndView yesDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(1);
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
		Integer max=userService.max(userBean);
		/*System.out.println(max);
		for (UserBean userBean2 : userBeans) {
			System.out.println(userBean2);
		}*/
		mav.addObject("userBeans",userBeans);
		mav.addObject("deptBeans",deptService.listDept());
		
		mav.addObject("deptId",userBean.getDeptId());
		mav.addObject("userName",userBean.getUserName());
		mav.addObject("role",roleService.getRoleById(userBean.getRoleId()));
			
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", userBean.getCurrentNum());
		return mav;
	}
	@RequestMapping("getUserById.do")
	public ModelAndView getUserById(Integer userId){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/view.jsp");
		mav.addObject("user",userService.getUserById(userId));
		return mav;
		
	}
	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest re,HttpServletResponse response,UserBean userBean,Integer cookie){
		//ServletContext servletContext = re.getSession().getServletContext();
		
		ModelAndView mav=new ModelAndView("../html/index.jsp");
		UserBean user=userService.login(userBean);
	
		if (user==null) {
			
			return out(re);
		}else{
			mav.addObject("user",user);
			//servletContext.setAttribute("user",user);
			
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
			Cookie cookie1=new Cookie("userLogin", userBean.getUserLogin());
			cookie1.setMaxAge(60*60*24*cookie);
			cookie1.setPath("/");
			Cookie cookie2=new Cookie("userPassword", userBean.getUserPassword());
			cookie2.setMaxAge(60*60*24*cookie);
			cookie2.setPath("/");
			Cookie cookie3=new Cookie("maxDay",cookie.toString());
			cookie3.setMaxAge(60*60*24*cookie);
			cookie3.setPath("/");
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			response.addCookie(cookie3);
		}
		
		return mav;
	}
	@RequestMapping("out.do")
	public ModelAndView out(HttpServletRequest re){
		ModelAndView mav=new ModelAndView("../html/login.jsp");
		 HttpSession session = re.getSession();
		 session.removeAttribute("user");
		return mav;
	}
	@RequestMapping("updatePassword.do")
	public void updatePassword(HttpServletResponse response,HttpServletRequest re,UserBean userBean)
	{
		userService.updateUser(userBean);
		ModelAndView mav=new ModelAndView("../html/login.jsp");
		HttpSession session = re.getSession();
		session.removeAttribute("user");
		
		Cookie cookie2=new Cookie("userPassword", userBean.getUserPassword());
		cookie2.setMaxAge(0);
		cookie2.setPath("/");
		Cookie cookie3=new Cookie("maxDay","0");
		cookie3.setMaxAge(0);
		cookie3.setPath("/");

		response.addCookie(cookie2);
		response.addCookie(cookie3);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script type='text/javascript'>window.top.location='../html/login.jsp'</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
}
