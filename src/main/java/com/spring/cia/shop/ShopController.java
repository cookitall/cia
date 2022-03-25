package com.spring.cia.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cia.shop.service.IShopService;
import com.spring.cia.util.PageCreator;
import com.spring.cia.util.PageVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private IShopService service;
	
	//footer 메뉴 이동
	@GetMapping("/terms")
	public void terms() {
		System.out.println("terms(fotter) 페이지 이동");
	}
	
	//가게 목록 화면
	@GetMapping("/categoryList")
	public void categoryList(PageVO vo, Model model) {
		System.out.println("categoryList?category=" + vo.getCategory() + " 페이지 이동 controller 실행");
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		
		model.addAttribute("pc", pc);
		model.addAttribute("shopList", service.getShopList(vo));
	}
	
	@GetMapping("/storeContent")
	public void storeContent(String shopName, Model model) {
		System.out.println("storeContent?shopName=" + shopName + " 페이지 이동");
		System.out.println(service.getShopInfo(shopName).toString());
		model.addAttribute("shopInfo", service.getShopInfo(shopName));
		model.addAttribute("reviewReplyList", service.getReviewReplyList(shopName));
	}
	
	
	
}