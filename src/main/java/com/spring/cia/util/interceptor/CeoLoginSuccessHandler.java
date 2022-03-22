package com.spring.cia.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.cia.command.CeoInfoVO;



public class CeoLoginSuccessHandler implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("로그인 인터셉터 동작!");
		
		
		ModelMap mv = modelAndView.getModelMap();
		CeoInfoVO vo = (CeoInfoVO) mv.get("ceo");
		
		
		if(vo != null) { 
			System.out.println("로그인 성공 로직 동작!");
			
			HttpSession session = request.getSession();
			session.setAttribute("ceoLogin", vo);
	
		} else { 
			System.out.println("로그인 실패 로직 동작!");
			modelAndView.addObject("msg", "loginFail");

		}

	}
	
	
	}

