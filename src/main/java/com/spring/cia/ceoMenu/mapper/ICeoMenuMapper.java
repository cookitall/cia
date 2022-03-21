package com.spring.cia.ceoMenu.mapper;

import java.util.List;

import com.spring.cia.command.CouponVO;

public interface ICeoMenuMapper {

	/*
	 * couponList
	 */
	//쿠폰 만들기
	void generateCoupon(CouponVO couponVO);

	List<CouponVO> getList();

	void deleteLine(String couponCode);

	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	

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
