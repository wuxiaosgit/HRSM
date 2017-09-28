package com.xhhy.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
//		System.out.println(request.getServletPath());
//		System.out.println(request.getMethod());
		Object user = session.getAttribute("user");
		if(user!=null || ("/user/login.do".equals(request.getServletPath()))&& "POST".equals(request.getMethod())){
			return true;
		}else{
			
			request.getRequestDispatcher("/html/login.jsp").forward(request, response);
			return false;
			
		}
	}

	
}
