package com.spring.cia.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.MenuVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.util.PageVO;

public interface IShopMapper {
	
	//카테고리명을 가지고 ShopVO(가게 정보)를 가져옴
	List<ShopVO> getShopList(PageVO vo);
	List<ShopVO> allshop(PageVO vo);
	//해당 카테고리 가게의 수
	int getTotal(PageVO vo);
	
	ShopVO getShopInfo(String shopName);
	
	List<ReviewVO> getReviewReplyList(String shopName);

	List<MenuVO> getMenuList(String shopName);

	
	int couponChk(String couponCode);
	int couponDiscount(String couponCode);
	
	void insertOrder(@Param("shopName")String shopName,
					 @Param("userId")String userId, 
					 @Param("payway")String payway );
	int orNumGet();
	
	void insertOrderDetail(@Param("orderNum")int orderNum, 
						   @Param("orderPrice")int orderPrice,
						   @Param("orderMsg")String orderMsg,
						   @Param("userName")String userName,
						   @Param("userAddr1")String userAddr1,
						   @Param("userAddr2")String userAddr2);
	
	void insertOrderMenu(@Param("orderNum")int orderNum,
						 @Param("menuNum")int menuNum,
						 @Param("price")int price);
	
	void insertPayment(@Param("orderNum")int orderNum, 
			          @Param("originalPrice")int originalPrice,
					  @Param("couponDiscount")int couponDiscount,
					  @Param("orderPrice")int orderPrice);
	
	void insertDelivery(@Param("orderNum")int orderNum,
			            @Param("deliveryPrice")int deliveryPrice);
	
	void minusUserPoint(@Param("point")int point, @Param("userId")String userId);
	
	UserInfoVO user2(UserInfoVO user);
}
