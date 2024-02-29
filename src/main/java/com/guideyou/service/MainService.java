package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.main.CountDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.repository.interfaces.admin.MainRepository;


@Service
public class MainService {
	
	@Autowired
	private MainRepository mainRepository;
	
	// 24.02.29 메인 페이지 인기 상품(가장 많이 팔린 상품) 목록 조회
	public List<ProductDto> findPopularProducts() {
		
		return mainRepository.findPopularProducts();
	}
	
	// 24.02.29 메인 페이지 지역 별 인기 상품 조회
	public List<ProductDto> findPopularLocalProduct() {
		
		return mainRepository.findPopularLocalProduct();
	}
	
	// 24.02.29 메인 페이지 실적 조회
	public CountDto findPerformance() {
		
		return mainRepository.findPerformance();
	}
}
