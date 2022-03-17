package com.spring.cia.ceoMenu.saleHistory;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cia.ceoMenu.saleHistory.service.ISaleHistoryService;

//컨트롤러 라고 함
@Controller
//localhost:8080 시작하고나서 /ceoMenu <==
@RequestMapping("/ceoMenu")
public class SaleHistoryController {
	
	@Autowired
	private ISaleHistoryService service;
	
	//로그인 이동 요청
	@GetMapping("/saleHistory") 
	public void getSaleHistory() {
		System.out.println("saleHistory 요청 GET");
	}

	@PostMapping("/test")
	private void test(HttpServletRequest request, Model model) {
		String a = request.getParameter("dayHistorySta");
		String b = request.getParameter("dayHistoryEnd");

		model.addAttribute("dayHistorySta", a);
		model.addAttribute("dayHistoryEnd", b);
	}
	
	/*
	 * 1. POST 통신을 할 수 있음
	 * 	어떻게? form 에 action으로 url을 설정
	 * 			method에 POST 통신으로 설정\
	 * 			컨트롤러에서 request.getParameter를 이용해서 받아와서 변수에 담고
	 *			model.addAttr "키", 벨류 <=== jsp에 키로 값을 찾을 수 있게끔 할 수 있음 			
	 */
	
}
