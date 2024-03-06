package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.entity.Product;

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
	
	// board 등록
	public int insert(Board board);
	// board 수정
	public int updateById(Board board);
	// board 삭제
	public int deleteById(Integer id);
	// board List
	public List<Board> findAll();
	// board 조회
	public Board findById(Integer id);
	/**
	  * @Method Name : getBoard
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : 페이징처리, 페이지네이션 관련코드입니다
	  */
	// 전체 페이지 불러오기
	public List<Board> findAllwithPasing(@Param ("offset") int offset, @Param ("limit") int limit, @Param("type") String type);
	// 전체 게시물개수 계산 (product에서 가져옴) 
	public int getAllPgCount();
	/**
	  * @Method Name : findAllwithPasing
	  * @작성일 : 2024. 2. 26.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 :
	  */
}
