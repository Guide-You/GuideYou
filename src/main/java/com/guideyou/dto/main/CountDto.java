package com.guideyou.dto.main;

import lombok.Data;

// 24.02.29 메인 페이지 상품 수, 유저 수, 리뷰 수를 위한 Dto
@Data
public class CountDto {
	
	private Integer productCount;
	private Integer userCount;
	private Integer reviewCount;
}
