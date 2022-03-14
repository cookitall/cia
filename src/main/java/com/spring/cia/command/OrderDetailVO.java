package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailVO {

	private int orderNum;
	private String menuName;
	private int orderPrice;
	private String orderMsg;
	private String userName;
	private String userAddr1;
	private String userAddr2;
}
