package com.spring.cia.ceoMenu.couponList;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.cia.ceoMenu.couponList.service.ICouponListService;
import com.spring.cia.command.CouponVO;

@RestController
@RequestMapping("/ceoMenu/couponList")
public class CouponListRestController {

	@Autowired
	private ICouponListService service;
	
	//쿠폰생성 Post 
	@PostMapping("/generateCoupon")
	@ResponseBody
	public HashMap <String, String> postGenerateCoupon(@RequestBody CouponVO couponVO, Model model) {
		System.out.println("Check coupon VO" + couponVO);
		HashMap<String, String> result = new HashMap <String,String>();
		
		//쿠폰 코드 생성해서 map 에 넣기 w
		String couponCode = service.generateCoupon(couponVO);
		System.out.println("생성된 쿠폰코드 => " + couponCode);
		result.put("couponCode", couponCode);
		System.out.println("result.toString() =>"+result.toString());
		
		List<CouponVO> list = null; 
		list = service.getList();
		model.addAttribute("couponList", list);		 
		
		return result;
	} 
}
