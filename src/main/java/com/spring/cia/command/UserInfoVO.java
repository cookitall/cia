package com.spring.cia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfoVO {
	
	
	private String userId;
	private String userEmail;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userAddr1;
	private String userAddr2;
	private int userPoint;
}
