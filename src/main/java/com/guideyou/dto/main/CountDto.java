package com.guideyou.dto.main;

import lombok.Data;


/**
  * @FileName : CountDto.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 장명근
  * @변경이력 :
  * @프로그램 설명 : 메인 페이지 상품 수, 유저 수, 리뷰 수를 위한 Dto
  */
@Data
public class CountDto {
	
	private Integer productCount;
	private Integer userCount;
	private Integer reviewCount;
}
