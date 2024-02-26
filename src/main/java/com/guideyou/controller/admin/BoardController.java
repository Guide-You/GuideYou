package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.admin.BoardPageRq;
import com.guideyou.repository.entity.Board;
import com.guideyou.service.BoardService;

/**
  * @FileName : BoardController.java
  * @Project : GuideYou
  * @Date : 2024. 2. 16. 
  * @작성자 : 김수현
  * @변경이력 : 
  * @프로그램 설명 : 관리자 글 insert test 중입니다.
  */
@Controller
@RequestMapping("/company")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 1. 화면 띄우기
	@GetMapping("/testInsert")
	public String boardPage() {
		System.out.println("이건 get방식의 test가 호출되면 이 글자가 보여요");
		return "/company/testInsert";
	}
	// 2. 화면에서 자바로 데이터값 받아오기
	@PostMapping("/testInsert")
	public String inputData(BoardDto inputData) {
		inputData.setType("test"); 
		inputData.getWriter();
		inputData.getTitle();
		inputData.getContent();
		
		System.out.println("정답입니다!" + "객체.toString 하시면 됩니다.");
		boardService.insert(inputData);
		
		return "redirect:/company/testList";
	}
	
	/*
	 * public String insert(BoardDto board){ return "redirect:/company/testList"; }
	 */
	// 글 목록 BoardPageRq | BoardPageS 
	@GetMapping("/testList")
	public String boardList(BoardPageRq pgReq,Model model) {
		// 페이징  pgReq = page Request quty nop
		if(pgReq.getNop() <=0) {
		   pgReq.setNop(1); // 페이지가 0이하일 경우 첫 페이지로 설정!	
		}
		
		if(pgReq.getQuty() <= 0) {
		   pgReq.setQuty(10); // 페이지 당 보여줄 개수	
		}
		
//		BoardPageS<Board> pgS = boardService.getBoardUsingNop(pgReq); // 페이징 처리함
//		List<Board> list = pgS.getContent(); // 내용을 보여줄거다
		
		// 페이징 정보를 모델에 추가
//		model.add
		
		// 글 리스트 출력
		List<Board> boardList =boardService.boardList();
		model.addAttribute("boardAllList",boardList);
		System.out.println("BoardDto" + "여기까지오나");
		return "/company/testList"; 
	}
	/** TODO : 글 수정 기능 구현 예정입니다.
	  * @FileName : BoardController.java
	  * @Project : GuideYou
	  * @Date : 2024. 2. 23. 
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @프로그램 설명 : 관리자 글 delete test 중입니다.
	  */
	// 글 삭제
	@GetMapping("/delete/{id}")
	public String deleteById(@PathVariable("id") Integer boardId) {
			boardService.deleteById(boardId); 
			 return "redirect:/company/testList";
	}
	// 글 디테일 뷰 불러오기 우선 페이지 뜨는지 
	@GetMapping("/testDetail")
	public Board findByNumber() {
		return null;
	};
	// 글 수정
	

}
	
