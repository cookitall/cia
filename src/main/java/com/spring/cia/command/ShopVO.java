package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ShopVO {
	String del = "del";
	
	private String shopName;
	private String shopCategory;
	private String shopInfo;
	private int shopNum;
	private String shopAddr1;
	private String shopAddr2;
	private String shopCoupon;
	private int reviewStar;

}
