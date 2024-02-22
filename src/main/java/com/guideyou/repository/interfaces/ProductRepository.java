package com.guideyou.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;


// TODO: 패키지 변경 (2024.02.22-경진) - 확인자 : 명근 
@Mapper
public interface ProductRepository {
	
	public int insert(Product product);
	public int updateById(Product product);
	public int updateBySoldCount(Integer productId);
	public int updateByWishCount(Product product);
	public int updateByViewCount(Product product);
	public int deletById(Integer id);
	
	public List<Product> findAllByUserId(Integer userId);
	public Product findByProductId(Integer id);
	public List<Product> findAll();
	
	public List<Product> findByTitleContaining(String keyword);	
	
	// 상품 대표 이미지 찾기
	public List<Product> findProductsWithImages();
	
	// citycode로 페이지 출력
	public List<ProductSaveFormDto> findProductsByCityCode(String cityCode);	
	
	// 페이징 처리
	public List<Product> findAllwithPasing(@Param ("offset") int offset, @Param ("limit") int limit, 
											@Param("title") String title);
	
	public int getTotalCount();
	
	
	// 비동기적 페이징 처리
	PageRes<Product> getProductsWithPaging(PageReq pageReq);

    int getTotalProductCount();
    
    
    // 인기 플랜 조회
    List<Product> popularProduct();
    	
}
