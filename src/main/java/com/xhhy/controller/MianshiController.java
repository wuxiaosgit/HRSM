package com.xhhy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xhhy.domain.MianshiBean;
import com.xhhy.service.MianshiService;
import com.xhhy.utils.State;

@Controller
@RequestMapping("mianshi")
public class MianshiController {
	@Autowired
	private MianshiService mianshiService;
	//------------------------查询所有面试信息------------------------------
		@RequestMapping("selectAll")
		public String selectAll(Model model){
			
			List<MianshiBean> list = mianshiService.selectAll();
			System.out.println(list);
			model.addAttribute("list",list);
			
			return "/html/zhaopin/demo3/list.jsp";
		}
		//------------------------根据ID查询单条面试信息------------------------------------------
		@RequestMapping("selectByPrimaryKey")
		public String selectByPrimaryKey(Model model,int mianshiId,String method){
			//System.out.println(zhaopinId);
			MianshiBean mianshiBean = mianshiService.selectByPrimaryKey(mianshiId);
			//System.out.println(zhaopinBean);
			model.addAttribute("mianshiBean",mianshiBean);
			if(method.equals("change")){
				return "/html/zhaopin/demo3/up.jsp";
			}else{
				return "/html/zhaopin/demo3/view.jsp";
			}
			
		}
		//-----------------------多选择修改面试信息-----------------------------------------
		@RequestMapping("updateByPrimaryKeySelective")
		public String updateByPrimaryKeySelective(MianshiBean mianshiBean,String method ){
			//System.out.println(zhaopinBean.getZhaopinId());
			System.out.println(method);
			if(method!=null&&method.equals("del")){
				mianshiBean.setState(State.DEL);
				mianshiService.updateByPrimaryKeySelective(mianshiBean);
				return "selectAll.do";
			}else{
				mianshiBean.setState(State.UNDEL);
				mianshiService.updateByPrimaryKeySelective(mianshiBean);
				return "selectAll.do";
			}
			
		}
		//-------------------------添加面试信息--------------------------
		@RequestMapping("insertSelective")
		public String insertSelective(MianshiBean mianshiBean){
			System.out.println(mianshiBean);
			mianshiBean.setState(State.SAVE);
			mianshiService.insertSelective(mianshiBean);
			return "selectAll.do";
		}
}
