package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE cia_order_menu(
   order_num NUMBER NOT NULL,
   menu_num NUMBER NOT NULL,
   amount NUMBER NOT NULL
); 
ALTER TABLE cia_order_menu ADD price NUMBER NOT NULL;
*/
@Getter
@Setter
@ToString
public class OrderMenuVO {

	private int orderNum;
	private int menuNum;
	private int amount;
	private int price;
	
	private MenuVO menu;
}
