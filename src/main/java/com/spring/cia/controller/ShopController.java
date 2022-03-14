package com.spring.cia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/shop")
public class ShopController {

	//@Autowired
	//private IShopService service
	
	@GetMapping("/terms")
	public void terms() {
		System.out.println("terms 요청");
	}
	@GetMapping("/shopInfo")
	public void shopInfo() {
		System.out.println("shopInfo 요청");
	}
	
	@GetMapping("/categoryList")
	public void category(@RequestParam("category") String category, Model model) {
		System.out.println("cateList 요청");
		//service.getCategoryList(category);
	}
}
