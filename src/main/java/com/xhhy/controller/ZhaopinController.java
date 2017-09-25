package com.xhhy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.RoleBean;
import com.xhhy.domain.ZhaopinBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.RoleService;
import com.xhhy.service.ZhaopinService;
import com.xhhy.utils.PageUtil;
import com.xhhy.utils.State;

@Controller
@RequestMapping("zhaopin")
public class ZhaopinController {
	@Autowired
	private ZhaopinService zhaopinService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private DeptService deptService;
	
	//---------------------查询所有招聘信息---------------------------------
	@RequestMapping("selectAll")
	public String selectAll(Model model,RoleBean roleBean){

		List<ZhaopinBean> list = zhaopinService.selectAll();
		model.addAttribute("zhaopinList", list);
		
		//System.out.println(list);
		
		return "/html/zhaopin/demo1/list.jsp";
	}
	
	/*@RequestMapping("view")
	public String a(){

		return "/html/zhaopin/demo1/add.jsp";
	}*/
	//-----------------删除招聘信息-----------------------------------------
	@RequestMapping("updateByPrimaryKeySelective")
	public String updateByPrimaryKeySelective(ZhaopinBean zhaopinBean,String method ){
		//System.out.println(method);
		if(method!=null&&method.equals("del")){
			zhaopinService.updateByPrimaryKeySelective(zhaopinBean);
			return "selectZhaoRoleDeptPages.do";
		}else{
			zhaopinService.updateByPrimaryKeySelective(zhaopinBean);
			return "selectZhaoRoleDeptPages.do";
		}
	
	}
	
	//-------------------添加招聘信息-------------------------------------------
	@RequestMapping("insertSelective")
	public String insertSelective(ZhaopinBean zhaopinBean){
		
		zhaopinBean.setState(State.UNDEL);
		//System.out.println(zhaopinBean.getRoleId());
		zhaopinService.insertSelective(zhaopinBean);
		return "selectZhaoRoleDeptPages.do";
	}
	
	//-----------------查询单个招聘信息------------------------------
	@RequestMapping("selectByPrimaryKey")
	public String selectByPrimaryKey(Model model,int zhaopinId,String method){
		//System.out.println(zhaopinId);
		ZhaopinBean zhaopinBean = zhaopinService.selectByPrimaryKey(zhaopinId);
		List<DeptBean> db = deptService.listDept();
		//System.out.println(roles);
		model.addAttribute("db", db);
		//System.out.println(zhaopinBean);
		model.addAttribute("zhaopinBean",zhaopinBean);
		//System.out.println(zhaopinBean.getZhaopinId());
		if(method.equals("change")){
			return "/html/zhaopin/demo1/up.jsp";
		}else{
			return "/html/zhaopin/demo1/view.jsp";
		}
	}
	
