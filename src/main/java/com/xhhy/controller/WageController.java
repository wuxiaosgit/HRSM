package com.xhhy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.WageBean;
import com.xhhy.service.WageService;

@Controller
@RequestMapping("/html/pay/wage")
public class WageController {
	@Autowired
	private WageService service;
	@RequestMapping(value="insertwage.do")
	public String insertWage(WageBean wage){
		String result="添加成功";
		System.out.println(111);
		try {
			service.insertWage(wage);
		} catch (Exception e) {
			result="添加失败";
			e.printStackTrace();
		}
		return "/html/pay/succe.jsp";
	}
	@RequestMapping(value="list.do",method=RequestMethod.GET)
	public ModelAndView selectList(){
		ModelAndView mav=new ModelAndView("/html/pay/list_standard.jsp");
		List<WageBean> list = service.listWage();
		for (WageBean wageBean : list) {
			System.out.println(wageBean.getWageBm());
			
		}
		mav.addObject("list",list);
		return mav;
	}
}
