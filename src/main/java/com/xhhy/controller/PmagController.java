package com.xhhy.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.sun.net.httpserver.Authenticator.Success;
import com.sun.xml.internal.ws.api.server.Module;
import com.xhhy.domain.PmagBean;
import com.xhhy.service.PmagService;
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

	@RequestMapping("insert.do")//提交审核
	public String insertPmag(@ModelAttribute PmagBean pmag,HttpServletRequest request){
		pmagService.insertPmag(pmag);
		request.setAttribute("pmag",pmag);
		return "/html/pmag/demo1/edit.jsp";
	}
	@RequestMapping("/success.do")//审核通过
	public String success(@ModelAttribute PmagBean pmag,HttpServletRequest request){
		System.out.println(pmag.getPmagCode());
		request.setAttribute("pmag", pmag);
		return"/html/pmag/demo1/view.jsp";
	}
	@RequestMapping("/querylike.do")//模糊查询
	public String queryLike(String pmagName,String pmagState,String pmagVerifyState,Date pmagDate,ModelMap map){
		Map<String,Object> keys=new HashMap<String, Object>();
		keys.put("pmagName", pmagName);
		keys.put("pmagState", pmagState);
		keys.put("pmagVerifyState", pmagVerifyState);
		keys.put("pmagDate", pmagDate);
		List<PmagBean> pmagBean=pmagService.queryLike(keys);
		map.addAllAttributes(pmagBean);
		return "/html/pmag/demo1/list.jsp";
	}
	
}
