package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.admin.CommentDto;
import com.guideyou.repository.entity.Comment;
import com.guideyou.repository.interfaces.admin.CommentRepository;

/**
  * @FileName : CommentService.java
  * @Project : GuideYou
  * @Date : 2024. 2. 28. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : 댓글 service 
  */
@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	// 댓글 입력
	public void insertComment(CommentDto commentDto) {
		Comment comment = new Comment();
		comment.setBContentsId(commentDto.getBContentsId());
		comment.setWriterId(commentDto.getWriterId());
		comment.setContent(commentDto.getContent());
	
		commentRepository.insertComment(comment);
	};
		
	// 댓글 수정
	public void updateComment(Comment comment) {
		int reply = commentRepository.updateComment(comment);
		// comment 수정에 대한 결과 = reply
	};
	
	// 댓글 삭제
	public int deleteComment(Integer id) {
		return commentRepository.deleteComment(id);
	}
	
	// 댓글 전체 불러오기
	public List<Comment> commentList() {
		List<Comment> commentList = commentRepository.printAllcoms();
		return commentList;
	}
	
	// 댓글 조회
	public Comment findComment(Integer Id) {
		Comment comment = commentRepository.findComment(Id);
		return comment;
	}

	/**
	  * @Method Name : findCommentByBoardId
	  * @작성일 : 2024. 3. 7.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : boarId로 댓글 조회
	  * @param boardId
	  * @return
	  */
	public Comment findCommentByBoardId(Integer boardId) {
		Comment comment = commentRepository.findCommentByBoardId(boardId);
		return comment;
	}	
	
	
	
}
