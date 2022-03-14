package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	String del = "del";
	
	private int orderNum;
	private int originalPrice;
	private int couponDiscount;
	private int orderPrice;
}
