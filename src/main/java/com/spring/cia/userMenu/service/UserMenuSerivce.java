package com.spring.cia.userMenu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.command.UserlikeVO;
import com.spring.cia.userMenu.mapper.IUserMenuMapper;
import com.spring.cia.util.PageVO;

@Service
public class UserMenuSerivce implements IUserMenuService {

	@Autowired
	private IUserMenuMapper mapper;
	
	@Override
	public List<ShopVO> likelist(String userId, PageVO pvo) {
         List<UserlikeVO>  list = mapper.likelist(userId,pvo);
         List<ShopVO> like = new ArrayList<ShopVO>();
         for (UserlikeVO uvo : list) {
        	 like.add(mapper.shopInfoGet(uvo.getShopName()));
         }
         return like;
	}
	@Override
	public int getLikeTotal(String userId) {
		return mapper.getLikeTotal(userId);
	}

	@Override
	public List<OrderVO> orderHistory(String userId, PageVO pvo) {
		return mapper.orderHistory(userId,pvo);
	}
	@Override
	public int getOrHiTotal(String userId) {
		return mapper.getOrHiTotal(userId);
	}
	

	@Override
	public UserInfoVO pointView(String userId) {
		return mapper.pointView(userId);
	}

	@Override
	public void pointModi(String userId, int userPoint) {
		mapper.pointModi(userId, userPoint);
	}


	@Override
	public List<ReviewVO> reivewList(String userId, PageVO pvo) {
		return mapper.reivewList(userId, pvo);
	}
	@Override
	public int getReviewTotal(String userId) {
		return mapper.getReviewTotal(userId);
	}

	@Override
	public ReplyVO replyContent(int reviewNum) {
		return mapper.replyContent(reviewNum);
	}

}
