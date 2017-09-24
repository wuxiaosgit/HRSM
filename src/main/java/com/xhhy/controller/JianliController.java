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
import com.xhhy.domain.JianliBean;
import com.xhhy.domain.RoleBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.JianliService;
import com.xhhy.service.RoleService;
import com.xhhy.utils.PageUtil;
import com.xhhy.utils.State;

@Controller
@RequestMapping("jianli")
public class JianliController {
	@Autowired
	private JianliService jianliService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private DeptService deptService;
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
	
	
	
	//------------------------获取部门信息和职位信息-----------------------------------------
		@RequestMapping("SelectRoleDept")
		public String listRole(Model model){
			List<RoleBean> roles = roleService.SelectRoleDept();
			List<DeptBean> db = deptService.listDept();
			//System.out.println(roles);
			model.addAttribute("roles",roles);
			model.addAttribute("db", db);
			return "/html/zhaopin/demo2/add.jsp";
		}
		
		//-----------------通过职位名获取职位信息-----------------------------------------
		@RequestMapping("selectRoleByRoleName")
		public @ResponseBody RoleBean selectRoleByRoleName(HttpServletRequest request,HttpServletResponse response) throws Exception{
			String roleName = request.getParameter("roleName");
			roleName =  java.net.URLDecoder.decode(roleName, "UTF-8");
			//System.out.println(roleName);
			RoleBean rb = roleService.selectRoleByRoleName(roleName);
			//System.out.println(rb.getDeptBean().getDeptShortName());
			response.setContentType("text/xml;charset=UTF-8"); 
			return rb;
		} 
		
		
		//---------------------------分页展示所有简历信息-------------------------------------
		@RequestMapping("selectJianliRoleDeptPages")
		public String selectJianliRoleDeptPages2(Model model,PageUtil pageUtil){
			//System.out.println(pageUtil);

			//deptBean.setDeptState(State.UNDEL);
			//roleBean.setRoleState(State.UNDEL);
			//roleBean.setDeptBean(deptBean);
			//jianliBean.setRoleBean(roleBean);
			
			//jianliBean.setState(State.SAVE);
			
			List<JianliBean> list = jianliService.selectJianliRoleDept();
			System.out.println(list.get(0).getRoleBean().getDeptBean().getDeptName());
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
			System.out.println(pageStart);
			System.out.println(pageNum);
			Map<String,Object> map =new HashMap<String, Object>();
			//map.put("zb", jianliBean);
			map.put("pageUtil", pageUtil);
			map.put("pageStart", pageStart);

			List<JianliBean> lists = jianliService.selectJianliRoleDeptPages(map);

			model.addAttribute("list", lists);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("pageRows", pageRows);
			model.addAttribute("totlePages", totlePages);
			model.addAttribute("totleRows", totleRows);
			model.addAttribute("pn", pn);
			/*for (ZhaopinBean zhaopinBean : list) {
				System.out.println(zhaopinBean.getRoleBean());
			}*/
			return "/html/zhaopin/demo2/list.jsp";
		}
}
