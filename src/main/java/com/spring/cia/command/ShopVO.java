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
	review_star number,
	PRIMARY KEY (shop_name)
);
ALTER TABLE cia_shop
MODIFY (shop_num VARCHAR2(30));
*/
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
	private String shopNum;
	private String shopAddr1;
	private String shopAddr2;
	private int reviewStar;

}
