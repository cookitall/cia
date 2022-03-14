package com.spring.cia.command;

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
