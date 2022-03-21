package com.spring.cia.ceoMenu;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cia.ceoMenu.service.ICeoMenuService;
import com.spring.cia.command.CouponVO;

@Controller
@RequestMapping("/ceoMenu/*")
public class CeoMenuController {
	
	@Autowired
	private ICeoMenuService service;
	
	/*
	 * couponList
	 */
	@GetMapping("/couponList") 
	public void getCouponList(Model model) {
		System.out.println("쿠폰관리 Get 요청");
		
		List<CouponVO> list = null; 
		list = service.getList();
		model.addAttribute("couponList", list);
	}
	
	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	@GetMapping("/menuList") 
	public void getMenuList() {
		System.out.println("메뉴관리 Get 요청");
	}
	

	/*
	 * menuList 끝
	 */
	

	/*
	 * orderList
	 */
	@GetMapping("/orderList") 
	public void getOrderList() {
		System.out.println("주문관리 Get 요청");
	}

	/*
	 * orderList 끝
	 */
	

	/*
	 * saleHistory
	 */
	@GetMapping("/saleHistory") 
	public void getSaleHistory() {
		System.out.println("매출내역 Get 요청");
	}
	
	/*
	 * saleHistory 끝
	 */
	
	/*
	 * shopReviewList
	 */
	@GetMapping("/shopReviewList") 
	public void getShopReviewList() {
		System.out.println("리뷰관리 Get 요청");
	}
	
	/*
	 * shopReviewList 끝
	 */
	

}
