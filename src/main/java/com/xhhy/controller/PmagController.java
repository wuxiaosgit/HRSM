package com.xhhy.controller;


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.multipart.MultipartFile;
import com.xhhy.domain.DeptBean;
import com.xhhy.domain.PmagBean;
import com.xhhy.domain.WageBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.PmagService;
import com.xhhy.service.WageService;
import com.xhhy.utils.PageUtilPmag;


@Controller
@RequestMapping("pmag")
public class PmagController {
	@Autowired
	private PmagService pmagService;
	@Autowired
	private WageService wageService;
	@Autowired
	private DeptService deptService;
	
	public PmagService getPmagService() {
		return pmagService;
	}

	public void setPmagService(PmagService pmagService) {
		this.pmagService = pmagService;
	}
	
			/*.........................档案管理-list.jsp.................................*/
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
	    /*.............................人事办理-list2.jsp..............................*/
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
		/*............................档案登记..................................*/
	@RequestMapping("preAdd.do")
	public String preUpdate(ModelMap map){
		// 查询薪资标准列表
		List<WageBean> wages = wageService.listWage();
		map.put("wages", wages);		
		//查询部门
		List<DeptBean> dept= deptService.listDept();
		map.put("depts",dept);
		return "/html/pmag/demo1/add.jsp";
	}
	
	
	/*............................添加到档案中--起草..........................*/
	@RequestMapping("add.do")
	public ModelAndView pmagAdd(@ModelAttribute PmagBean pmag,@RequestParam("upload") MultipartFile upload){	
		String pmagFileType = upload.getContentType();
		String pmagFileName = upload.getOriginalFilename();
		String pmagFileURL="E:/upload/";
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString();
		fileName = fileName.replace("-", "");
		fileName = fileName + pmagFileName.substring(pmagFileName.lastIndexOf("."));
		pmagFileURL=pmagFileURL + fileName;
		try {
			InputStream in = upload.getInputStream();
			OutputStream out = new FileOutputStream(pmagFileURL);
			
			FileCopyUtils.copy(in, out);// 完成文件复制
			out.close();
			in.close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}
			pmag.setPmagState("1");
			pmag.setPmagFileName(pmagFileName);
			pmag.setPmagFileType(pmagFileType);
			pmag.setPmagFileURL(pmagFileURL);
			pmagService.insertPmag(pmag);
			ModelAndView model=new ModelAndView("redirect:querylike.do");
			return model;
		}
	
	     /*.............提交审核--待审核..............................*/
	@RequestMapping("add2.do")
	public ModelAndView pmagAdd2(@ModelAttribute PmagBean pmag,@RequestParam("upload") MultipartFile upload){
		String pmagFileType = upload.getContentType();
		String pmagFileName = upload.getOriginalFilename();
		String pmagFileURL="E:/upload/";
		String fileName=null;
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString();
		fileName = fileName.replace("-", "");
		fileName = fileName + pmagFileName.substring(pmagFileName.lastIndexOf("."));
		pmagFileURL=pmagFileURL + fileName;
		try {
			InputStream in = upload.getInputStream();
			OutputStream out = new FileOutputStream(pmagFileURL);		
			FileCopyUtils.copy(in, out);// 完成文件复制
				out.close();
				in.close();
								
			} catch (Exception e) {
				e.printStackTrace();
			}
				pmag.setPmagState("2");
				pmag.setPmagFileName(pmagFileName);
				pmag.setPmagFileType(pmagFileType);
				pmag.setPmagFileURL(pmagFileURL);
				pmagService.insertPmag(pmag);
				ModelAndView model=new ModelAndView("redirect:querylike.do");
				return model;
			}
	/*........................下载.............................*/
	@RequestMapping("download.do")
	public void download(int pmagId,HttpServletResponse response){
		PmagBean pmag=pmagService.pmagXG(pmagId);
		String pmagFileURL=pmag.getPmagFileURL();
		String pmagFileName=pmag.getPmagFileName();
		String pmagFileType=pmag.getPmagFileType();
		response.setContentType(pmagFileType);
		response.addHeader("Content-Disposition", "attchment;fileName="+pmagFileName);
		
		try {
			InputStream in=new FileInputStream(pmagFileURL);
			OutputStream out=response.getOutputStream();
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
	
	
	
	     /*...............修改.......................*/
	@RequestMapping("pmagXG.do")
	public String pmagXG(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagXG(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/update.jsp";
	}
	/*...................明细.............*/
	@RequestMapping("selectAll.do")
	public String selectAll(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagXG(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/view.jsp";
	}	
		/*................复核..............*/
	@RequestMapping("pmagReView.do")
	public String pmagReView(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagXG(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/add.jsp";
	}
	/*................办理......................*/
	@RequestMapping("pmagHandle.do")
	public String pmagHandle(int pmagId,ModelMap map){
		PmagBean pmagBean=pmagService.pmagXG(pmagId);
		map.addAttribute("pmag",pmagBean);
		return "/html/pmag/demo1/edit.jsp";
	}
	
	/*...................................................................................*/
	@RequestMapping("fail.do")//驳回
	public ModelAndView fail(@ModelAttribute PmagBean pmag){
		pmag.setPmagState("4");
		pmagService.updateFail(pmag);
		ModelAndView model=new ModelAndView("redirect:querylike2.do");
		return model;
	}
	@RequestMapping("success.do")//审核通过
	public ModelAndView success(@ModelAttribute PmagBean pmag){
		pmag.setPmagState("3");
		pmagService.updateFail(pmag);
		ModelAndView model=new ModelAndView("redirect:querylike2.do");
		return model;
	}
	
	
	
	
	
	//删除档案状态
	@RequestMapping("pmagbyDt.do")
	public ModelAndView pmagbyDt(int pmagId){
		pmagService.pmagByDt(pmagId);
		ModelAndView model=new ModelAndView("redirect:querylike.do");
		return model;
	}
	//恢复档案状态
	@RequestMapping("pmagbyHf.do")
	public ModelAndView pmagbyHf(int pmagId){
		pmagService.pmagByHf(pmagId);
		ModelAndView model=new ModelAndView("redirect:querylike.do");
		return model;
	}
	//永久删除
	@RequestMapping("delectPmag.do")
	public ModelAndView deletePmag(int pmagId,ModelMap map){
		pmagService.deletePmag(pmagId);
		ModelAndView model=new ModelAndView("redirect:querylike.do");
		return model;
	}
	/*....................有起草到审核状态..................*/
	@RequestMapping("pmagupdate.do")
	public String pmagUpdate(PmagBean pmag){
		pmagService.pmagupdate(pmag);
		return "redirect:querylike.do";
	}
	
}
