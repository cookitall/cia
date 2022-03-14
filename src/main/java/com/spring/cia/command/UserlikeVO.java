package com.spring.cia.command;
/*
CREATE TABLE cia_user_like
(
	like_num number NOT NULL,
	user_id varchar2(50) NOT NULL,
	shop_name varchar2(50) NOT NULL,
	PRIMARY KEY (like_num)
);
CREATE SEQUENCE likenum_seq

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
public class UserlikeVO {
	
	
	private int likeNum;
	private String userId;
	private String shopName;
}
