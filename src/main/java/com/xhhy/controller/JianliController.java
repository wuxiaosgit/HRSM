package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xhhy.domain.JianliBean;
import com.xhhy.service.JianliService;
import com.xhhy.utils.State;

@Controller
@RequestMapping("jianli")
public class JianliController {
	@Autowired
	private JianliService jianliService;
	
	//------------------------查询所以有简历信息------------------------------
	@RequestMapping("selectAll")
	public String selectAll(Model model){
		
		List<JianliBean> list = jianliService.selectAll();
		//System.out.println(list);
		model.addAttribute("list",list);
		
		return "/html/zhaopin/demo2/list.jsp";
	}
	//------------------------根据ID查询单条简历信息------------------------------------------
	@RequestMapping("selectByPrimaryKey")
	public String selectByPrimaryKey(Model model,int jianliId,String method){
		//System.out.println(zhaopinId);
		JianliBean jianliBean = jianliService.selectByPrimaryKey(jianliId);
		//System.out.println(zhaopinBean);
		model.addAttribute("jianliBean",jianliBean);
		if(method.equals("change")){
			return "/html/zhaopin/demo2/up.jsp";
		}else{
			return "/html/zhaopin/demo2/view.jsp";
		}
		
	}
	//-----------------------多选择修改简历-----------------------------------------
	@RequestMapping("updateByPrimaryKeySelective")
	public String updateByPrimaryKeySelective(JianliBean jianliBean,String method ){
		//System.out.println(zhaopinBean.getZhaopinId());
		System.out.println(method);
		if(method!=null&&method.equals("del")){
			jianliBean.setState(State.DEL);
			jianliService.updateByPrimaryKeySelective(jianliBean);
			return "selectAll.do";
		}else{
			jianliBean.setState(State.UNDEL);
			jianliService.updateByPrimaryKeySelective(jianliBean);
			return "selectAll.do";
		}
		
	}
	//-------------------------添加简历--------------------------
	@RequestMapping("insertSelective")
	public String insertSelective(JianliBean jianliBean){
		System.out.println(jianliBean);
		jianliBean.setState(State.SAVE);
		jianliService.insertSelective(jianliBean);
		return "selectAll.do";
	}
}
