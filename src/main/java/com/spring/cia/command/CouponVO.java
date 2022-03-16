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
*/

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	
	//쿠폰 이름
	private String couponName;
	//쿠폰 할인 금액
	private int couponDiscount;
	//시작 사용 기간
	private Date couponRegDate;
	//끝나는 사용 기간
	private Date couponEndDate;
	//가게 이름
	private String shopName;
	//쿠폰 수량
	private int couponRemain;
	//사용 조건
	private int couponTermPrice;
	//쿠폰 코드
	private String couponCode;

}
