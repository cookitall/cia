package com.spring.cia.userMenu.service;

import java.util.List;

import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.util.PageVO;


public interface IUserMenuService {

	// likelist
	List<ShopVO> likelist(String userId,PageVO pvo);
	//페이징
	int getLikeTotal(String userId);
	
	// orderhistory
	List<OrderVO> orderHistory(String userId,PageVO pvo);
	//페이징
	int getOrHiTotal(String userId);
	
	//pointView
	UserInfoVO pointView(String userId);
	
	//pointpay	
	void pointModi(String userId, int userPoint);

	
	// reviewList
	List<ReviewVO> reivewList(String userId, PageVO pvo);
	ReplyVO replyContent(int reviewNum);
	void reviewDel(int reviewNum);
	//페이징
	int getReviewTotal(String userId);
}
