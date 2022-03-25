package com.spring.cia.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.shop.mapper.IShopMapper;
import com.spring.cia.util.PageVO;

@Service
public class ShopService implements IShopService {

	@Autowired
	private IShopMapper mapper;

	@Override
	public List<ShopVO> getShopList(PageVO vo) {
		return mapper.getShopList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	@Override
	public ShopVO getShopInfo(String shopName) {
		return mapper.getShopInfo(shopName);
	}
	
	@Override
	public List<ReviewVO> getReviewReplyList(String shopName) {
		return mapper.getReviewReplyList(shopName);
	}


}
