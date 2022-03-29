package com.spring.cia.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userLogin") == null) {
			response.sendRedirect(request.getContextPath() + "/userInfo/login");
			return false; 
		} 
		
		return true; 
	}
}
