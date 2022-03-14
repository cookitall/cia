package com.spring.cia.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	private int orderNum;
	private Timestamp orderDate;
	private String shopName;
	private String userId;
	private String payway;
}
