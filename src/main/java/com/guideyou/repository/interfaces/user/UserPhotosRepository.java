package com.guideyou.repository.interfaces.user;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.user.UserPhotos;

/**
  * @FileName : UserPhotosRepository.java
  * @Project : GuideYou
  * @Date : 2024. 3. 4. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : UserPhotosRepository
  */

@Mapper
public interface UserPhotosRepository {
	public int insert(UserPhotos userPhotosDTO);
	public UserPhotos findByUserId(Integer userId);
	public int updateById(UserPhotos userPhotosDTO);
}
