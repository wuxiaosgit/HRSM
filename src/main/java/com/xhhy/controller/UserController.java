package com.xhhy.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jndi.url.dns.dnsURLContext;
import com.xhhy.domain.DeptBean;
import com.xhhy.domain.MenuBean;
import com.xhhy.domain.UserBean;
import com.xhhy.service.DeptService;
import com.xhhy.service.MenuService;
import com.xhhy.service.RoleService;
import com.xhhy.service.UserService;

@Controller
@RequestMapping("user")
@SessionAttributes(value={"user","menus"}, types={UserBean.class,MenuBean.class})
//@SessionAttributes("menus")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("ajaxOldPaddword.do")
	@ResponseBody
	public String ajaxOldPaddword(UserBean userBean){
		UserBean oldPasswrod = userService.oldPasswrod(userBean);
		if (oldPasswrod==null) {
			return "no";
		}else{
			return "ok";
		}
	}
	@RequestMapping("ajaxLogin.do")
	@ResponseBody
	public String ajaxLogin(String ajaxLogin){
		List<UserBean> userBeans = userService.ajaxLogin(ajaxLogin);
		if (userBeans==null ||userBeans.size()==0) {
			return "no";
		}else{
			return "yes";
		}
	}
	@RequestMapping("insertUser.do")
	public ModelAndView insertUser(UserBean userBean){
		if (userBean.getUserId()==null) {
			
			userBean.setUserState(1);
			userService.insertUser(userBean);
		}else{
			userService.updateUser(userBean);
		}
		return selectUser(null);
	}
	/*@RequestMapping("updateUser.do")
	public ModelAndView updateUser(UserBean userBean){
		return selectUser(null);
	}*/
	@RequestMapping("gerenUser.do")
	public ModelAndView gerenUser(HttpServletRequest re,UserBean userBean,@RequestParam("file")MultipartFile mf){
//		System.out.println(userBean);
		String savePath="F:/webb/YXSS/src/main/webapp/html/protrait/"+mf.getOriginalFilename();
//		System.out.println(savePath);
		try {
			InputStream in= mf.getInputStream();
			OutputStream out=new FileOutputStream(savePath);
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		userBean.setUserPicture(savePath);
		userService.updateUser(userBean);
		
		ServletContext servletContext = re.getSession().getServletContext();
		servletContext.setAttribute("user",userBean);
		return new ModelAndView("../html/msg.jsp");
	}
	@RequestMapping("deleteUser.do")
	public ModelAndView deleteUser(Integer userId){
		userService.deleteUser(userId);
		return selectUser(null);
	}
	@RequestMapping("deleteUserAll.do")
	public ModelAndView deleteUserAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			userService.deleteUser(ids[i]);
		}
		return selectUser(null);
	}
	@RequestMapping("noDeleteUser.do")
	public ModelAndView noDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(0);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("yesDeleteUser.do")
	public ModelAndView yesDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(1);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	
	@RequestMapping("selectUser.do")
	public ModelAndView selectUser(UserBean userBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/list.jsp");
		if (userBean==null) {
			userBean=new UserBean();
		}
		if (userBean.getDeptId()!=null&&userBean.getDeptId()==-1) {
			userBean.setDeptId(null);
		}
		if (userBean.getRoleId()!=null&&userBean.getRoleId()==-1) {
			userBean.setRoleId(null);
		}
		List<UserBean> userBeans=userService.listUser(userBean);
		Integer max=userService.max(userBean);
		/*System.out.println(max);
		for (UserBean userBean2 : userBeans) {
			System.out.println(userBean2);
		}*/
		mav.addObject("userBeans",userBeans);
		mav.addObject("deptBeans",deptService.listDept());
		
		mav.addObject("deptId",userBean.getDeptId());
		mav.addObject("userName",userBean.getUserName());
		mav.addObject("role",roleService.getRoleById(userBean.getRoleId()));
			
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", userBean.getCurrentNum());
		return mav;
	}
	@RequestMapping("getUserById.do")
	public ModelAndView getUserById(Integer userId){
		ModelAndView mav=new ModelAndView("../html/resource/demo2/view.jsp");
		mav.addObject("user",userService.getUserById(userId));
		return mav;
		
	}
	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest re,HttpServletResponse response,UserBean userBean,Integer cookie){
		//ServletContext servletContext = re.getSession().getServletContext();
		
		ModelAndView mav=new ModelAndView("../html/index.jsp");
		UserBean user=userService.login(userBean);
	
		if (user==null) {
			
			return out(re);
		}else{
			mav.addObject("user",user);
			//servletContext.setAttribute("user",user);
			
			List<MenuBean> menus=menuService.getMenu(user.getRoleId());
			/*for (MenuBean menuBean : menus) {
				System.out.println();
				System.out.println(menuBean);
				for (MenuBean m : menuBean.getMenuList()) {
					System.out.println(m);
				}
				System.out.println();
			}*/
			mav.addObject("menus",menus);
			Cookie cookie1=new Cookie("userLogin", userBean.getUserLogin());
			cookie1.setMaxAge(60*60*24*cookie);
			cookie1.setPath("/");
			Cookie cookie2=new Cookie("userPassword", userBean.getUserPassword());
			cookie2.setMaxAge(60*60*24*cookie);
			cookie2.setPath("/");
			Cookie cookie3=new Cookie("maxDay",cookie.toString());
			cookie3.setMaxAge(60*60*24*cookie);
			cookie3.setPath("/");
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			response.addCookie(cookie3);
		}
		
		return mav;
	}
	@RequestMapping("out.do")
	public ModelAndView out(HttpServletRequest re){
		ModelAndView mav=new ModelAndView("../html/login.jsp");
		 HttpSession session = re.getSession();
		 session.removeAttribute("user");
		return mav;
	}
	@RequestMapping("updatePassword.do")
	public void updatePassword(HttpServletResponse response,HttpServletRequest re,UserBean userBean)
	{
		userService.updateUser(userBean);
		ModelAndView mav=new ModelAndView("../html/login.jsp");
		HttpSession session = re.getSession();
		session.removeAttribute("user");
		
		Cookie cookie2=new Cookie("userPassword", userBean.getUserPassword());
		cookie2.setMaxAge(0);
		cookie2.setPath("/");
		Cookie cookie3=new Cookie("maxDay","0");
		cookie3.setMaxAge(0);
		cookie3.setPath("/");

		response.addCookie(cookie2);
		response.addCookie(cookie3);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script type='text/javascript'>window.top.location='../html/login.jsp'</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
	/*@RequestMapping("excl.do")
	public void excel(String ids, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
	
		// 创建excel表头部分
		String[] excelHeader = { "门诊编号", "患者姓名", "主治医生", "挂号时间", "挂号科室", "状态",
				"年龄", "备注" };
		// 创建集合（从数据库中查询出来）

		List<Hosregister> list = new ArrayList<Hosregister>();
		Hosregister hosregister = null;

		String[] idss = ids.split(",");
		for (String string : idss) {
		
			hosregister =hosregisterService.selectByPrimaryKey(Integer
					.valueOf(string));
			list.add(hosregister);
		}
		System.out.println(list.size());
		// 创建Excel对象
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建sheet
		HSSFSheet sheet = wb.createSheet("学生信息");
		// sheet.createFreezePane(1, 3); 冻结
		// 设置列宽
		sheet.setColumnWidth(0, 3500);
		sheet.setColumnWidth(1, 3500);
		sheet.setColumnWidth(2, 3500);
		sheet.setColumnWidth(3, 5000);
		sheet.setColumnWidth(4, 3500);
		sheet.setColumnWidth(5, 3500);
		sheet.setColumnWidth(6, 3500);
		sheet.setColumnWidth(7, 3500);
		sheet.setColumnWidth(8, 3500);

		

		// 创建行（第一行表头）
		HSSFRow row = sheet.createRow((int) 0);
		// 创建样式
		HSSFCellStyle style = wb.createCellStyle();
		// 居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		HSSFFont headfont = wb.createFont();
		headfont.setFontName("黑体");
		headfont.setFontHeightInPoints((short) 15);// 字体大小
		headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		style.setFont(headfont);

		// 设置第一行表头信息
		for (int i = 0; i < excelHeader.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(excelHeader[i]);
			cell.setCellStyle(style);
			// 自动修改列
			// sheet.autoSizeColumn(i);
		}

		// 设置其余行的列的值
		// 创建样式
		HSSFCellStyle styleOrder = wb.createCellStyle();
		// 居中
		styleOrder.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			hosregister = list.get(i);
			// 每一行放值
			HSSFCell cell1 = row.createCell(0);
			cell1.setCellValue(hosregister.getHosrid());
			cell1.setCellStyle(styleOrder);
			HSSFCell cell2 = row.createCell(1);
			if(hosregister.getHosrage()==null){
				cell2.setCellValue("未录入");
			}else{
			cell2.setCellValue(hosregister.getHosrname());
			}
			cell2.setCellStyle(styleOrder);
			HSSFCell cell3 = row.createCell(2);
			
			cell3.setCellValue(hosregister.getDoctor().getDname());
			cell3.setCellStyle(styleOrder);
			HSSFCell cell4 = row.createCell(3);
			Tools tools=new Tools();
			try {
				cell4.setCellValue(tools.DateToString(hosregister.getHosrdate(),null));
			} catch (Exception e) {
				// TODO: handle exception
			}
			cell4.setCellStyle(styleOrder);
			HSSFCell cell5 = row.createCell(4);
			cell5.setCellValue(keshiService.selectByPrimaryKey(hosregister.getDoctor().getDkeshiid()).getKeshiname());
			cell5.setCellStyle(styleOrder);
			
			String str = "";
			if (hosregister.getHosrstate() == 1) {
				str = "已退号";
			} else if (hosregister.getHosrstate() == 0) {
				str = "已挂号";
			} 
			HSSFCell cell6 = row.createCell(5);
			cell6.setCellValue(str);
			cell6.setCellStyle(styleOrder);
			HSSFCell cell7 = row.createCell(6);
			if(hosregister.getHosrage()==null){
				cell7.setCellValue("未录入");
			}else{
				cell7.setCellValue(hosregister.getHosrage());
			}
			cell7.setCellStyle(styleOrder);
			
			HSSFCell cell8 = row.createCell(7);
			if(hosregister.getHosrremake()==null||"".equals(hosregister.getHosrremake())){
				cell8.setCellValue("未录入");
			}else{
			cell8.setCellValue(hosregister.getHosrremake());
			}
			cell8.setCellStyle(styleOrder);
		}

		// 设置下载时客户端Excel的名称
		String filename = "挂号记录.xls";
		try {
			filename = URLEncoder.encode(filename, "utf-8");

			// 设置响应信息类型
			response.setContentType("application/vnd.ms-excel");
			// 是指
			// 设置响应的头信息
			response.setHeader("Content-disposition", "attachment;filename="
					+ filename);
			// 通过输出流将文件输出到客户端
			OutputStream ouputStream = response.getOutputStream();
			wb.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
