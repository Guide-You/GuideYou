package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.product.ProductDto;


/**
  * @FileName : AdminRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 장명근
  * @변경이력 :
  * @프로그램 설명 : 관리자 페이지 repository
  */
@Mapper
public interface AdminRepository {
	
	// 24.02.29 최신 게시물 조회
	public List<ProductDto> findLatestPosts();
	
	// 24.02.29 인기 상품 정보 조회
	public List<ProductDto> findProductInfo();
	
	// 24.03.03 날짜 검색 기능
	public List<ProductDto> selectProductList(@Param ("selectedValue") String selectedValue);
	
	// 24.03.03 상품 판매 개수 조회
	public AdminDto selectPaymentInfo();
	
	// 24.03.03 상품 판매 총 액수 조회
	public AdminDto selectTotalPriceInfo();
	
	// 24.03.03 가입자 수 조회
	public AdminDto selectTotalUserInfo();
	
	// 24.03.03 게시글 조회
	public List<BoardDto> selectBoardList();
	
}
