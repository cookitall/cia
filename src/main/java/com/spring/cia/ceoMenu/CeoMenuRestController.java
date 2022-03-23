package com.spring.cia.ceoMenu;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cia.ceoMenu.service.ICeoMenuService;
import com.spring.cia.command.CouponVO;
import com.spring.cia.command.MenuVO;

@RestController
@RequestMapping("/ceoMenu/couponList")
public class CeoMenuRestController {

	@Autowired
	private ICeoMenuService service;

	/*
	 * couponList
	 */
	// 쿠폰생성 Post
	@PostMapping("/generateCoupon")
	@ResponseBody
	public HashMap<String, String> postGenerateCoupon(@RequestBody CouponVO couponVO, Model model) {
		System.out.println("Check coupon VO" + couponVO);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		// RegDate와 EndDate를 yyyy-MM-dd 형태로 변환
		String tempRegDateToString = simpleDateFormat.format(couponVO.getCouponRegDate());
		String tempEndDateToString = simpleDateFormat.format(couponVO.getCouponEndDate());

		try {
			// 변환된 String 값을 Date로 parsing
			Timestamp tempRegDateToDate = (Timestamp) simpleDateFormat.parse(tempRegDateToString);
			Timestamp tempEndDateToDate = (Timestamp) simpleDateFormat.parse(tempEndDateToString);
			// VO에 적용
			couponVO.setCouponRegDate(tempRegDateToDate);
			couponVO.setCouponEndDate(tempEndDateToDate);
			System.out.println("변경 후 RegDate => " + couponVO.getCouponRegDate());
			System.out.println("변경 후 EndDate => " + couponVO.getCouponEndDate());
		} catch (Exception e) {
			e.printStackTrace();
		}

		HashMap<String, String> result = new HashMap<String, String>();

		// 쿠폰 코드 생성해서 map 에 넣기
		String couponCode = service.generateCoupon(couponVO);
		System.out.println("생성된 쿠폰코드 => " + couponCode);
		result.put("couponCode", couponCode);
		System.out.println("result.toString() =>" + result.toString());

		List<CouponVO> list = null;
		list = service.getList();
		model.addAttribute("couponList", list);

		return result;
	}

	@PostMapping("/deleteLine")
	@ResponseBody
	public void deleteLine(@RequestBody String couponCode, Model model) throws Exception {
		System.out.println(couponCode);
		service.deleteLine(couponCode);

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

	/*
	 * menuList 끝
	 */

	/*
	 * orderList
	 */

	/*
	 * orderList 끝
	 */

	/*
	 * saleHistory
	 */

	/*
	 * saleHistory 끝
	 */

	/*
	 * shopReviewList
	 */

	/*
	 * shopReviewList 끝
	 */

}
