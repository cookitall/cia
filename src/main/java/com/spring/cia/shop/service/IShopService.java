package com.spring.cia.shop.service;

import java.util.List;
import java.util.Map;

import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.util.PageVO;

public interface IShopService {

	//가게 목록
	List<ShopVO> getShopList(PageVO vo);
	
	//해당 카테고리 가게의 수
	int getTotal(PageVO vo);
	
	//가게 정보 불러오기
	ShopVO getShopInfo(String shopName);
	
	List<ReviewVO> getReviewReplyList(String shopName);

}
