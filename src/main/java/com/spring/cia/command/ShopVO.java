package com.spring.cia.command;
/*
CREATE TABLE cia_shop
(
	shop_name varchar2(50) NOT NULL,
	shop_category varchar2(50) NOT NULL,
	shop_info varchar2(200),
	shop_num number NOT NULL,
	shop_addr1 varchar2(50) NOT NULL,
	shop_addr2 varchar2(50) NOT NULL,
	shop_coupon varchar2(50),
	review_star number,
	PRIMARY KEY (shop_name)
);*/
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ShopVO {
	
	
	private String shopName;
	private String shopCategory;
	private String shopInfo;
	private int shopNum;
	private String shopAddr1;
	private String shopAddr2;
	private String shopCoupon;
	private int reviewStar;

}
