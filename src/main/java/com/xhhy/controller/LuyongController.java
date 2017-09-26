package com.xhhy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xhhy.domain.JianliBean;
import com.xhhy.domain.MianshiBean;
import com.xhhy.service.JianliService;
import com.xhhy.service.MianshiService;
import com.xhhy.utils.PageUtil;
import com.xhhy.utils.State;
@Controller
@RequestMapping("luyong")
public class LuyongController {
			@Autowired
			private JianliService jianliService;
			@Autowired 
			private MianshiService mianshiService;
	
	//-----------------在面试管理中分页展示所简历信息selectJianliRoleDeptPages---------------------------
			//------------------分页展示录用信息-----------------------------
			@RequestMapping("selectJianliLuyongRoleDeptPages")
			public String selectJianliLuyongRoleDeptPages(Model model,PageUtil pageUtil){
				//System.out.println(pageUtil);

				//deptBean.setDeptState(State.UNDEL);
				//roleBean.setRoleState(State.UNDEL);
				//roleBean.setDeptBean(deptBean);
				//jianliBean.setRoleBean(roleBean);
				
				//jianliBean.setState(State.SAVE);
				
				List<JianliBean> list = jianliService.selectJianliLuyongRoleDept();
				//System.out.println(list.get(0).getRoleBean().getDeptBean().getDeptName());
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

				List<JianliBean> lists = jianliService.selectJianliLuyongRoleDeptPages(map);

				model.addAttribute("list", lists);
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("pageRows", pageRows);
				model.addAttribute("totlePages", totlePages);
				model.addAttribute("totleRows", totleRows);
				model.addAttribute("pn", pn);
				/*for (ZhaopinBean zhaopinBean : list) {
					System.out.println(zhaopinBean.getRoleBean());
				}*/
				return "/html/zhaopin/demo4/list.jsp";
			}
			
			//----------------------根据简历id查询简历信息和面试信息  ----------------------------------
			@RequestMapping("selectByJianliId")
			public String selectByJianliId(Model model,int jianliId,String method){
				//System.out.println(zhaopinId);
				JianliBean jianliBean = jianliService.selectByPrimaryKey(jianliId);
				List<MianshiBean> lists = mianshiService.selectByJianliId(jianliId);
				//System.out.println(zhaopinBean);
				model.addAttribute("jianliBean",jianliBean);
				model.addAttribute("lists", lists);
				if(method.equals("change")){
					return "/html/zhaopin/demo4/add.jsp";
				}else{
					return "/html/zhaopin/demo4/view.jsp";
				}
			}	
			
			//-------------------------添加面试信息--------------------------
			@RequestMapping("insertSelective")
			public String insertSelective(int state,int jianliId){
				state +=1;
				jianliService.updateByPrimaryKeyAndState(state,jianliId);
				return "selectJianliLuyongRoleDeptPages.do";
			}
			
			//---------------------------多条件分页展示所有简历信息-------------------------------------
			@RequestMapping("selectJianliRoleDeptPagesBySelective3")
			public String selectJianliRoleDeptPagesBySelective3(Model model,JianliBean jianliBean){
				System.out.println(jianliBean);
				List<JianliBean> list = jianliService.selectJianliRoleDeptPagesBySelective3(jianliBean);
				System.out.println(list);
				model.addAttribute("list", list);
				return "/html/zhaopin/demo4/list.jsp";
			}
}
