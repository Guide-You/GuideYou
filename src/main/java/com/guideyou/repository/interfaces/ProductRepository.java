package com.guideyou.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.ProductDto;
import com.guideyou.dto.product.UploadProductsInfoDTO;
import com.guideyou.repository.entity.Product;


// TODO: 패키지 변경 (2024.02.22-경진) - 확인자 : 명근 
@Mapper
public interface ProductRepository {
	
	// 상품 정보 저장
	public int insert(Product product);
	
	// 상품 정보 수정
	public int updateById(Product product);
	
	// 상품 판매 횟수 수정
	public int updateBySoldCount(Integer productId);
	
	// 상품 찜 횟수 수정
	public int updateByWishCount(Product product);
	
	// 상품 조회 횟수 수정
	public int updateByViewCount(Product product);
	
	// 상품 정보 삭제
	public int deletById(Integer id);
	
	// 상품 아이디 찾기
	public List<Product> findByProductId();
	
	// 사용자가 작성한 상품 전체 조회
	public List<Product> findAllByUserId(Integer userId);
	
	// 목록에 보여줄 내용들 조회
	public ProductDto findByProductId(Integer id);
	
	// db에 저장 된 상품 전체 조회
	public List<Product> findAll();
	
	// 상품 대표 이미지 찾기, 페이징 처리
	public List<Product> findProductsWithImages(@Param ("offset") int offset, @Param ("limit") int limit, 
			@Param("searchText") String searchText);
	
	
	// 페이징 처리
	public List<Product> findAllwithPasing(@Param ("offset") int offset, @Param ("limit") int limit,
											@Param("searchText") String searchText, @Param("cityCodeId") String cityCodeId);
	// 상품 총 개수 찾기
	public int getTotalCount(@Param("searchText") String searchText, @Param("cityCodeId") String cityCodeId);
		   
    
    // 인기 플랜 조회
    List<Product> popularProduct();
    
	
	// 마이페이지 사용자가 작성한 상품 목록 조회 - 최장호 추가 02/26
	public List<UploadProductsInfoDTO> getUploadProductsInfoByUserId(Integer userId);
	
    	
}
