package com.guideyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.entity.Product;
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
	  * @Method 설명 :board crud.페이징
	  */
	@Transactional
	public int insert(BoardDto boardDto) {
		Board board = new Board();
		board.setType(boardDto.getType());
		board.setWriterId(boardDto.getWriterId());
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setViewCount(boardDto.getViewCount());
		
		boardRepository.insert(board);
		return board.getId();
	}
	/**
	  * @Method Name : boardList
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : 글 전체 불러오기
	  */
	// 글 전체 불러오기
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
	// 글 조회
	public Board findById(Integer boardId) {
		Board board = boardRepository.findById(boardId);
		return board;
	}
	// 글 수정
	@Transactional
	public void updateById(Board board) {
	int result = boardRepository.updateById(board); 
			
	}
	// 페이징 처리 - 총 게시글 수 조회
	public int getTotalBoardCount() {
		return boardRepository.getAllPgCount();
	}
	// 페이징 된 글 목록 조회
	public PageRes<BoardDto> getBoardUsingPage(PageReq pageReq, String type) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = boardRepository.getAllPgCount();

		// 페이징 처리된 목록 조회
		List<BoardDto> boardList = boardRepository.findAllwithPasing(offset, size, type);

		// 페이징 결과 객체 생성
		PageRes<BoardDto> pageRes = new PageRes<>(boardList ,page, totalElements, size);

		return pageRes;
	}
	
}		