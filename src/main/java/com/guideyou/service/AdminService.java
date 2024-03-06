package com.guideyou.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.AdminPaymentListDto;
import com.guideyou.dto.admin.AdminUserInfoDto;
import com.guideyou.dto.admin.BoardDto;
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
	 * @Method Name : findLatestPostsD
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 오늘 최신 게시물 조회
	 */
	public List<ProductDto> findLatestPostsD() {
		
		return adminRepository.findLatestPostsD();
	}
	
	/**
	 * @Method Name : findLatestPostsM
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 이번 달 최신 게시물 조회
	 */
	public List<ProductDto> findLatestPostsM() {
		
		return adminRepository.findLatestPostsM();
	}
	
	/**
	 * @Method Name : findLatestPostsY
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 올해 최신 게시물 조회
	 */
	public List<ProductDto> findLatestPostsY() {
		
		return adminRepository.findLatestPostsY();
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
	 * @Method Name : findProductInfoD
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 오늘 최신 게시물 조회
	 */
	public List<ProductDto> findProductInfoD() {
		
		return adminRepository.findProductInfoD();
	}
	
	/**
	 * @Method Name : findProductInfoM
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 이번 달 최신 게시물 조회
	 */
	public List<ProductDto> findProductInfoM() {
		
		return adminRepository.findProductInfoM();
	}
	
	/**
	 * @Method Name : findProductInfoY
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 올해 최신 게시물 조회
	 */
	public List<ProductDto> findProductInfoY() {
		
		return adminRepository.findProductInfoY();
	}
	
	
	
	/**
	  * @Method Name : selectPaymentInfo
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 개수 조회
	  */
	public AdminDto selectPaymentInfo() {
		
		return adminRepository.selectPaymentInfo();
	}
	
	/**
	  * @Method Name : selectPaymentInfoD
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 개수 조회
	  */
	public AdminDto selectPaymentInfoD() {
		
		return adminRepository.selectPaymentInfoD();
	}
	
	/**
	  * @Method Name : selectPaymentInfoM
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 개수 조회
	  */
	public AdminDto selectPaymentInfoM() {
		
		return adminRepository.selectPaymentInfoM();
	}
	
	/**
	  * @Method Name : selectPaymentInfoY
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 판매 된 상품 개수 조회
	  */
	public AdminDto selectPaymentInfoY() {
		
		return adminRepository.selectPaymentInfoY();
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
	  * @Method Name : selectTotalPriceInfoD
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 오늘 판매 된 상품 총액 조회
	  */
	public AdminDto selectTotalPriceInfoD() {
		
		return adminRepository.selectTotalPriceInfoD();
	}
	
	/**
	  * @Method Name : selectTotalPriceInfoM
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 이번 달 판매 된 상품 총액 조회
	  */
	public AdminDto selectTotalPriceInfoM() {
		
		return adminRepository.selectTotalPriceInfoM();
	}
	
	/**
	  * @Method Name : selectTotalPriceInfoY
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 올해 판매 된 상품 총액 조회
	  */
	public AdminDto selectTotalPriceInfoY() {
		
		return adminRepository.selectTotalPriceInfoY();
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
	  * @Method Name : selectTotalUserInfoD
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 오늘 가입자 수 조회
	  */
	public AdminDto selectTotalUserInfoD() {
		
		return adminRepository.selectTotalUserInfoD();
	}
	
	/**
	  * @Method Name : selectTotalUserInfoM
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 이번 달 가입자 수 조회
	  */
	public AdminDto selectTotalUserInfoM() {
		
		return adminRepository.selectTotalUserInfoM();
	}
	
	/**
	  * @Method Name : selectTotalUserInfoY
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 올해 가입자 수 조회
	  */
	public AdminDto selectTotalUserInfoY() {
		
		return adminRepository.selectTotalUserInfoY();
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
	
	/**
	  * @Method Name : selectBoardListD
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 오늘 게시글 조회
	  */
	public List<BoardDto> selectBoardListD() {
		
		return adminRepository.selectBoardListD();
	}
	
	/**
	  * @Method Name : selectBoardListM
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 이번 달 게시글 조회
	  */
	public List<BoardDto> selectBoardListM() {
		
		return adminRepository.selectBoardListM();
	}
	
	/**
	  * @Method Name : selectBoardListY
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 올해 게시글 조회
	  */
	public List<BoardDto> selectBoardListY() {
		
		return adminRepository.selectBoardListY();
	}
	

	/**
	  * @Method Name : chartInformationListD
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 오늘 그래프 정보 조회
	  */
	public List<Map<String, Object>> chartInformationListD() {
		
		return adminRepository.chartInformationListD();
	}
	
	/**
	  * @Method Name : chartInformationListM
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 이번 달 그래프 정보 조회
	  */
	public List<Map<String, Object>> chartInformationListM() {
		
		return adminRepository.chartInformationListM();
	}
	
	/**
	  * @Method Name : chartInformationListY
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 올해 그래프 정보 조회
	  */
	public List<Map<String, Object>> chartInformationListY() {
		
		return adminRepository.chartInformationListY();
	}
	
	
	
	/**
	  * @Method Name : getPaymentCount
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 결제 내역 개수 조회
	  */
	public int getPaymentCount() {
		
		return adminRepository.getPaymentCount();
	}
	
	
	/**
	  * @Method Name : selectPaymentInfoList
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 관리자 수익 페이지 조회
	  */
	public PageRes<AdminPaymentListDto> selectPaymentInfoList(PageReq pageReq) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산
		
		long totalElements = adminRepository.getPaymentCount();
		
		List<AdminPaymentListDto> list = adminRepository.selectPaymentInfoList(offset, size);
		
		PageRes<AdminPaymentListDto> pageRes = new PageRes<>(list, page, totalElements, size);
		
		return pageRes;
	}
	
	/**
	  * @Method Name : getUserCount
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 유저 정보 개수 조회
	  */
	public int getUserCount() {
		
		return adminRepository.getUserCount(); 
	}
	
	
	/**
	  * @Method Name : selectUserInfoList
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 관리자 페이지 유저 정보 조회
	  */
	public PageRes<AdminUserInfoDto> selectUserInfoList(PageReq pageReq) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산
		
		long totalElements = adminRepository.getUserCount();
		
		List<AdminUserInfoDto> list = adminRepository.selectUserInfoList(offset, size);
	
		PageRes<AdminUserInfoDto> pageRes = new PageRes<>(list, page, totalElements, size);
		
		return pageRes;
	
	}
	
	
	
}
