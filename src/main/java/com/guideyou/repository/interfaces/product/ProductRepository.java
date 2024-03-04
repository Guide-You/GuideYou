package com.guideyou.repository.interfaces.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.product.ProductDetailDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.dto.product.ProductPhotoDto;
import com.guideyou.dto.product.ProductReviewDto;
import com.guideyou.dto.product.UploadProductsInfoDTO;
import com.guideyou.repository.entity.Product;



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
	
	// 24.02.27 수정에 필요한 정보 조회
	public List<ProductDto> selectProductInf(Integer productId);
	
	// 24.02.27 목록에 보여줄 내용들 조회
	public ProductDetailDto findByProductId(Integer productId);
	
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
    
    // 상품 상세 보기에 필요한 모든 내용 조회
 	public List<ProductDetailDto> findAllProductDetail(Integer productId); 
    
    // 24.02.27 detail 상품 정보
 	public ProductDetailDto findProductAndUser(Integer productId);
 	
 	// 24.02.27 상품 사진 리스트
 	public List<ProductPhotoDto> findByProductImg(Integer productId);

 	// 상품 리뷰리스트
 	public List<ProductReviewDto> findReviewByProduct(Integer productId);
    
	
	// 마이페이지 사용자가 작성한 상품 목록 조회 페이징 처리 - 최장호 추가 02/26
	public List<UploadProductsInfoDTO> getUploadProductsInfoByUserId(Map<String, Object> params);
	
	
	// 마이페이지 사용자가 작성한 상품 목록 총 개수 - 최장호 추가 02/26
	public Long getUploadProductsInfoTotalCount(Integer userId);
	
	
	// 이미지 업로드파일이름 찾기 2024.02.27
	public List<ProductPhotoDto> photos(Integer productId);
	
	// 24.02.28 상품 평점 조회
	public ProductReviewDto productAvg(Integer productId);
	
	// 24.02.28 아이디에 해당하는 상품 정보 조회
	public Product selectProductInfo(Integer productId);


	// 24.03.03 결제 취소시 soldCount -1 경진 추가
	public int updateByCancelSoldCount(String merchantUid);
	
	
	
	
	
    	
}
