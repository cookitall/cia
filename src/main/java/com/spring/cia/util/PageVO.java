package com.spring.cia.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {

	
	private int pageNum;
	private int countPerPage;
	
	
	public PageVO() {
		this.pageNum = 1;
		this.countPerPage = 20;
	}

}
