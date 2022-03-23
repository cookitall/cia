package com.spring.cia.ceoMenu;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
//	@GetMapping("/menuList")
//	public ModelAndView getMenuList() {
//		List<String> paramList = new ArrayList<String>();
//		ModelAndView model = new ModelAndView("views/view2");
//
////		List<Map<String, Object>> list = dao.getByteImageList();
//		model.addObject("list", list);
//
//		Iterator<Map<String, Object>> itr = list.iterator();
//
//		while (itr.hasNext()) {
//
//			Map<String, Object> element = (Map<String, Object>) itr.next();
//			byte[] encoded = org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img"));
//			String encodedString = new String(encoded);
//			paramList.add(encodedString);
//			model.addObject("image", paramList);
//
//		}
//		return model;
//
//	}
	
	/**
	 * 임의의 뷰페이지
	 * @return
	 */
	@RequestMapping(value="/test")
	public void test() {
	}
	     
	/**
	 * 이미지태그의 src 컨트롤러
	 * @return
	 * @throws SQLException 
	 */
	@RequestMapping(value="/getByteImage")
	public ResponseEntity<byte[]> getByteImage() throws SQLException {
	   Map<String, Object> map = service.getByteImage();
	   System.out.println(map);
	   System.out.println(map.get("MENUIMAGE").getClass().getName());
	   Blob temp = (Blob) map.get("MENUIMAGE");
	   
	   byte[] imageContent = temp.getBytes(1, (int) temp.length());

	   System.out.println(imageContent);    
       return new ResponseEntity<byte[]>(imageContent, HttpStatus.OK);
	}
	
	//메뉴 등록 작업
	@PostMapping("/menuList/menuSubmit")
	public String postMenuSubmit(MultipartHttpServletRequest req) throws IOException {
		String menuName = req.getParameter("menuName");
		Integer menuPrice = Integer.parseInt(req.getParameter("menuPrice"));
		MultipartFile menuImage = req.getFile("menuImage");
		String menuInfo = req.getParameter("menuInfo");

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("menuName", menuName);
			map.put("menuPrice", menuPrice);
			map.put("menuInfo", menuInfo);
			map.put("menuOpen", "open");
			map.put("shopName", "쿡잇올");
			map.put("menuImage", menuImage.getBytes());
			service.insertMenu(map);

		} catch (Exception e) {
			e.printStackTrace();

		}
		// int 성공여부 check

		return "ceoMenu/menuList";
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
