package com.spring.cia.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cia.command.MenuVO;
import com.spring.cia.command.OrderMenuVO;
import com.spring.cia.command.UserInfoVO;
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
	@GetMapping("/shopInfo")
	public void shopInfo() {
		System.out.println("shopInfo 이동");
	}
	//footer 이동 끝
	
	
	
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
		
		model.addAttribute("shopInfo", service.getShopInfo(shopName));
		model.addAttribute("reviewReplyList", service.getReviewReplyList(shopName));
		model.addAttribute("menuList", service.getMenuList(shopName));
	}
	
	@GetMapping("/order")
	public void order(HttpSession session,String shopName, int originalPrice,
			@RequestParam(value = "menuName")List<String>menuNames,@RequestParam(value = "menuPrice")List<String>menuPrices, 
			@RequestParam(value = "menuNum")List<String>menuNum,
			Model model) {
		
		System.out.println("order 요청");
		System.out.println(menuNum);
		List<MenuVO> menus = new ArrayList<MenuVO>();
		for(int g=0; g<menuNames.size(); g++) {
			MenuVO mvo = new MenuVO();
			mvo.setMenuName(menuNames.get(g));
			mvo.setMenuPrice(Integer.parseInt(menuPrices.get(g)));
			mvo.setMenuNum(Integer.parseInt(menuNum.get(g)));
			menus.add(mvo);
		}
		

		UserInfoVO user = ((UserInfoVO)session.getAttribute("userLogin"));
		model.addAttribute("user",user);
		model.addAttribute("menus", menus);
		model.addAttribute("shopInfo", service.getShopInfo(shopName));
		model.addAttribute("op", originalPrice);
	}	
	@ResponseBody 
	@PostMapping("/couponCheck")
	public int couponChk (@RequestBody String couponCode) {
		System.out.println("쿠폰체크");
		return service.couponChk(couponCode);
	}
	
	@GetMapping("/payment")
	public void payment(Model model,HttpSession session, String shopName, String payway,
						int orderPrice, String orderMsg, String userName, String userAddr1, String userAddr2,
						@RequestParam(value = "menuName")List<String>menuNames,@RequestParam(value = "menuPrice")List<String>menuPrices,
						@RequestParam(value = "menuNum")List<String>menuNum,
						int originalPrice, int deliveryPrice, int couponDiscount) {
		System.out.println("결제 진행");
		List<MenuVO> menus = new ArrayList<MenuVO>();
		for(int g=0; g<menuNames.size(); g++) {
			MenuVO mvo = new MenuVO();
			mvo.setMenuName(menuNames.get(g));
			mvo.setMenuPrice(Integer.parseInt(menuPrices.get(g)));
			mvo.setMenuNum(Integer.parseInt(menuNum.get(g)));
			menus.add(mvo);
		}
	
		UserInfoVO user = ((UserInfoVO)session.getAttribute("userLogin"));
		String msg = service.createOrder(user, shopName, payway, orderPrice, orderMsg, userName, userAddr1, userAddr2, menus, originalPrice, deliveryPrice, couponDiscount);
		UserInfoVO user2 = service.user2(user);
		System.out.println(msg);
		model.addAttribute("msg",msg);
		model.addAttribute("user",user2);
	}
	
	
	
}