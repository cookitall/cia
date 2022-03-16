package com.spring.cia.ceoMenu.couponList;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cia.ceoMenu.couponList.service.ICouponListService;
import com.spring.cia.command.CouponVO;

@Controller
@RequestMapping("/ceoMenu/*")
public class CouponListController {
	
	@Autowired
	private ICouponListService service;
	
	// 쿠폰관리 Get 요청
	@GetMapping("/couponList") 
	public void getCouponList() {
		System.out.println("쿠폰관리 Get 요청");
	}
	
	//쿠폰생성 테스트 POST
	@PostMapping("/test2")
	public void test(HttpServletRequest request, Model model) {
		System.out.println("test2로 Post 요청");
		
		String couponName = request.getParameter("couponName");
		String couponRegDate = request.getParameter("couponRegDate");
		String couponEndDate = request.getParameter("couponEndDate");
		String couponTermPrice = request.getParameter("couponTermPrice");
		String couponDiscount = request.getParameter("couponDiscount");
		String couponRemain = request.getParameter("couponRemain");
		
		System.out.println("쿠폰 이름: " + couponName);
		System.out.println("쿠폰 사용기한 : " + couponRegDate + "~" + couponEndDate);
		System.out.println("쿠폰 최소금액: " + couponTermPrice);
		System.out.println("쿠폰 할인금액: " + couponDiscount);
		System.out.println("쿠폰 수량: " + couponRemain);
		
		model.addAttribute("cName", couponName);
		model.addAttribute("cRDate", couponRegDate);
		model.addAttribute("cEDate", couponEndDate);
		model.addAttribute("cTPrice", couponTermPrice);
		model.addAttribute("cDiscount", couponDiscount);
		model.addAttribute("cRemain", couponRemain);
	}
	

}
