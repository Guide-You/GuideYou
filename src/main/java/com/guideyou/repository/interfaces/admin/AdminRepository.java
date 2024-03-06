package com.guideyou.repository.interfaces.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.AdminPaymentListDto;
import com.guideyou.dto.admin.AdminUserInfoDto;
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
	
	// 03.05 오늘 최신 게시물 조회
	public List<ProductDto> findLatestPostsD();
	
	// 03.05 이번 달 최신 게시물 조회
	public List<ProductDto> findLatestPostsM();
	
	// 03.05 올 해 최신 게시물 조회
	public List<ProductDto> findLatestPostsY();
	
	
	// 24.02.29 인기 상품 정보 조회
	public List<ProductDto> findProductInfo();
	
	// 03.05 오늘 인기 상품 조회
	public List<ProductDto> findProductInfoD();
	
	// 03.05 이번 달 인기 상품 조회
	public List<ProductDto> findProductInfoM();
	
	// 03.05 올 해 인기 상품 조회
	public List<ProductDto> findProductInfoY();
	
	
	
	// 24.03.03 상품 판매 개수 조회
	public AdminDto selectPaymentInfo();
	
	// 03.03 오늘 상품 판매 개수 조회
	public AdminDto selectPaymentInfoD();
	
	// 03.03 이번 달 상품 판매 개수 조회
	public AdminDto selectPaymentInfoM();
	
	// 03.03 올해 상품 판매 개수 조회
	public AdminDto selectPaymentInfoY();

	
	
	// 24.03.03 상품 판매 총 액수 조회
	public AdminDto selectTotalPriceInfo();
	
	// 24.03.03 오늘 상품 판매 총 액수 조회
	public AdminDto selectTotalPriceInfoD();

	// 24.03.03 이번 달 상품 판매 총 액수 조회
	public AdminDto selectTotalPriceInfoM();

	// 24.03.03 올해 상품 판매 총 액수 조회
	public AdminDto selectTotalPriceInfoY();
	
	
	
	// 24.03.03 가입자 수 조회
	public AdminDto selectTotalUserInfo();
	
	// 24.03.03 오늘 가입자 수 조회
	public AdminDto selectTotalUserInfoD();

	// 24.03.03 이번 달 가입자 수 조회
	public AdminDto selectTotalUserInfoM();

	// 24.03.03 올해 가입자 수 조회
	public AdminDto selectTotalUserInfoY();
		
		
		
	// 24.03.03 게시글 조회
	public List<BoardDto> selectBoardList();
	
	// 24.03.03 오늘 게시글 조회
	public List<BoardDto> selectBoardListD();
	
	// 24.03.03 이번 달 게시글 조회
	public List<BoardDto> selectBoardListM();
	
	// 24.03.03 올해 게시글 조회
	public List<BoardDto> selectBoardListY();

	
	
	// 24.03.05 오늘 그래프 정보 조회
	public List<Map<String, Object>> chartInformationListD();
	
	// 24.03.05 이번 달 그래프 정보 조회
	public List<Map<String, Object>> chartInformationListM();
	
	// 24.03.05 올해 그래프 정보 조회
	public List<Map<String, Object>> chartInformationListY();
	
	
	
	// 24.03.06 수익 전체 조회
	public List<AdminPaymentListDto> selectPaymentInfoList(@Param ("offset") int offset, @Param ("limit") int limit); 
	
	// 24.03.06 수익 개수 조회
	public int getPaymentCount();
	
	
	// 24.03.06 유저 정보 전체 조회
	public List<AdminUserInfoDto> selectUserInfoList(@Param ("offset") int offset, @Param ("limit") int limit); 
		
	// 24.03.06 유저 정보 개수 조회
	public int getUserCount();
	
	
}
