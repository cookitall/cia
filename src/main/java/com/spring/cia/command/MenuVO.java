package com.spring.cia.command;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
/*
CREATE TABLE cia_menu
(
	menu_name varchar2(50) NOT NULL,
	menu_price number NOT NULL,
	menu_info varchar2(100),
	menu_open varchar2(20),
	shop_name varchar2(50) NOT NULL
);*/
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class MenuVO {

	public MenuVO() {
	}
	
	private String menuName;
	private int menuPrice;
	private String menuInfo;
	private String menuOpen;
	private String shopName;
	//이미지 관련
	private MultipartFile menuImage;
	
	
}
