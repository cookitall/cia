package com.spring.cia.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.command.MenuVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.command.UserInfoVO;
import com.spring.cia.shop.mapper.IShopMapper;
import com.spring.cia.util.PageVO;

@Service
public class ShopService implements IShopService {

	@Autowired
	private IShopMapper mapper;

	@Override
	public List<ShopVO> getShopList(PageVO vo) {
		if(vo.getCategory().equals("all")) {
			return mapper.allshop(vo);
		}else {
			return mapper.getShopList(vo);
		}
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	@Override
	public ShopVO getShopInfo(String shopName) {
		return mapper.getShopInfo(shopName);
	}
	
	@Override
	public List<ReviewVO> getReviewReplyList(String shopName) {
		return mapper.getReviewReplyList(shopName);
	}

	@Override
	public List<MenuVO> getMenuList(String shopName) {
		return mapper.getMenuList(shopName);
	}
	
	public 	int couponChk(String couponCode) {
		if(mapper.couponChk(couponCode) == 0) {
			return 0;
		}else {
			return mapper.couponDiscount(couponCode);
		}
	}
	
	public String createOrder(UserInfoVO user,String shopName, String payway,
			int orderPrice, String orderMsg, String userName, String userAddr1, String userAddr2,
			List<MenuVO>menus,
			int originalPrice, int deliveryPrice, int couponDiscount) {
		
	
		String userId = user.getUserId();
		if(payway.equals("online-point")) {
			if(orderPrice > user.getUserPoint()) {
				return "fall";
			}else {
				int point = user.getUserPoint() - orderPrice;
				mapper.minusUserPoint(point, userId);
				mapper.insertOrder(shopName, userId, payway);
			    int orderNum = mapper.orNumGet();
			    
			    mapper.insertOrderDetail(orderNum, orderPrice, orderMsg, userName, userAddr1, userAddr2);
			    
			    for(MenuVO mvo : menus) {
			    	mapper.insertOrderMenu(orderNum, mvo.getMenuNum(), mvo.getMenuPrice());
			    }
			    
			    mapper.insertPayment(orderNum, originalPrice, couponDiscount, orderPrice);
			    mapper.insertDelivery(orderNum, deliveryPrice);
			    return "good";
			}
			
		}else if (payway.equals("online-card")) {
			mapper.insertOrder(shopName, userId, payway);
		    int orderNum = mapper.orNumGet();
		    mapper.insertOrderDetail(orderNum, orderPrice, orderMsg, userName, userAddr1, userAddr2);
		    
		    for(MenuVO mvo : menus) {
		    	mapper.insertOrderMenu(orderNum, mvo.getMenuNum(), mvo.getMenuPrice());
		    }
		    
		    mapper.insertPayment(orderNum, originalPrice, couponDiscount, orderPrice);
		    mapper.insertDelivery(orderNum, deliveryPrice);
		    return "cardgood";
		}else {
			mapper.insertOrder(shopName, userId, payway);
		    int orderNum = mapper.orNumGet();
		    mapper.insertOrderDetail(orderNum, orderPrice, orderMsg, userName, userAddr1, userAddr2);
		    
		    for(MenuVO mvo : menus) {
		    	mapper.insertOrderMenu(orderNum, mvo.getMenuNum(), mvo.getMenuPrice());
		    }
		    
		    mapper.insertPayment(orderNum, originalPrice, couponDiscount, orderPrice);
		    mapper.insertDelivery(orderNum, deliveryPrice);
		    return "wait";
		}
		
	}
	
	public UserInfoVO user2(UserInfoVO user) {
		return mapper.user2(user);
	}

}
