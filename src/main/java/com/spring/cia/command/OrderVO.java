package com.spring.cia.command;
/*
CREATE TABLE cia_order
(
	order_num number NOT NULL,
	order_date date DEFAULT sysdate NOT NULL,
	shop_name varchar2(50) NOT NULL,
	user_id varchar2(50) NOT NULL,
	payway varchar2(50),
	PRIMARY KEY (order_num)
);

CREATE SEQUENCE ordernum_seq

    START WITH 1

    INCREMENT BY 1

    MAXVALUE 1000

    NOCYCLE

    NOCACHE;
*/
import java.sql.Timestamp;
import java.util.List;

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


	private int hisCount;
	private OrderDetailVO odvo;
	private PaymentVO pay;
	private DeliveryVO deli;
	private List<OrderMenuVO> orderMenu;
}
