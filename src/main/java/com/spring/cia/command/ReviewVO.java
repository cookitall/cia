package com.spring.cia.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	String del = "del";
	
	private int reviewNum;
	private String userId;
	private int orderNum;
	private String menuName;
	private String shopName;
	private String reviewContent;
	private int reviewStar;
	private Timestamp reviewDate;
}
