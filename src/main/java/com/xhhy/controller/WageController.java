package com.xhhy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.WageBean;
import com.xhhy.service.WageService;
import com.xhhy.utils.PageUtil;

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
		return "redirect:list.do";
	}
	@RequestMapping(value="standard_view.do",method=RequestMethod.GET)
	public ModelAndView standard(int wageId){
		WageBean wage = service.selectById(wageId);
		ModelAndView mav=new ModelAndView("/html/pay/standard_view.jsp");
		mav.addObject("wageBean", wage);
		return mav;
	}
	@RequestMapping(value="standard_view_sp.do",method=RequestMethod.GET)
	public ModelAndView standardsp(int wageId){
		WageBean wage = service.selectById(wageId);
		ModelAndView mav=new ModelAndView("/html/pay/standard_view_sp.jsp");
		mav.addObject("wageBean", wage);
		return mav;
	}
	//全部查询
	@RequestMapping(value="list.do")
	public ModelAndView selectList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,String wagebmm,Integer wagestat,Integer wageId ){
		int pageRows=5;
		long allCount = service.selectAllCount();
		int totleRows=Integer.parseInt(allCount+"");
		PageUtil page=new PageUtil(pageNum,pageRows,totleRows);
		ModelAndView mav=new ModelAndView("/html/pay/list_standard.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", page.getStart());
		map.put("pageRows", 5);
		map.put("wageBm", wagebmm);
		map.put("wageStat", wagestat);
		List<WageBean> list = service.queryWage(map);
		mav.addObject("wageBm", wagebmm);
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.addObject("wageStat", wagestat);
		return mav;
	}
	//传入bm和审核状态查询出List
		@RequestMapping(value="queryListByLike.do")
		public ModelAndView queryByLike(String wagebmm,Integer wagestat){
			ModelAndView mav=new ModelAndView("/html/pay/list_standard.jsp");
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("wageBm", wagebmm);
			map.put("sta", wagestat);
			map.put("pageRows", 5);
			List<WageBean> list = service.queryWage(map);
			mav.addObject("list",list);
			return mav;
		}
	//根据ID查询然后传入后台显示可以修改
	@RequestMapping(value="standard_update.do",method=RequestMethod.GET)
	public ModelAndView standardUpdate(Integer wageId){
		ModelAndView mav=new ModelAndView("/html/pay/standard_update.jsp");
		WageBean wage = service.selectById(wageId);
		mav.addObject("wageBean",wage);
		return mav;
	}
	//从前端获取对象传入后台然后修改wage
	@RequestMapping(value="standard_update2.do")
	public String standardUpdate2(@ModelAttribute WageBean wage){
		service.updateWage(wage);
		return "redirect:list.do";
	}
	//从前端获取id然后在后台删除对象
	@RequestMapping(value="wagedelete.do")
	public String wageDelete(int wageId){
		service.deleteWage(wageId);
		return "redirect:list.do";
	}
	//根据对象的审核状态查询后传入前端遍历显示
	@RequestMapping(value="selectBySta.do")
	public ModelAndView selectBySta(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,String wageBm){
		long allCount = service.selectAllCount();
		int totleRows=Integer.parseInt(allCount+"");
		PageUtil page=new PageUtil(pageNum,5,totleRows);
		ModelAndView mav=new ModelAndView("/html/pay/list_standard_sp.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", page.getStart());
		map.put("pageRows", 5);
		map.put("wageBm", wageBm);
		map.put("wageStat", 1);
		List<WageBean> list = service.queryWage(map);
		mav.addObject("wageBm", wageBm);
		mav.addObject("list", list);
		mav.addObject("page", page);
		return mav;
	}
	//根据ID查出对象在前端显示然后审批
	@RequestMapping(value="auditing.do")
	public ModelAndView auditing(int wageId){
		ModelAndView mav=new ModelAndView("/html/pay/standard_edit.jsp");
		WageBean wage = service.selectById(wageId);
		mav.addObject("wage",wage);
		return mav;
	}
	//修改状态值
	@RequestMapping(value="wageSp.do")
	public  ModelAndView wageSp(int wageId,int stat){
		ModelAndView mav=new ModelAndView("redirect:selectBySta.do");
		WageBean wage = service.selectById(wageId);
		wage.setWageStatment(stat);
		service.updateWage(wage);
		return mav;
	}
	@RequestMapping(value="queryByBm.do")
	public ModelAndView queryByBm(String wageBm){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("wageBm", wageBm);
		List<WageBean> list = service.queryWage(map);
		ModelAndView mav=new ModelAndView("/html/pay/list_standard_sp.jsp");
		mav.addObject("list",list);
		return mav;
	}
	@RequestMapping(value="deleteList.do")
	public String deleteList(Integer[] ids ){
		for (Integer integer : ids) {
			service.deleteWage(integer);
		}
		return "list.do";
	}
}
