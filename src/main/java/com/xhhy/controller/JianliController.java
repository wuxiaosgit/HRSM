package com.xhhy.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.xa.Xid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xhhy.domain.DeptBean;
import com.xhhy.domain.JianliBean;
import com.xhhy.domain.RoleBean;
import com.xhhy.domain.ZhaopinBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.JianliService;
import com.xhhy.service.RoleService;
import com.xhhy.service.ZhaopinService;
import com.xhhy.utils.PageUtil;
import com.xhhy.utils.State;

@Controller
@RequestMapping("jianli")
public class JianliController {
	@Autowired
	private JianliService jianliService;
	@Autowired
	private ZhaopinService zhaopinService;
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
		if(method!=null&&method.equals("del")){
			jianliBean.setState(State.DEL);
			jianliService.updateByPrimaryKeySelective(jianliBean);
			return "redirect:selectJianliRoleDeptPages.do";
		}else{
			//jianliBean.setState(State.UNDEL);
			jianliService.updateByPrimaryKeySelective(jianliBean);
			return "redirect:selectJianliRoleDeptPages.do";
		}
		
	}
	//---------------------------------------------
	
	@RequestMapping("updateByPrimaryKeyAndState")
	public void updateByPrimaryKeyAndState(int state,int jianliId){
			//System.out.println("state="+state);
			//System.out.println(jianliId);
			jianliService.updateByPrimaryKeyAndState(state,jianliId);
		}
		
	
	
	//-------------------------添加简历-上传文件-------------------------
	@RequestMapping("insertSelective")
	public String insertSelective(JianliBean jianliBean,HttpServletRequest request,HttpServletResponse response){
		//System.out.println(jianliBean);
		 MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) request;
		 MultipartFile file = multipartRequest.getFile("newfile");
		 String fileName = file.getOriginalFilename();
		 String mime = file.getContentType();
		 System.out.println(mime);
		 
		 String fujian = "f:/"+UUID.randomUUID().toString()+"."+mime;
		 try {
			InputStream in = file.getInputStream();
			
			OutputStream out = new FileOutputStream(fujian);
			FileCopyUtils.copy(in, out);
			out.close();
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jianliBean.setState(State.SAVE);
		jianliBean.setFujian(fujian);
		jianliBean.setFilename(fileName);
		jianliService.insertSelective(jianliBean);
		
		return "redirect:selectJianliRoleDeptPages.do";
	}
	//-------------------------文件下载-------------------------------
	@RequestMapping("download.do")
	public void download(HttpServletRequest request , HttpServletResponse response,int jianliId){
		JianliBean jianliBean = jianliService.selectByPrimaryKey(jianliId);
		response.setHeader("content-disposition", "attachment;filename=" + jianliBean.getFilename()); // 下载文件的时候 有一个中文乱码的问题（文件名）
		try {
			// 获取一个输入流 指向 savePath
			InputStream in = new FileInputStream(jianliBean.getFujian());
			OutputStream out = response.getOutputStream();//输出流指向了 客户端
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//------------------------获取部门信息和职位信息-----------------------------------------
		@RequestMapping("SelectRoleDept")
		public String listRole(Model model){
			List<ZhaopinBean> zhaopinBean = zhaopinService.selectAll();
			List<DeptBean> db = deptService.listDept();
			//System.out.println(roles);
			model.addAttribute("zhaopinBean",zhaopinBean);
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
		public String selectJianliRoleDeptPages2(Model model,JianliBean jianliBean,String roleName,PageUtil pageUtil){
			if(jianliBean==null){
				jianliBean = new JianliBean();
			}
			Map<String,Object> map =new HashMap<String, Object>();
			map.put("xingming", jianliBean.getXingming());
			map.put("roleName", roleName);
			map.put("jianyan", jianliBean.getJianyan());
			map.put("dtime", jianliBean.getDtime());
			List<JianliBean> list = jianliService.selectJianliRoleDept(map);
			
			int pageNum = 1;//页码
			int pn = pageUtil.getPageNum();
	
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
			
			
			
			map.put("pageUtil", pageUtil);
			map.put("pageStart", pageStart);
		


			List<JianliBean> lists = jianliService.selectJianliRoleDeptPages(map);

			model.addAttribute("list", lists);
			model.addAttribute("xingming_1", jianliBean.getXingming());
			model.addAttribute("roleName_1", roleName);
			model.addAttribute("jianyan_1", jianliBean.getJianyan());
			model.addAttribute("dtime_1", jianliBean.getDtime());
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("pageRows", pageRows);
			model.addAttribute("totlePages", totlePages);
			model.addAttribute("totleRows", totleRows);
			model.addAttribute("pn", pn);
			
			return "/html/zhaopin/demo2/list.jsp";
		}
		
		//---------------------------多条件分页展示所有简历信息-------------------------------------
				@RequestMapping("selectJianliRoleDeptPagesBySelective")
				public String selectJianliRoleDeptPagesBySelective(Model model,JianliBean jianliBean){

					List<JianliBean> list = jianliService.selectJianliRoleDeptPagesBySelective(jianliBean);
					model.addAttribute("list", list);
					return "/html/zhaopin/demo2/list.jsp";
				}
}
