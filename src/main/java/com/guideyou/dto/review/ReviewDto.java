package com.guideyou.dto.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : ReviewDto.java
  * @Project : GuideYou
  * @Date : 2024. 2. 26. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Review DTO
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {
	private Integer reviewId;
	private Integer wUserId;
	private Integer rProductId;
	private String title;	// TODO: 테이블 컬럼추가 (2024.02.25 경진) 
	private String content;
	private double score;
	
	// TODO : 여행 기간 넣을지 의견나눠보기 (2024.02.25 경진)
}
