package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.Board;

/**
  * @FileName : BoardRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 16. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 :
  */
@Mapper
public interface BoardRepository {
	
	public int insert(Board board);
	public int updateById(Board board);
	public int deleteById(Integer id);
	
	public List<Board> findAllByUserId();
	public Board findByNumber(String id);
	
	
	
}
