package com.spring.cia.shop.mapper;

import java.util.List;
import java.util.Map;

import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.util.PageVO;

public interface IShopMapper {
	
	//카테고리명을 가지고 ShopVO(가게 정보)를 가져옴
	List<ShopVO> getShopList(PageVO vo);
	
	//해당 카테고리 가게의 수
	int getTotal(PageVO vo);
	
	ShopVO getShopInfo(String shopName);
	
	List<ReviewVO> getReviewReplyList(String shopName);

}
