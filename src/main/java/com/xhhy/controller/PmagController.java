package com.xhhy.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.sun.net.httpserver.Authenticator.Success;


import com.xhhy.domain.PmagBean;
import com.xhhy.service.PmagService;
import com.xhhy.utils.PageUtilPmag;


@Controller
@RequestMapping("pmag")
public class PmagController {
	@Autowired
	private PmagService pmagService;
	
	public PmagService getPmagService() {
		return pmagService;
	}

	public void setPmagService(PmagService pmagService) {
		this.pmagService = pmagService;
	}
	//人事办理
		@RequestMapping("querylike2.do")//模糊查询
		public String queryLike2(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum,String pmagName,String starttime,String endtime,ModelMap map){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date dateend=null;
			Date datestart=null;
			if (starttime==null||endtime == null) {
				
			}else{
				if (!"".equals(starttime)) {
					try {
						datestart= sdf.parse(starttime);	
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (!"".equals(endtime)) {
					try {
						dateend =  sdf.parse(endtime);
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
			}
			Map<String,Object> keys=new HashMap<String, Object>();
			keys.put("pmagName", pmagName);
			keys.put("datestart", datestart);
			keys.put("dateend", dateend);
			PageUtilPmag page=new PageUtilPmag();
			page.setPageNum(pageNum);
			keys.put("start", page.getStart());
			keys.put("pageRows", page.getPageRows());
			List<PmagBean> pmags=pmagService.selectLike2(page,keys);
			map.addAttribute("page", page);
			map.addAttribute("pmags", pmags);
			map.addAttribute("pmagName", pmagName);
			map.addAttribute("starttime", starttime);
			map.addAttribute("endtime", endtime);
			return "/html/pmag/demo1/list2.jsp";
		}
	//添加
	@RequestMapping("add.do")
		public ModelAndView pmagAdd(@ModelAttribute PmagBean pmag){
			pmag.setPmagState("1");
			pmagService.insertPmag(pmag);
			ModelAndView model=new ModelAndView("querylike.do");
			return model;
		}
		
	@RequestMapping("insert.do")//待审批
	public ModelAndView insertPmag(@ModelAttribute PmagBean pmag){	
		pmag.setPmagState("2");
		pmagService.insertPmag(pmag);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	@RequestMapping("fail.do")//驳回
	public ModelAndView fail(@ModelAttribute PmagBean pmag){
		pmagService.updateFail(pmag);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	@RequestMapping("success.do")//审核通过
	public ModelAndView success(@ModelAttribute PmagBean pmag){
		pmagService.updateSuccess(pmag);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	@RequestMapping("pmagReView.do")//复核
	public String pmagReView(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagReView(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/add.jsp";
	}
	@RequestMapping("pmagHandle.do")//办理
	public String pmagHandle(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagReView(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/edit.jsp";
	}
	//修改
	@RequestMapping("pmagXG.do")
	public String pmagXG(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagXG(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/update.jsp";
	}
	
	//档案管理
	@RequestMapping("querylike.do")
	public String queryLike(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum,String pmagName,Integer pmagState,Integer pmagVerifyState,String starttime,String endtime,ModelMap map){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dateend=null;
		Date datestart=null;
		if (starttime==null||endtime == null) {
			
		}else{
			if (!"".equals(starttime)) {
				try {
					datestart= sdf.parse(starttime);	
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (!"".equals(endtime)) {
				try {
					dateend =  sdf.parse(endtime);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
			if (pmagState !=null&&pmagState==0) {
				pmagState= null;
			}	
			if (pmagVerifyState!= null&&pmagVerifyState==0) {
				pmagVerifyState= null;
			}	
		Map<String,Object> keys=new HashMap<String, Object>();
		keys.put("pmagName", pmagName);
		keys.put("pmagState", pmagState);
		keys.put("pmagVerifyState", pmagVerifyState);
		keys.put("datestart", datestart);
		keys.put("dateend", dateend);
		PageUtilPmag page=new PageUtilPmag();
		page.setPageNum(pageNum);
		keys.put("start", page.getStart());
		keys.put("pageRows", page.getPageRows());
		List<PmagBean> pmags= pmagService.selectLike(page,keys);
		map.addAttribute("page", page);
		map.addAttribute("pmags",pmags);
		map.addAttribute("pmagName", pmagName);
		map.addAttribute("pmagVerifyState", pmagVerifyState);
		map.addAttribute("pmagState", pmagState);
		map.addAttribute("starttime", starttime);
		map.addAttribute("endtime", endtime);
		return "/html/pmag/demo1/list.jsp";
	}
	//明细
	@RequestMapping("selectAll.do")
	public String selectAll(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.selectAll(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/view.jsp";
	}	
	//删除档案状态
	@RequestMapping("pmagbyDt.do")
	public ModelAndView pmagbyDt(int pmagId){
		pmagService.pmagByDt(pmagId);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	//恢复档案状态
	@RequestMapping("pmagbyHf.do")
	public ModelAndView pmagbyHf(int pmagId){
		pmagService.pmagByHf(pmagId);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	//永久删除
	@RequestMapping("delectPmag.do")
	public ModelAndView deletePmag(int pmagId){
		pmagService.deletePmag(pmagId);
		ModelAndView model=new ModelAndView("querylike.do");
		return model;
	}
	
}
