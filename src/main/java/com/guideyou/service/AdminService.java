package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.repository.interfaces.admin.AdminRepository;

/**
 * @FileName : AdminService.java
 * @Project : GuideYou
 * @Date : 2024. 2. 29.
 * @작성자 : 장명근
 * @변경이력 :
 * @프로그램 설명 : 관리자 페이지 service
 */
@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepository;

	/**
	 * @Method Name : findLatestPosts
	 * @작성일 : 2024. 2. 29.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 최신 게시물 조회
	 */
	public List<ProductDto> findLatestPosts() {

		return adminRepository.findLatestPosts();
	}
	
	
	/**
	  * @Method Name : findProductInfo
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 인기 상품 정보 조회
	  */
	public List<ProductDto> findProductInfo() {
		
		return adminRepository.findProductInfo();
	}
	
	/**
	  * @Method Name : selectProductList
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 날짜 검색 기능
	  */
	public List<ProductDto> selectProductList(String selectedValue) {
		
		 return adminRepository.selectProductList(selectedValue);
	}
	
	/**
	  * @Method Name : selectPaymentList
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 개수 조회
	  */
	public AdminDto selectPaymentInfo() {
		
		return adminRepository.selectPaymentInfo();
	}
	
	/**
	  * @Method Name : selectTotalPriceInfo
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 총액 조회
	  */
	public AdminDto selectTotalPriceInfo() {
		
		return adminRepository.selectTotalPriceInfo();
	}
	
	/**
	  * @Method Name : selectTotalUserInfo
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 가입자 수 조회
	  */
	public AdminDto selectTotalUserInfo() {
		
		return adminRepository.selectTotalUserInfo();
	}
	
	/**
	  * @Method Name : selectBoardList
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 게시글 조회
	  */
	public List<BoardDto> selectBoardList() {
		
		return adminRepository.selectBoardList();
	}
}
