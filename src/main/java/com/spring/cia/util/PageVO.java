package com.spring.cia.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {

	
	private int pageNum;
	private int countPerPage;
	
	//검색에 필요한 데이터를 변수로 선언.
	private String keyword;
	private String condition;
	private String category;
	private String shopName;
	private String menu;
	
	
	public PageVO() {
		this.pageNum = 1;
		this.countPerPage = 20;
	}

}
