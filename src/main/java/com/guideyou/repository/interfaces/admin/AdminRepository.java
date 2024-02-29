package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.product.ProductDto;

// 24.02.29 관리자 페이지 repository
@Mapper
public interface AdminRepository {
	
	// 24.02.29 최신 게시물 조회
	public List<ProductDto> findLatestPosts();
}
