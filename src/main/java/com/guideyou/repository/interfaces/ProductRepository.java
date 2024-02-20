package com.guideyou.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;

@Mapper
public interface ProductRepository {
	
	public int insert(Product product);
	public int updateById(Product product);
	public int updateBySoldCount(Product product);
	public int updateByWishCount(Product product);
	public int updateByViewCount(Product product);
	public int deletById(Integer id);
	
	public List<Product> findAllByUserId(Integer userId);
	public Product findByProductId(Integer id);
	public List<Product> findAll();
	
	public List<Product> findByTitleContaining(String keyword);	


}
