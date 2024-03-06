package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.main.CountDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.repository.interfaces.admin.MainRepository;


@Service
public class MainService {
	
	@Autowired
	private MainRepository mainRepository;
	
	
	/**
	  * @Method Name : findPopularProducts
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 메인 페이지 인기 상품(가장 많이 팔린 상품) 목록 조회
	  */
	public List<ProductDto> findPopularProducts() {
		
		return mainRepository.findPopularProducts();
	}
	
	
	/**
	  * @Method Name : findPopularLocalProduct
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 메인 페이지 지역 별 인기 상품 조회
	  */
	public List<ProductDto> findPopularLocalProduct() {
		
		return mainRepository.findPopularLocalProduct();
	}
	
	 
	/**
	  * @Method Name : findPerformance
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 메인 페이지 실적 조회
	  */
	public CountDto findPerformance() {
		
		return mainRepository.findPerformance();
	}
	
	/**
	  * @Method Name : selectNoticeBoard
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 공지사항 조회
	  */
	public List<BoardDto> selectNoticeBoard() {
		
		return mainRepository.selectNoticeBoard();
	}
}
