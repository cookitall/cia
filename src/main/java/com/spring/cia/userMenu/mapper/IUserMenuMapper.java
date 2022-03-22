package com.spring.cia.userMenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.OrderVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.command.UserlikeVO;
import com.spring.cia.util.PageVO;

public interface IUserMenuMapper {

	
	// likelist
	List<UserlikeVO> likelist(@Param("userId")String userId, @Param("pvo")PageVO pvo);
	ShopVO shopInfoGet(String userId);
	//페이징
	int getLikeTotal(String userId);
	
	// orderhistory
	List<OrderVO> orderHistory(@Param("userId")String userId, @Param("pvo")PageVO pvo);
	//페이징
	int getOrHiTotal(String userId);
	
	//pointView
	UserInfoVO pointView(String userId);
	
	//pointpay	
	void pointModi(@Param("userId")String userId,@Param ("userPoint")int userPoint);

	
	// reviewList
	List<ReviewVO> reivewList(@Param("userId")String userId, @Param("pvo")PageVO pvo);
	ReplyVO replyContent(int reviewNum);
	void reviewDel(int reviewNum);
	//페이징
	int getReviewTotal(String userId);

	
}
