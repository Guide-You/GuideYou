package com.guideyou.repository.interfaces.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.product.ProductDto;
import com.guideyou.repository.entity.ProductPhotos;

@Mapper
public interface ProductPhotosRepository {
	
	// 상품 사진 정보 저장
	public int insert(ProductPhotos photos);
	
	// 상품에 저장된 사진 삭제
	public int deleteByPhoto(Integer productId);
		
	// 사진 여러 장 삭제
	public int deleteMutiPhoto(String ids);	
	
	// 사용자가 게시물에 올린 모든 상품 조회
	public List<ProductDto> findAllByProductId(Integer productId);
	
	// 사용자의 아이디를 찾는다?
	public ProductPhotos findByProductId(Integer id);
	
	// 사진 한 장 찾기 - 생성된 시간 기준
	public ProductPhotos findPhoto();
		
	//
	List<ProductDto> selectPhotoList();
	
	
	List<ProductPhotos> findRepresentativePhotos();
	
	
	List<ProductDto> selectPhoto();
}
