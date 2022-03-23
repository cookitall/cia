package com.spring.cia.shop.service;

import java.util.List;

import com.spring.cia.command.ShopVO;
import com.spring.cia.util.PageVO;

public interface IShopService {

	//가게 목록
	List<ShopVO> getShopList(PageVO vo);
	
	//해당 카테고리 가게의 수
	public int getTotal(PageVO vo);
	
	//가게 정보 불러오기
	public ShopVO getShopInfo(String shopName);

}
