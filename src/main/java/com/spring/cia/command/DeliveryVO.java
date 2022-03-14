package com.spring.cia.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryVO {
	
	
	
	private int orderNum;
	private Timestamp orderDate;
	private int orderTimer;
	private String orderState;
	private int deliveryPrive;
}
