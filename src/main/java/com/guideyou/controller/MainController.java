package com.guideyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
  * @FileName : MainController.java
  * @Project : GuideYou
  * @Date : 2024. 2. 20. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 :
  */
@Controller
public class MainController {

	
	@GetMapping({"/", "/main"})
	public String mainPage() {
		return "main";
	}
	
}
