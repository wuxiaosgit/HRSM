package com.xhhy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.WageBean;
import com.xhhy.service.WageService;

@Controller
@RequestMapping("html/pay/wage")
public class WageController {
	//注入service对象
	@Autowired
	private WageService service;
	//添加wage对象
	@RequestMapping(value="insertwage.do",method=RequestMethod.POST)
	public String insertWage(WageBean wage){
		service.insertWage(wage);
		return "list.do";
	}
	//全部查询
	@RequestMapping(value="list.do")
	public ModelAndView selectList(){
		ModelAndView mav=new ModelAndView("/html/pay/list_standard.jsp");
		List<WageBean> list = service.listWage();
		for (WageBean wageBean : list) {
			System.out.println(wageBean.getWageBm());
		}
		mav.addObject("list",list);
		return mav;
	}
	//根据id查询然后传入后台显示出来
	@RequestMapping(value="standard_view.do",method=RequestMethod.GET)
	public ModelAndView standard(int wageId){
		ModelAndView mav=new ModelAndView("/html/pay/standard_view.jsp");
		WageBean wage = service.selectById(wageId);
		mav.addObject("wageBean",wage);
		return mav;
	}
	//根据ID查询然后传入后台显示可以修改
	@RequestMapping(value="standard_update.do",method=RequestMethod.GET)
	public ModelAndView standardUpdate(int wageId){
		ModelAndView mav=new ModelAndView("/html/pay/standard_update.jsp");
		WageBean wage = service.selectById(wageId);
		mav.addObject("wageBean",wage);
		return mav;
	}
	//从前端获取对象传入后台然后修改wage
	@RequestMapping(value="standard_update2.do")
	public String standardUpdate2(@ModelAttribute WageBean wage){
		service.updateWage(wage);
		return "list.do";
	}
	//从前端获取id然后在后台删除对象
	@RequestMapping(value="wagedelete.do")
	public String wageDelete(int wageId){
		System.out.println(111);
		System.out.println(wageId);
		service.deleteWage(wageId);
		return "list.do";
	}
	//根据对象的审核状态查询后传入前端遍历显示
	@RequestMapping(value="selectBySta.do")
	public ModelAndView selectBySta(){
		ModelAndView mav=new ModelAndView("/html/pay/list_standard_sp.jsp");
		List<WageBean> list = service.selectBySta(1);
		mav.addObject("list",list);
		return mav;
	}
	//根据ID查出对象在前端显示然后审批
	@RequestMapping(value="auditing.do")
	public ModelAndView auditing(int wageId){
		WageBean wage = service.selectById(wageId);
		ModelAndView mav=new ModelAndView("/html/pay/standard_edit.jsp");
		mav.addObject("wage", wage);
		return mav;
	}
	//修改状态值
	@RequestMapping(value="wageSp.do")
	public  String wageSp(int wageId,int stat){
		System.out.println(wageId+stat);
		WageBean wage = service.selectById(wageId);
		wage.setWageStatment(stat);
		service.updateWage(wage);
		return "selectBySta.do";
	}
	//传入bm和审核状态查询出List
	@RequestMapping(value="queryListByLike.do")
	public ModelAndView queryByLike(String wagebmm,Integer wagestat){
		System.out.println(wagebmm+wagestat);
		ModelAndView mav=new ModelAndView("/html/pay/list_standard.jsp");
		/*int sta=0;
		if (stat=="-- 请选择--") {
			sta=0;
		}if(stat=="-- 审核中--"){
			sta=1;
		}if(stat=="-- 已通过--"){
			sta=2;
		} */
		Map<String, Object> map = new HashMap<>();
		map.put("wageBm", wagebmm);
		map.put("sta", wagestat);
		List<WageBean> list = service.queryByLike(map);
		mav.addObject("list",list);
		return mav;
	}
}
