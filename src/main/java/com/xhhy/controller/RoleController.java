package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.RoleBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("ajaxRole.do")
	public @ResponseBody  List<RoleBean> ajaxRole(Integer deptId){
		System.out.println(deptId);
		RoleBean roleBean=new RoleBean();
		roleBean.setDeptId(deptId);
		return roleService.listRole( roleBean);
	}
	@RequestMapping("selectRole.do")
	public ModelAndView listdept(RoleBean roleBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo3/list.jsp");
		if (roleBean.getDeptId()!=null&&roleBean.getDeptId()==-1) {
			roleBean.setDeptId(null);
		}
		System.out.println(roleBean);
		if (roleBean.getRoleState()!=null&&roleBean.getRoleState() == -1) {
			roleBean.setRoleState(null);
		}
		List<RoleBean> roleBeans= roleService.listRole(roleBean);
		for (RoleBean roleBean2 : roleBeans) {
			System.out.println(roleBean2);
			System.out.println(roleBean2.getDeptBean());
		}
		mav.addObject("roleBeans",roleBeans);
		
		mav.addObject("deptBeans",deptService.listDept());
		return mav;
	}
}
