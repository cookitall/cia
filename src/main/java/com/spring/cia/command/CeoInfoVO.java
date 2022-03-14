package com.spring.cia.command;

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
