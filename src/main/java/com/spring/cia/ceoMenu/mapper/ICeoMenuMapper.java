package com.spring.cia.ceoMenu.mapper;

import java.util.List;
import java.util.Map;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.MenuVO;

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
	//메뉴 만들기 리턴값으로 상태값 확인
	 int insertMenu(Map<String, Object> map);

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
