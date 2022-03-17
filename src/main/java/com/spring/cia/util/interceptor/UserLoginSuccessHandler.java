package com.spring.cia.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.cia.command.UserInfoVO;



public class UserLoginSuccessHandler implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("User로그인 인터셉터 동작!");
		
		
		ModelMap mv = modelAndView.getModelMap();
		UserInfoVO vo = (UserInfoVO) mv.get("user");
		System.out.println("interceptor vo: " + vo);
		
		if(vo != null) { 
			System.out.println("User로그인 성공 로직 동작!");
			
			HttpSession session = request.getSession();
			session.setAttribute("userLogin", vo);
	
		} else { 
			System.out.println("User로그인 실패 로직 동작!");
			modelAndView.addObject("msg", "loginFail");

		}

	}
	
	
	}

