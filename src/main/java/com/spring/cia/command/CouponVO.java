package com.spring.cia.command;
/* 
CREATE TABLE cia_coupons
(
   coupon_name varchar2(30) NOT NULL,
   coupon_discount number NOT NULL,       --쿠폰 할인금액
   coupon_regdate date NOT NULL,          --쿠폰시작날짜
   coupon_enddate date NOT NULL,         --쿠폰 만료 날짜
   shop_name varchar2(50) NOT NULL,
   coupon_remain number NOT NULL,      --쿠폰 남은 수량
   coupon_term_price number NOT NULL, --사용 조건
   PRIMARY KEY (coupon_name)
);

ALTER TABLE cia_coupons
ADD (coupon_code varchar2(20) NOT NULL);
*/

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	
	private String couponName;
	private int couponDiscount;
	private Timestamp couponRegDate;
	private Timestamp couponEndDate;
	private String shopName;
	private int couponRemain;
	private int couponTermPrice;
	

}
