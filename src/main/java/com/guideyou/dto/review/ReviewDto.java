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
	private Integer reviewProductId;
	private String reviewTitle;
	private String reviewContent;
	private double reviewScore;
	
}
