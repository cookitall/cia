package com.spring.cia.ceoMenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CouponVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.util.PageVO;

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
	List<ReviewVO> reivewList(@Param("shopName")String shopName, @Param("pvo")PageVO pvo);
	ReplyVO replyContent(int reviewNum);
	int getReviewTotal(String shopName);
	
	
	void replyWrite(@Param("writeReviewNum")int writeReviewNum,@Param("writeShopName")String writeShopName, @Param("writeReplyContent")String writeReplyContent);
	void reviewReply(int writeReviewNum);
	void replyDelete(int replyNum);
	void revewiReplyDel(int reviewNum);
	void replyModify(@Param("replyNum")int replyNum, @Param("replyContent")String replyContent);
	/*
	 * shopReviewList 끝
	 */
}
