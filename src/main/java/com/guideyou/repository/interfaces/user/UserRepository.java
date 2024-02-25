package com.guideyou.repository.interfaces.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.product.UploadProductsInfoDTO;
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
	
	public User findByNickname(String nickname);
	public User findByNameAndPhone(Map<String, Object> params);
	public User findByNameAndEmail(Map<String, Object> params);
	
	// TODO: 해당 메소드 product repository로 옮겨야 함
	public List<UploadProductsInfoDTO> getUploadProductsInfoByUserId(String userId);
	
	public int updateById(User user);
}