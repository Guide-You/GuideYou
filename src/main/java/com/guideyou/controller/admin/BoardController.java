package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.entity.Comment;
import com.guideyou.repository.entity.User;
import com.guideyou.service.BoardService;
import com.guideyou.service.CommentService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

/**
 * @FileName : BoardController.java
 * @Project : GuideYou
 * @Date : 2024. 2. 16.
 * @작성자 : 김수현
 * @변경이력 :
 * @프로그램 설명 : 관리자 글 insert test 중입니다.
 */
/**
  * @FileName : BoardController.java
  * @Project : GuideYou
  * @Date : 2024. 3. 5. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 :
  */
@Controller
@RequestMapping("/company")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentService commentService;

	@Autowired
	private HttpSession httpSession;
	
	// 1. 화면 띄우기
	@GetMapping("/boardInsert")
	public String boardPage() {
		User principal =  (User)httpSession.getAttribute(Define.PRINCIPAL);	
		
		if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		return "/company/boardInsert";
	}

	// 2. 화면에서 자바로 데이터값 받아오기
	@PostMapping("/boardInsert")
	public String inputData(BoardDto inputData) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		inputData.setWriterId(loginUser.getId());
		
		inputData.setType(inputData.getType()); // board는 user만 작성하므로 type은 QnA로 고정
		inputData.getTitle();
		inputData.getContent();

		int boardId = boardService.insert(inputData);

		return "redirect:/company/boardDetail/" + boardId;  // detail로 안가짐 
	}

	// 글 목록 BoardPageRq | BoardPageS
	@GetMapping("/boardList/{type}")
	public String boardList(PageReq pageReq, Model model, @PathVariable String type) {
		// 페이징
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지 당 보여줄 개수
		}

		PageRes<BoardDto> pageRes = boardService.getBoardUsingPage(pageReq, type); // 페이징 처리함
		List<BoardDto> list = pageRes.getContent(); // 내용을 보여줄거다

		// 페이징 정보를 모델에 추가
		model.addAttribute("boardList", list); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		return "/company/boardList";
	}
	/**
	 * TODO : 글 수정 기능
	 * 
	 * @FileName : BoardController.java
	 * @Project : GuideYou
	 * @Date : 2024. 2. 23.
	 * @작성자 : 김수현
	 * @변경이력 :
	 * @프로그램 설명 : 글 detail view 불러오기중입니다.
	 */
	// 글 삭제
	@GetMapping("/delete/{type}/{id}")
	public String deleteById(@PathVariable("type") String type, @PathVariable("id") Integer boardId) {
		boardService.deleteById(boardId);
		return "redirect:/company/boardList/" + type ;
	}

	/**
	  * @Method Name : selectDeatil
	  * @작성일 : 2024. 3. 7.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 글 디테일 화면
	  * @param boardId
	  * @param model
	  * @return
	  */
	// 글 디테일 뷰 페이지
	@GetMapping("/boardDetail/{boardId}")
	public String selectDeatil(@PathVariable("boardId") Integer boardId, Model model) {
		System.out.println("boardId= " + boardId);
		Board board = boardService.findById(boardId);
		Comment comment = commentService.findCommentByBoardId(boardId);
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);

		return "company/boardDetail";  
	}  // 여기에 ; 왜 있지

	// 글 수정 페이지
	@GetMapping("/boardModify/{boardId}")
	public String updateById(@PathVariable("boardId") Integer boardId, Model model) {
		Board board = boardService.findById(boardId);
		model.addAttribute("board", board);

		return "company/boardModify";
	}

	// 글 수정 기능
	@PostMapping("/boardModify/{boardId}")
	public String updateByIdProc(@PathVariable("boardId") Integer boardId, Board board, Model model) {
		board.setId(boardId);
		User loginUser	= (User)httpSession.getAttribute(Define.PRINCIPAL);
		board.setWriterId(loginUser.getId());
		boardService.updateById(board);
		return "redirect:/company/boardDetail/" + boardId;
	}
	
	// 환불정책 페이지 화면 띄우기
	@GetMapping("/policy")
	public void policyPage() {
		
	}
	// 회사소개 페이지 화면 띄우기
	@GetMapping("/comIntro")
	public void comapanyIntroPage() {
		
	}
}
