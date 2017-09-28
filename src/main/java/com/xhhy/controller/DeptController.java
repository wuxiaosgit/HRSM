package com.xhhy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.xhhy.domain.DeptBean;
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
	

	@RequestMapping("deptTree.do")
	public void deptree(HttpServletRequest request, HttpServletResponse response){
		String parameter = request.getParameter("id");
		Integer deptId=null;
		if (parameter!=null) {
			deptId = Integer.valueOf(parameter);
			
		}
		//System.out.println(deptId);
		List<DeptBean> deptBeans=null;
		JsonArray ja=new JsonArray();
		if (deptId==null) {
			deptBeans=deptService.getTopDept();
		}else{
			deptBeans=deptService.getChildDept(deptId);
		}
		for (DeptBean deptBean : deptBeans) {
			JsonObject jo=new JsonObject();
			jo.addProperty("id", deptBean.getDeptId());
			jo.addProperty("text", deptBean.getDeptName());
			jo.addProperty("state", "closed");
			ja.add(jo);
		}
		String json =ja.toString(); //"[{\"id\":1,\"text\":\"系统管理\",\"state\":\"closed\"},{\"id\":2,\"text\":\"人事管理\",\"state\":\"closed\"},{\"id\":3,\"text\":\"档案管理\"}]";
		//System.out.println(json);
		response.setContentType("json/application;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String json1 = "[{\"id\":1,\"text\":\"系统管理\",\"state\":\"closed\",\"children\":[{\"id\":11,\"text\":\"部门管理\"},{\"id\":12,\"text\":\"人事管理\"}]},{\"id\":2,\"text\":\"人事管理\"},{\"id\":3,\"text\":\"档案管理\"}]";
	
		out.print(json);
		out.flush();
		out.close();
		
	}
	
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
	
/*	@RequestMapping("deleteDept.do")
	public  deleteDept(Integer deptId){
	}*/
	
	@RequestMapping("noDeleteDept.do")
	public ModelAndView noDeleteDept(Integer deptId){
		/*deptService.deleteDept(deptId);
		DeptBean deptBean=deptService.getDeptById(deptId);
		deptBean.setDeptState(0);*/
		deptService.deleteDept(deptId);
		return new ModelAndView("../html/resource/demo1/wecom.jsp");
	}
}
