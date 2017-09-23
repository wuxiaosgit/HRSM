package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.MenuBean;
import com.xhhy.domain.UserBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.UserService;

@Controller
@RequestMapping("dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	@Autowired
	private UserService userService;
	@RequestMapping("listdept.do")
	public String listdept(){
		List<DeptBean> deptBeans= deptService.listDept();
		/*for (DeptBean deptBean : deptBeans) {
			System.out.println(deptBean);
		}*/
		DeptBean deptBean=deptService.getDeptById(1);
		return "../html/login.jsp";
	}
	
	@RequestMapping("ajaxdept.do")
	public @ResponseBody List<DeptBean> ajaxdept(){
		return deptService.listDept();
	}
	
	@RequestMapping("getDept.do")
	public ModelAndView addUser(String type,Integer userId){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/add.jsp");
		if (type==null||"".equals(type)) {
			mav.setViewName("../html/login.jsp");
		}else if("add".equals(type)) {
			
		}else if("update".equals(type)) {
			mav.addObject("user",userService.getUserById(userId));
			System.out.println(userService.getUserById(userId));
		}
			
		mav.addObject("deptBeans",deptService.listDept());
		return mav;
	}
}
