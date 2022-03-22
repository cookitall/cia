package com.spring.cia.ceoMenu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.util.PageVO;

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
	List<ReviewVO> reivewList(String shopName, PageVO pvo);
	ReplyVO replyContent(int reviewNum);
	int getReviewTotal(String shopName);
	
	void replyWrite(int writeReviewNum, String writeShopName, String writeReplyContent);
	void replyDelete(int replyNum, int reviewNum);
	void replyModify(int replyNum, String replyContent);
	/*
	 * shopReviewList 끝
	 */
}
