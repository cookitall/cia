package com.spring.cia.ceoMenu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.util.PageVO;

public interface ICeoMenuMapper {

	/*
	 * couponList
	 */
	// 쿠폰 만들기
	void generateCoupon(CouponVO couponVO);

	List<CouponVO> getList();

	void deleteLine(String couponCode);

	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	// 메뉴 만들기 리턴값으로 상태값 확인
	int insertMenu(Map<String, Object> map);

	Map<String, Object> getByteImage();

	List<Map<String, Object>> getByteImageList();

	/*
	 * menuList 끝
	 */

	/*
	 * orderList
	 */
	List<OrderVO> newOrder(String shopName);
	List<OrderVO> commitOrder(String shopName);
	List<OrderVO> cookOrder(String shopName);
	void orderCommit(@Param("orderNum")int orderNum, @Param("state")String state, @Param("orderTimer")int orderTimer);
	void orderUpdate(@Param("orderNum")int orderNum, @Param("state")String state);

	/*
	 * orderList 끝
	 */

	/*
	 * saleHistory
	 */
	List<OrderVO> saleHis(@Param("shopName") String shopName, @Param("dayStart") String dayStart,
			@Param("dayEnds") String dayEnds);

	/*
	 * saleHistory 끝
	 * 
	 * /* shopReviewList
	 */
	List<ReviewVO> reivewList(@Param("shopName") String shopName, @Param("pvo") PageVO pvo);

	ReplyVO replyContent(int reviewNum);

	int getReviewTotal(String shopName);

	void replyWrite(@Param("writeReviewNum") int writeReviewNum, @Param("writeShopName") String writeShopName,
			@Param("writeReplyContent") String writeReplyContent);

	void reviewReply(int writeReviewNum);

	void replyDelete(int replyNum);

	void revewiReplyDel(int reviewNum);

	void replyModify(@Param("replyNum") int replyNum, @Param("replyContent") String replyContent);
	/*
	 * shopReviewList 끝
	 */
}
