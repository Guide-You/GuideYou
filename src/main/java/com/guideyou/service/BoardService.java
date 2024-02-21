package com.guideyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.interfaces.admin.BoardRepository;

/**
 * @FileName : BoardService.java
 * @Project : GuideYou
 * @Date : 2024. 2. 20.
 * @작성자 : 김수현
 * @변경이력 :
 * @프로그램 설명 :
 */
@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	/**
	  * @Method Name : insert
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 :
	  */
	public void insert(BoardDto boardDto) {
		Board board = new Board();
		board.setType(boardDto.getType());
		board.setWriter(boardDto.getWriter());
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setViewCount(boardDto.getViewCount());
		
		boardRepository.insert(board);
		
	}
}