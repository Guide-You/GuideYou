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
  * @변경이력 : 2024.02.29 장명근 - 공지사항 제외한 나머지 정보 조회 및 검색 기능 추가 
  * @프로그램 설명 :
  */
@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@GetMapping({"/", "/main"})
	public String mainPage(Model model) {
		
		// TODO: 공지 사항 조회 해야 합니다.
		
		// 24.02.29 메인 페이지 인기 상품(가장 많이 팔린 상품) 목록 조회
		List<ProductDto> popluarProduct = mainService.findPopularProducts();
		model.addAttribute("popluarProduct", popluarProduct);
		
		// 24.02.29 메인 페이지 지역 별 인기 상품 조회
		List<ProductDto> popluarLocalProduct = mainService.findPopularLocalProduct();
		model.addAttribute("popluarLocalProduct", popluarLocalProduct);
		
		// 24.02.29 메인 페이지 실적 조회
		CountDto count = mainService.findPerformance();
		model.addAttribute("count", count);
		
		return "main";
	}
	
}
