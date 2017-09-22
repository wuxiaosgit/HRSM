package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xhhy.domain.DeptBean;
import com.xhhy.service.DeptService;

@Controller
@RequestMapping("dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("listdept.do")
	public String listdept(){
		List<DeptBean> deptBeans= deptService.listDept();
		for (DeptBean deptBean : deptBeans) {
			System.out.println(deptBean);
		}
		DeptBean deptBean=deptService.getDeptById(1);
		System.out.println(deptBean);
		return "../html/login.jsp";
	}
	
}