	//------------------------获取部门信息和职位信息-----------------------------------------
	@RequestMapping("SelectRoleDept")
	public String listRole(Model model){
		List<RoleBean> roles = roleService.SelectRoleDept();
		List<DeptBean> db = deptService.listDept();
		//System.out.println(roles);
		model.addAttribute("roles",roles);
		model.addAttribute("db", db);
		return "/html/zhaopin/demo1/add.jsp";
	}
	//----------------通过部门名获取职位----------------------------------------------
	@RequestMapping("selectRoleByDeptName")
	public @ResponseBody List<RoleBean> selectRoleByDeptName(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String deptName = request.getParameter("deptName");
		deptName =  java.net.URLDecoder.decode(deptName, "UTF-8");
		//System.out.println(deptName);
		List<RoleBean> list = roleService.selectRoleByDeptName(deptName);
		//System.out.println(list);
		response.setContentType("text/xml;charset=UTF-8"); 
		return list;
	} 
	//-----------------通过职位名获取职位信息-----------------------------------------
	@RequestMapping("selectRoleByRoleName")
	public @ResponseBody RoleBean selectRoleByRoleName(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String roleName = request.getParameter("roleName");
		roleName =  java.net.URLDecoder.decode(roleName, "UTF-8");
		//System.out.println(roleName);
		RoleBean rb = roleService.selectRoleByRoleName(roleName);
		//System.out.println(rb);
		response.setContentType("text/xml;charset=UTF-8"); 
		return rb;
	} 
	//------------------------查询特定条件的招聘信息并分页展示------------------------------
	@RequestMapping("selective")
	public String selective(Model model,ZhaopinBean zhaopinBean){
		System.out.println(zhaopinBean);
		List<ZhaopinBean> lists = zhaopinService.selective(zhaopinBean);
		model.addAttribute("list", lists);
		return "/html/zhaopin/demo1/list.jsp";
	}
	//---------------------------分页展示所有招聘信息-------------------------------------
	@RequestMapping("selectZhaoRoleDeptPages")
	public String selectZhaoRoleDeptPages(Model model,RoleBean roleBean,
			DeptBean deptBean,ZhaopinBean zhaopinBean,PageUtil pageUtil){
		//System.out.println(pageUtil);

		deptBean.setDeptState(State.UNDEL);
		roleBean.setRoleState(State.UNDEL);
		roleBean.setDeptBean(deptBean);
		zhaopinBean.setRoleBean(roleBean);
		
		zhaopinBean.setState(State.UNDEL);
		
		List<ZhaopinBean> list = zhaopinService.selectZhaoRoleDept();
		int pageNum = 1;//页码
		int pn = pageUtil.getPageNum();
		//System.out.println(pn);
	/*	if(pn != null){
			pageNum = Integer.parseInt(pn);
		}*/
		if(pn !=0){
			pageNum = pn;
		}
		//分页参数
		int pageRows = State.PAGEROWS;//每页显示的记录数
		int totleRows = 0;//符合条件的所有记录数
		int totlePages = 0;//总共的页数
		//计算符合条件的记录数
		totleRows = list.size();
		//计算总共的页数
		totlePages = totleRows%pageRows==0?totleRows/pageRows:totleRows/pageRows+1;
	
		
		pageUtil.setPageNum(pageNum);
		pageUtil.setPageRows(pageRows);
		pageUtil.setTotlePages(totlePages);
		pageUtil.setTotleRows(totleRows);
		
		int pageStart = pageUtil.getStart();
		//System.out.println(pageStart);
		
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("zb", zhaopinBean);
		map.put("pageUtil", pageUtil);
		map.put("pageStart", pageStart);
		//System.out.println(map.get("zb"));
		List<ZhaopinBean> lists = zhaopinService.selectZhaoRoleDeptPages(map);
		model.addAttribute("list", lists);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageRows", pageRows);
		model.addAttribute("totlePages", totlePages);
		model.addAttribute("totleRows", totleRows);
		model.addAttribute("pn", pn);
		/*for (ZhaopinBean zhaopinBean : list) {
			System.out.println(zhaopinBean.getRoleBean());
		}*/
		return "/html/zhaopin/demo1/list.jsp";
	}
	//---------------------------页面展示所有招聘信息-------------------------------------
		@RequestMapping("selectZhaoRoleDept")
		public String selectZhaoRoleDept(Model model){
			List<ZhaopinBean> list = zhaopinService.selectZhaoRoleDept();
			model.addAttribute("list", list);
			return "/html/zhaopin/demo1/list.jsp";
		}
	//--------------------页面展示单条招聘信息-------------------------------------
	@RequestMapping("selectAZhaoRoleDept")
	public String selectAZhaoRoleDept(Model model,ZhaopinBean zhaopinBean,String method){
		//System.out.println(zhaopinId);
		ZhaopinBean zb = zhaopinService.selectAZhaoRoleDept(zhaopinBean);
		//System.out.println(zb);
		model.addAttribute("zb", zb);
		//zb.getRoleBean().getDeptBean().getDeptName()
		/*for (ZhaopinBean zhaopinBean : list) {
			System.out.println(zhaopinBean.getRoleBean());
		}*/
		return "/html/zhaopin/demo1/view.jsp";
	}
}
