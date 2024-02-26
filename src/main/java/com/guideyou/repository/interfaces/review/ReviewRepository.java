package com.guideyou.repository.interfaces.review;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.Review;

/**
  * @FileName : ReviewRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 25. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Review Repository
  */
@Mapper
public interface ReviewRepository {
	public int insert(Review review);
}
