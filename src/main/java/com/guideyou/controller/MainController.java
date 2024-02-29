package com.guideyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.guideyou.dto.main.CountDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.service.MainService;


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

	@Autowired
	private MainService mainService;
	
	@GetMapping({"/", "/main"})
	public String mainPage(Model model) {
		
		List<ProductDto> popluarProduct = mainService.findPopularProducts();
		model.addAttribute("popluarProduct", popluarProduct);
		
		List<ProductDto> popluarLocalProduct = mainService.findPopularLocalProduct();
		model.addAttribute("popluarLocalProduct", popluarLocalProduct);
		
		CountDto count = mainService.findPerformance();
		model.addAttribute("count", count);
		
		return "main";
	}
	
}
