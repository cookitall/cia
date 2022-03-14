package com.spring.cia.command;
/*
CREATE TABLE cia_review_reply
(
	reply_num number NOT NULL,
	review_num number NOT NULL,
	shop_name varchar2(50) NOT NULL,
	reply_content varchar2(100) NOT NULL,
	reply_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (reply_num)
);
CREATE SEQUENCE reply_seq

    START WITH 1

    INCREMENT BY 1

    MAXVALUE 1000

    NOCYCLE

    NOCACHE;
*/
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	
	
	private int replyNum;
	private int reviewNum;
	private String shopName;
	private String replyContent;
	private Timestamp replyDate;

}
