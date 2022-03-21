package com.spring.cia.command;

/*
CREATE TABLE cia_menu
(
	menu_name varchar2(50) NOT NULL,
	menu_price number NOT NULL,
	menu_info varchar2(100),
	menu_open varchar2(20),
	shop_name varchar2(50) NOT NULL
);
ALTER TABLE cia_menu ADD menu_num NUMBER PRIMARY KEY;
CREATE SEQUENCE menunum_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuVO {

	private int menuNum;
	private String menuName;
	private int menuPrice;
	private String menuInfo;
	private String menuOpen;
	private String shopName;
	
}
