package com.spring.cia.command;
/*
CREATE TABLE cia_payment
(
	order_num number NOT NULL,
	original_price number NOT NULL,
	coupon_discount number NOT NULL,
	order_price number NOT NULL,
	PRIMARY KEY (order_num)
);*/
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	
	private int orderNum;
	private int originalPrice;
	private int couponDiscount;
	private int orderPrice;
}
