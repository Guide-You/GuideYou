package com.guideyou.repository.interfaces.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.User;

/**
  * @FileName : UserRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 18. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : UserRepository
  */

@Mapper
public interface UserRepository {
	public int insert(User user);
	public User findByNameAndPhone(Map<String, Object> params);;
}