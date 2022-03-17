package com.spring.cia.ceoMenu.couponList.mapper;

import java.util.List;

import com.spring.cia.command.CouponVO;

public interface ICouponListMapper {

	//쿠폰 만들기
	void generateCoupon(CouponVO couponVO);

	List<CouponVO> getList();

}
