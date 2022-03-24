package com.spring.cia.ceoMenu.service;

import java.util.List;
import java.util.Map;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.MenuVO;

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
	//메뉴 등록
	int insertMenu(Map<String, Object> map);
	//테스트 1개 BLOB의 이미지 출력
	Map<String, Object> getByteImage();

	List<Map<String, Object>> getByteImageList();
	

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
