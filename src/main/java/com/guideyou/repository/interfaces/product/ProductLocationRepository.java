package com.guideyou.repository.interfaces.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.product.ProductLocation;

/**
  * @FileName : ProductLocationRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 상품 위치 repository
  */
@Mapper
public interface ProductLocationRepository {
	public int insert(ProductLocation productLocation);

	public List<ProductLocation> findLocationByProductId(Integer productId);
}
