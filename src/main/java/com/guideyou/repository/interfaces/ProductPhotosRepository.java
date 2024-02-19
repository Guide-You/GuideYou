package com.guideyou.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.ProductPhotos;

@Mapper
public interface ProductPhotosRepository {
	
	public int insert(ProductPhotos photos);
	public int updateById(ProductPhotos photos);
	public int deleteByPhoto(Integer ProductId);
	
	// 사용자가 게시물에 올린 모든 상품 조회
	public List<ProductPhotos> findAllByProductId(Integer productId);
	// 사용자의 아이디를 찾는다?
	public ProductPhotos findByProductId(Integer id);
	
	public List<ProductPhotos> findAll();
	
	public List<ProductPhotos> findPhoto(Integer productId);
}
