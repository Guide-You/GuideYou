package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : Review.java
  * @Project : GuideYou
  * @Date : 2024. 2. 25. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 :
  */
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Review {

	private Integer reviewId;
	private Integer wUserId;
	private Integer rProductId;
	private String title;
	private String content;
	private double score;
	private Timestamp createdAt;
}
