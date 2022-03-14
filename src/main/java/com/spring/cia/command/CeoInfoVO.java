package com.spring.cia.command;


/*
CREATE TABLE cia_ceo_info
(
	ceo_id varchar2(50) NOT NULL,
	ceo_email varchar2(100) NOT NULL,
	ceo_pw varchar2(50) NOT NULL,
	ceo_name varchar2(50) NOT NULL,
	ceo_phone varchar2(50) NOT NULL,
	shop_name varchar2(50) NOT NULL,
	PRIMARY KEY (ceo_id)
);

 ALTER TABLE cia_ceo_info
 ADD (ceo_regdate DATE DEFAULT sysdate);
*/
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CeoInfoVO {

	
 private String ceoId;
 private String ceoEmail;
 private String ceoPw;
 private String ceoName;
 private String ceoPhone;
 private String shopName;
 private Timestamp ceoRegDate;
}
