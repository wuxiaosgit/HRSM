package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.MenuBean;
import com.xhhy.domain.UserBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.UserService;

@Controller
@RequestMapping("dept")
@SessionAttributes("deptBeans")
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
			mav.addObject("user1",userService.getUserById(userId));
//			System.out.println(userService.getUserById(userId));
		}
			
		mav.addObject("deptBeans",deptService.listDept());
		return mav;
	}
	
	@RequestMapping("getDeptById.do")
	public ModelAndView getDeptById(Integer deptId){
		
		ModelAndView mav=new ModelAndView("../html/resource/demo1/view.jsp");
		DeptBean deptBean= deptService.getDeptById(deptId);
		mav.addObject("deptBean",deptBean);
		return mav;
	}
	
	@RequestMapping("selectDept.do")
	public ModelAndView selectDept(){
		ModelAndView mav=new ModelAndView("../html/resource/demo1/ifm.jsp");
		List<DeptBean> listDept = deptService.getListDept();
		/*for (DeptBean deptBean2 : listDept) {
			System.out.println(deptBean2);
			for (DeptBean deptBean3 : deptBean2.getDeptBeans()) {
				System.out.println(deptBean3);
			}
		}*/
		mav.addObject("deptBeans",listDept);
		return mav;
	}
	@RequestMapping("getTopDept")
	public ModelAndView getTopDept(Integer deptId){
		ModelAndView mav=new ModelAndView("../html/resource/demo1/add.jsp");
		if (deptId != null) {
			DeptBean deptBean=deptService.getDeptById(deptId);
			mav.addObject("deptBean",deptBean);
		}
		mav.addObject("topDepts",deptService.getTopDept());
		return mav;
		
	}
	@RequestMapping("insertDept.do")
	public ModelAndView insertDept(DeptBean deptBean){
//		System.out.println(deptBean);
		if (deptBean.getDeptId()==null) {
			//添加该做的事
			deptService.insertDept(deptBean);
		}else{
			deptService.updateDept(deptBean);
		}
		return new ModelAndView("../html/resource/demo1/wecom.jsp");
	}
	
	@RequestMapping("deleteDept.do")
	public ModelAndView deleteDept(Integer deptId){
		deptService.deleteDept(deptId);
		return selectDept();
	}
	@RequestMapping("noDeleteDept.do")
	public ModelAndView noDeleteDept(Integer deptId){
		DeptBean deptBean=deptService.getDeptById(deptId);
		deptBean.setDeptState(0);
		deptService.updateDept(deptBean);
		return selectDept();
	}
}
