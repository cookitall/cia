package com.spring.cia.ceoMenu.couponList.service;

import java.util.List;

import com.spring.cia.command.CouponVO;

public interface ICouponListService {

	String generateCoupon(CouponVO couponVO);

	List<CouponVO> getList();

}
