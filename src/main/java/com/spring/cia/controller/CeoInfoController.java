package com.spring.cia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ceoInfo")
public class CeoInfoController {

	//@Autowired
	//private ICeoInfoService service
	
	@GetMapping("ceoLogin") 
	public void ceoLogin () {
		System.out.println("ceoLogin 요청");
	}
}
