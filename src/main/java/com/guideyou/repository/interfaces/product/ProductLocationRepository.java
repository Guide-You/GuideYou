package com.guideyou.repository.interfaces.product;

import java.util.List;
import java.util.Map;

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

	public int updateCreatedAtById(Integer id);
	
	public ProductLocation findById(Integer id);
	
	public List<ProductLocation> findLocationByProductId(Integer productId);
	
	public ProductLocation findLocationByProductIdAndLatLng(Map<String, Object> params); 
	
	public int deleteLocationByIdList(Map<String, Object> params);

	public int updateCreatedAtByIdList(List<Integer> idList);
}
