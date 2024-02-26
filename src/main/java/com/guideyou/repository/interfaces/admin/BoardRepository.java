package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.admin.BoardDto;
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
	
	public List<Board> findAll();
	public Board findByNumber(String id);
	// 02.23 글 디테일 불러오기
	
	/**
	  * @Method Name : getBoard
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : 페이징처리, 페이지네이션 관련코드입니다
	  */
	// 전체 페이지 불러오기
	public List<Board> findAllPgs(@Param ("offset")int offset,
			@Param ("limit")int limint);

	// 전체 게시물개수 계산
	//public int getAllPgCount();
}
