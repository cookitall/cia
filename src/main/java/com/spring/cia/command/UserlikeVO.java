package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserlikeVO {
	String del = "del";
	
	private int likeNum;
	private String userId;
	private String shopName;
}
