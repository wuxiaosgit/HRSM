package com.xhhy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.RoleBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.MenuService;
import com.xhhy.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private MenuService menuService;
	@RequestMapping("ajaxRole.do")
	public @ResponseBody  List<RoleBean> ajaxRole(Integer deptId){
//		System.out.println(deptId);
		RoleBean roleBean=new RoleBean();
		roleBean.setDeptId(deptId);
		return roleService.listRole( roleBean);
	}
	@RequestMapping("getMenu.do")
	public ModelAndView getMenu(String type,Integer roleId){
		
		ModelAndView mav=new ModelAndView("../html/resource/demo3/add.jsp");
		return mav;
				
	}
	/*@RequestMapping(value="ajaxTestName.do",produces="text/html;charSet=utf-8")
	@ResponseBody
	public String ajaxTestName(String roleName){
		System.out.println(roleName);
		return "ok";
	}*/
	@RequestMapping("addRole.do")
	public ModelAndView addRole(Integer roleId){
		
		ModelAndView mav=new ModelAndView("../html/resource/demo3/add.jsp");
		if (roleId==null) {
			
		}else{
			mav.addObject("roleBean",roleService.getRoleById(roleId));
		}
		mav.addObject("deptBeans",deptService.getListDept());
		mav.addObject("menus",menuService.getMenus());
		return mav;
	}
	@RequestMapping("insertRole.do")
	public ModelAndView insertRole(RoleBean roleBean,@RequestParam(value="menu",required=false)List<Integer> menu){
		if(menu==null){
			menu=new ArrayList<Integer>();
		}
		if (roleBean.getRoleId()==null) {
			
			roleService.insertRole(roleBean,menu);
		}else{
			roleService.updateRole(roleBean,menu);
		}
		
		return selectRole(null);
	}
	@RequestMapping("deleteRole.do")
	public ModelAndView deleteRole(Integer  roleId){
		roleService.deleteRole(roleId);
		
		return selectRole(null);
	}
	@RequestMapping("noDeleteRole.do")
	public ModelAndView noDeleteRole(Integer  roleId){
		RoleBean roleBean = roleService.getRoleById(roleId);
		roleBean.setRoleState(0);
		List<Integer> menu=new ArrayList<Integer>();
		roleService.updateRole(roleBean, menu);
		return selectRole(null);
	}
	
	@RequestMapping("selectRole.do")
	public ModelAndView selectRole(RoleBean roleBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo3/list.jsp");
		if (roleBean==null) {
			roleBean=new RoleBean();
		}
		if (roleBean.getDeptId()!=null&&roleBean.getDeptId()==-1) {
			roleBean.setDeptId(null);
		}
		if (roleBean.getRoleState()!=null&&roleBean.getRoleState() == -1) {
			roleBean.setRoleState(null);
		}
		List<RoleBean> roleBeans= roleService.listRole(roleBean);
		Integer max=roleService.max(roleBean);
		/*for (RoleBean roleBean2 : roleBeans) {
			System.out.println(roleBean2);
			System.out.println(roleBean2.getDeptBean());
		}*/
		mav.addObject("roleBeans",roleBeans);
		
		mav.addObject("deptBeans",deptService.listDept());
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", roleBean.getCurrentNum());
		return mav;
	}
}
