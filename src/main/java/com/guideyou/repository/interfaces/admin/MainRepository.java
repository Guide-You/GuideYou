package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.main.CountDto;
import com.guideyou.dto.product.ProductDto;


/**
  * @FileName : MainRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 장명근
  * @변경이력 :
  * @프로그램 설명 : mainPage repository
  */
@Mapper
public interface MainRepository {
	
	// 24.02.29 메인 페이지 인기 상품(가장 많이 팔린 상품) 목록 조회
	public List<ProductDto> findPopularProducts();
	
	// 24.02.29 메인 페이지 지역 별 인기 상품 조회
	public List<ProductDto> findPopularLocalProduct();
	
	// 24.02.29 메인 페이지 실적 조회
	public CountDto findPerformance();
	
	// 24.03.06 공지사항 조회
	public List<BoardDto> selectNoticeBoard();
	
	
}
