package com.spring.cia.ceoMenu;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cia.ceoMenu.service.ICeoMenuService;
import com.spring.cia.command.CeoInfoVO;
import com.spring.cia.command.CouponVO;
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
