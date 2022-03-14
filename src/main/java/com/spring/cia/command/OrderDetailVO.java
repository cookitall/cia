package com.spring.cia.command;

/*
CREATE TABLE cia_order_detail
(
	order_num number NOT NULL,
	menu_name varchar2(50) NOT NULL,
	order_price number NOT NULL,
	order_msg varchar2(100),
	user_name varchar2(50) NOT NULL,
	user_addr1 varchar2(50) NOT NULL,
	user_addr2 varchar2(50) NOT NULL
);*/
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
