package com.spring.cia.ceoMenu;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.spring.cia.command.CeoInfoVO;
import com.spring.cia.command.CouponVO;
import com.spring.cia.command.MenuVO;
import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.util.PageCreator;
import com.spring.cia.util.PageVO;

@Controller
@RequestMapping("/ceoMenu/*")
public class CeoMenuController {

	@Autowired
	private ICeoMenuService service;

	/*
	 * couponList
	 */
	@GetMapping("/couponList")
	public void getCouponList(Model model, HttpSession session) {
		System.out.println("쿠폰관리 Get 요청");
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();

		List<CouponVO> list = null;
		list = service.getList(shopName);
		model.addAttribute("couponList", list);
	}
	
	@GetMapping("/couponUP")
	public String couponUP(String couponCode, int couponRemain) {
		System.out.println("쿠폰수량 변경요청");
		service.couponUp(couponCode, couponRemain);
		return "redirect:/ceoMenu/couponList";
	}
	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	@GetMapping("/menuList")
	public ModelAndView getMenuList(HttpSession session) throws SQLException {
		System.out.println("메뉴리스트요청");
		//Blob 이미지의 encoded 문자열 담을 전용 List
		List<Map<String,Object>> paramList = new ArrayList<Map<String,Object>>();
		ModelAndView model = new ModelAndView("ceoMenu/menuList");
		
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();

		
		List<Map<String, Object>> list = service.getByteImageList(shopName);
		model.addObject("list", list);

		Iterator<Map<String, Object>> itr = list.iterator();

		while (itr.hasNext()) {
			
			Map<String, Object> element = (Map<String, Object>) itr.next();
			
			String menuNum = String.valueOf(element.get("MENUNUM"));
			String menuName = (String) element.get("MENUNAME");
			String menuPrice = String.valueOf(element.get("MENUPRICE"));
			String menuInfo = (String) element.get("MENUINFO");
			String menuOpen = (String) element.get("MENUOPEN");

			
			
			Blob tempImage = (Blob) element.get("MENUIMAGE");
			Map<String, Object> tempMap = new HashMap<String, Object>();
			if(tempImage != null) {
				byte[] encoded = org.apache.commons.codec.binary.Base64.encodeBase64(tempImage.getBytes(1, (int) tempImage.length()));
				String encodedString = new String(encoded);
				tempMap.put("encodedString", encodedString);
				
			}
			tempMap.put("menuName", menuName);
			tempMap.put("menuPrice", menuPrice);
			tempMap.put("menuInfo", menuInfo);
			tempMap.put("menuNum", menuNum);
			tempMap.put("menuOpen", menuOpen);
			paramList.add(tempMap);
			model.addObject("result", paramList);
		
		}
		return model;

	}

	/**
	 * 임의의 뷰페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/test")
	public void test() {
	}

	/**
	 * 이미지태그의 src 컨트롤러
	 * 
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/getByteImage")
	public ResponseEntity<byte[]> getByteImage() throws SQLException {
		Map<String, Object> map = service.getByteImage();
		System.out.println(map);
		System.out.println(map.get("MENUIMAGE").getClass().getName());
		Blob temp = (Blob) map.get("MENUIMAGE");

		byte[] imageContent = temp.getBytes(1, (int) temp.length());

		System.out.println(imageContent);
		return new ResponseEntity<byte[]>(imageContent, HttpStatus.OK);
	}

	// 메뉴 등록 작업
	@PostMapping("/menuList/menuSubmit")
	public String postMenuSubmit(MultipartHttpServletRequest req, HttpSession session) throws IOException {
		String menuName = req.getParameter("menuName");
		Integer menuPrice = Integer.parseInt(req.getParameter("menuPrice"));
		MultipartFile menuImage = req.getFile("menuImage");
		String menuInfo = req.getParameter("menuInfo");
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();


		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("menuName", menuName);
			map.put("menuPrice", menuPrice);
			map.put("menuInfo", menuInfo);
			map.put("menuOpen", "open");
			map.put("shopName", shopName);
			map.put("menuImage", menuImage.getBytes());
			service.insertMenu(map);

		} catch (Exception e) {
			e.printStackTrace();

		}
		// int 성공여부 check

		return "redirect:/ceoMenu/menuList";
	}
	
	//메뉴 숨김 오픈 설정
	@GetMapping("/menuSold")
	public String menuSold (String menuOpen, String menuNum) {
		System.out.println("메뉴 숨김 설정 요청");
		service.menuSold(menuOpen, menuNum);		
		return "redirect:/ceoMenu/menuList";		
	}
	//메뉴삭제
	@GetMapping("/menuDelete")
	public String menuDelete(String menuNum) {
		System.out.println("메뉴 삭제요청");
		service.menuDelete(menuNum);
		return "redirect:/ceoMenu/menuList";		

	}
	//메뉴 수정
	@PostMapping("/menuModi")
	public String menuModi(MultipartHttpServletRequest req, String menuNum) throws IOException{
		String menuName = req.getParameter("menuName");
		Integer menuPrice = Integer.parseInt(req.getParameter("menuPrice"));
		MultipartFile menuImage = req.getFile("menuImage");
		String menuInfo = req.getParameter("menuInfo");

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("menuName", menuName);
			map.put("menuPrice", menuPrice);
			map.put("menuInfo", menuInfo);
			map.put("menuImage", menuImage.getBytes());
			service.menuModi(map, menuNum);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return "redirect:/ceoMenu/menuList";		
	}

	/*
	 * menuList 끝
	 */

