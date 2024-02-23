package com.guideyou.service;

import java.util.List;

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
	/**
	  * @Method Name : boardList
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : 글 전체 불러오기
	  */
	public List<Board> boardList() {
		List<Board> boardList = boardRepository.findAll();
		return boardList;
	}
	/**
	  * @Method Name : getBoard
	  * @작성일 : 2024. 2. 23.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : Board 삭제입니다
	  */
	// 글삭제 
	public int deleteById(Integer id) {
		
		return boardRepository.deleteById(id);
	}
	
}