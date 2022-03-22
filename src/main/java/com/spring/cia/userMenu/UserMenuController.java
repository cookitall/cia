package com.spring.cia.userMenu;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.userMenu.service.IUserMenuService;
import com.spring.cia.util.PageCreator;
import com.spring.cia.util.PageVO;


@Controller
@RequestMapping("/userMenu")
public class UserMenuController {
	
	@Autowired
	private IUserMenuService service;
	
	
	@GetMapping("/likeList")
	public void likeList(HttpSession session, Model model,PageVO pvo) {
		System.out.println("likeList 요청  GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		List<ShopVO> like = service.likelist(userId, pvo);
		

		PageCreator pc = new PageCreator();
		pc.setPaging(pvo);
		pc.setArticleTotalCount(service.getLikeTotal(userId));
		
		model.addAttribute("pc", pc);
		model.addAttribute("like", like);
	}
	
	@GetMapping("/orderHistory")
	public void orderHistory(HttpSession session, Model model, PageVO pvo) {
		System.out.println("orHis 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		System.out.println(userId);
		List<OrderVO> ohList = service.orderHistory(userId, pvo);
		PageCreator pc = new PageCreator();
		pc.setPaging(pvo);
		pc.setArticleTotalCount(service.getOrHiTotal(userId));
		
		model.addAttribute("pc", pc);
		model.addAttribute("ohList", ohList);
	}
	
	@GetMapping("/userPoint")
	public void userPoint(HttpSession session, Model model) {
		System.out.println("userPoint 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		model.addAttribute("point", service.pointView(userId));
	}
	@GetMapping("/pointDel")
	public String pointDel(int pointDel, HttpSession session) {
		System.out.println("pointDel 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		int userPoint = service.pointView(userId).getUserPoint();
		userPoint = userPoint - pointDel;
		System.out.println(userPoint);
		service.pointModi(userId, userPoint );
		return "redirect:/userMenu/userPoint";
	} 
	@GetMapping("/pointPay")
	public String pointPay(int pointPay, HttpSession session) {
		System.out.println("pointPay 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		int userPoint = service.pointView(userId).getUserPoint();
		userPoint  = userPoint + pointPay;
		service.pointModi(userId, userPoint);
		return "redirect:/userMenu/userPoint";
	}
	
	
	@GetMapping("reviewList")
	public void reivewList(HttpSession session, Model model, PageVO pvo) {
		System.out.println("reviewList 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		List<ReviewVO> reviews = service.reivewList(userId, pvo);
		List<ReplyVO> replys = new ArrayList<ReplyVO>();
		for(ReviewVO vo : reviews) {
			ReplyVO rvo = service.replyContent(vo.getReviewNum());
			replys.add(rvo);
		}
		
		PageCreator pc = new PageCreator();
		pc.setPaging(pvo);
		pc.setArticleTotalCount(service.getReviewTotal(userId));
		
		model.addAttribute("pc", pc);
		model.addAttribute("reviews", reviews);
		model.addAttribute("replys", replys);
	}
	@GetMapping("/reviewDel")
	public String reviewDel(int reviewNum) {
		System.out.println("reviewDel 요총 GET");
		service.reviewDel(reviewNum);
		return "redirect:/userMenu/reviewList";
	}
}
