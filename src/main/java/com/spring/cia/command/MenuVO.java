package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuVO {
	String del = "del";
	
	private String menuName;
	private int menuPrice;
	private String menuInfo;
	private String menuOpen;
	private String shopName;
	
}