	/*
	 * orderList
	 */
	@GetMapping("/orderList")
	public void getOrderList(HttpSession session, Model model) {
		System.out.println("주문관리 Get 요청");
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();
		List<OrderVO> newList = service.newOrder(shopName);	
		List<OrderVO> commitList = service.commitOrder(shopName);
		List<OrderVO> cookList = service.cookOrder(shopName);
		if(newList != null && commitList != null && cookList !=null) {
			model.addAttribute("newList", newList);
			model.addAttribute("commitList", commitList);
			model.addAttribute("cookList", cookList);
		}

	}
	@GetMapping("/orderCommit")
	public String orderCommit(int orderNum, String state, int orderTimer) {
		System.out.println("orderCommit GET");
		service.orderCommit(orderNum, state, orderTimer);
		return "redirect:/ceoMenu/orderList";
	}
	@GetMapping("/orderUpdate") 
	public String orderUpdate(int orderNum, String state) {
		System.out.println("orderUpdate GET");
		service.orderUpdate(orderNum, state);
		return "redirect:/ceoMenu/orderList";
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

	@PostMapping("/saleHistory")
	public void monthHistory(Model model, HttpSession session, String daySta, String dayEnd) {
		System.out.println("saleHistory POST 요청");
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();
		OrderVO order = service.saleHis(shopName, daySta, dayEnd);

		model.addAttribute("order", order);
		model.addAttribute("daySta", daySta);
		model.addAttribute("dayEnd", dayEnd);
	}

	/*
	 * saleHistory 끝
	 */
	
	/*
	 * shopReviewList
	 */
	@GetMapping("/shopReviewList") 
	public void getShopReviewList(HttpSession session, PageVO pvo, Model model) {
		System.out.println("리뷰관리 Get 요청");
		String shopName = ((CeoInfoVO)session.getAttribute("ceoLogin")).getShopName();
		List<ReviewVO> reviews = service.reivewList(shopName, pvo);
		List<ReplyVO> replys = new ArrayList<ReplyVO>();
		for(ReviewVO vo : reviews) {
			ReplyVO rvo = service.replyContent(vo.getReviewNum());
			replys.add(rvo);
		}
		PageCreator pc = new PageCreator();
		pc.setPaging(pvo);
		pc.setArticleTotalCount(service.getReviewTotal(shopName));

		model.addAttribute("pc", pc);
		model.addAttribute("reviews", reviews);
		model.addAttribute("replys", replys);
	}

	@GetMapping("/replyWrite")
	public String replyWrite(int writeReviewNum, String writeShopName, String writeReplyContent) {
		System.out.println("reviewWrite GET");
		service.replyWrite(writeReviewNum, writeShopName, writeReplyContent);	
		return "redirect:/ceoMenu/shopReviewList";
	}
	@GetMapping("/replyDelete")
	public String replyDelete(int replyNum, int reviewNum) {
		System.out.println("reviewDelete GET");
		service.replyDelete(replyNum, reviewNum);
		return "redirect:/ceoMenu/shopReviewList";
	}
	@GetMapping("/replyModify")
	public String replyModify(int replyNum, String replyContent) {
		System.out.println("replyModi GET");
		service.replyModify(replyNum, replyContent);
		return "redirect:/ceoMenu/shopReviewList";
	}

	/*
	 * shopReviewList 끝
	 */

}
