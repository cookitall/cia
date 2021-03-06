package com.spring.cia.ceoMenu.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.MenuVO;
import com.spring.cia.command.OrderVO;
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
	List<CouponVO> getList(String shopName);

	void deleteLine(String couponCode);
	void couponUp(String couponCode, int couponRemain);

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

	List<Map<String, Object>> getByteImageList(String shopName);
	
	
	void menuSold(String menuOpen, String menuNum);
	void menuDelete(String menuNum);
	void menuModi(Map<String, Object> map, String menuNum);
	

	/*
	 * menuList 끝
	 */
	

	/*
	 * orderList
	 */
	List<OrderVO> newOrder(String shopName);
	List<OrderVO> commitOrder(String shopName);
	List<OrderVO> cookOrder(String shopName);
	void orderCommit(int orderNum, String state, int orderTimer);
	void orderUpdate(int orderNum, String state);

	/*
	 * orderList 끝
	 */
	

	/*
	 * saleHistory
	 */
	OrderVO saleHis(String shopName, String daySta, String dayEnd);

	/*
	 * saleHistory 끝
	
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
