package com.guideyou.repository.interfaces.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.entity.Comment;
import com.guideyou.repository.entity.Product;

/**
  * @FileName : CommentRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 28. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : qna 상세보기에 하단에 달리는 commnet
  */
@Mapper
public interface CommentRepository {

	// comment 등록
	public int insertComment(Comment comment);
	// comment 수정
	public int updateComment(Comment comment);
	// comment 삭제
	public int deleteComment(Integer comId); // 댓글user id
	// comment 조회
	public Comment findComment(Integer comId);
	// comment 불러오기
	public List<Comment> printAllcoms();
	// comment 조회 by boardId
	public Comment findCommentByBoardId(Integer boardId);
	
}
