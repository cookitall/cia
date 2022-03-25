package com.spring.cia.command;

/*
CREATE TABLE cia_delivery
(
	order_num number NOT NULL,
	order_date date DEFAULT sysdate NOT NULL,
	order_timer number NOT NULL,
	order_state varchar2(50) NOT NULL,
	delivery_price number,
	PRIMARY KEY (order_num)
);*/
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
	private String orderState; //new-주문미접수 commit-주문접수 cook-조리중 deliGo-배달시작 end-완료 
	private int deliveryPrice;
}
