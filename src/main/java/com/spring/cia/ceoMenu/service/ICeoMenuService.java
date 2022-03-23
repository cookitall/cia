package com.spring.cia.ceoMenu.service;

import java.util.List;
import java.util.Map;

import com.spring.cia.command.CouponVO;

public interface ICeoMenuService {

	/*
	 * couponList
	 */
	
	// 쿠폰 생성
	String generateCoupon(CouponVO couponVO);

	// 쿠폰 리스트
	List<CouponVO> getList();

	void deleteLine(String couponCode);

	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	
	int insertMenu(Map<String, Object> map);

	Map<String, Object> getByteImage();
	

	/*
	 * menuList 끝
	 */
	

	/*
	 * orderList
	 */
	

	/*
	 * orderList 끝
	 */
	

	/*
	 * saleHistory
	 */
	
	/*
	 * saleHistory 끝
	 */
	
	/*
	 * shopReviewList
	 */
	
	/*
	 * shopReviewList 끝
	 */
}
