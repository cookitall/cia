package com.spring.cia.command;
/*
CREATE TABLE cia_user_info
(
	user_id varchar2(50) NOT NULL,
	user_email varchar2(100) NOT NULL,
	user_pw varchar2(50) NOT NULL,
	user_name varchar2(50) NOT NULL,
	user_phone varchar2(50) NOT NULL,
	user_addr1 varchar2(50) NOT NULL,
	user_addr2 varchar2(50) NOT NULL,
	user_point number DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);*/
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
