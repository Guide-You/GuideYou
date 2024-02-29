package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
