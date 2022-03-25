package com.spring.cia.command;
/*
CREATE TABLE cia_review
(
	review_num number NOT NULL,
	user_id varchar2(50) NOT NULL,
	order_num number NOT NULL,
	menu_name varchar2(50) NOT NULL,
	shop_name varchar2(50) NOT NULL,
	review_content varchar2(200) NOT NULL,
	review_star number NOT NULL,
	review_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (review_num)
);
ALTER TABLE cia_review
ADD(review_reply NUMBER(5) NOT NULL);
ALTER TABLE cia_review DROP COLUMN menu_name;
CREATE SEQUENCE review_seq

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
public class ReviewVO {
	
	
	private int reviewNum;
	private String userId;
	private int orderNum;
	private String shopName;
	private String reviewContent;
	private int reviewStar;
	private Timestamp reviewDate;
	private int reviewReply;     //리플이 있으면 1, 리플이 없으면 0
}
