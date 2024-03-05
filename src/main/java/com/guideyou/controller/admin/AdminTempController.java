package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.repository.entity.Board;
import com.guideyou.repository.entity.User;
import com.guideyou.service.BoardService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminTempController {
	/**
	  * @Method Name : admin controller 충돌방지 임시 컨트롤러
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 김수현
	  * @변경이력 : 
	  * @Method 설명 : admin faq,notice 글 등록 수정 삭제, qna 댓글 등록 삭제
	  */
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HttpSession httpSession;
	
	// session 값 넣기
	// 화면 띄우기 병합하면서 대문달지 의논하기
	@GetMapping("/admin/adminArticleInsert")
	public String adminArticlePage() {
		User principal = (User)httpSession.getAttribute(Define.PRINCIPAL);
		
		System.out.println("this page get ?" + principal);
		return "/admin/adminArticleInsert";
	}
	
	// 화면에서 자바로 데이터 값 받아오기
	@PostMapping("/admin/adminArticleInsert") // faq,notice 글등록
	public String articleInsert(BoardDto articleInsert) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		System.out.println("***********" + loginUser);
		articleInsert.setWriterId(loginUser.getId());
		
		articleInsert.getType();
		articleInsert.getTitle();
		articleInsert.getContent();
		
		System.out.println("admin 글 등록되었습니다" + articleInsert.toString());
		
		boardService.insert(articleInsert);
		return "redirect:/admin/adminArticleDetail";
	}
	// pagination and articleList
	@GetMapping("/adminArticleList")
	public String articleList(PageReq pageReq, Model model) {
		// 페이징
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지 당 보여줄 개수
		}

		PageRes<Board> pageRes = boardService.getBoardUsingPage(pageReq); // 페이징 처리함
		List<Board> list = pageRes.getContent(); // 내용을 보여줄거다
		System.out.println("listTest" + list.size());

		// 페이징 정보를 모델에 추가
		model.addAttribute("boardList", list); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		
		System.out.println("adminArticle" + "위치확인완료");
		return "/admin/adminArticleList";
	}
	
	// faq,notice 디테일 뷰
	@GetMapping("/adminArticleDetail/{boardId}")
	public String articleDetail(@PathVariable("boardId") Integer boardId, Model model) {
		System.out.println("boardId= " + boardId);
		Board board = boardService.findById(boardId);
		model.addAttribute("board", board);
		
		return "admin/adminArticleDetail";
	}
	// 글수정 페이지 띄우기
	@GetMapping("/admin/adminModify/{boardId}")
	public String articleModify(@PathVariable("boardId") Integer boardId, Model model) {
		Board board = boardService.findById(boardId);
		model.addAttribute("board", board);
		
		return "admin/adminModify";
	}
	
	@PostMapping("/adminModify/{boardId}")
	public String modifyByIdProc(@PathVariable("boardId") Integer boardId, Board board,
			Model model) {
		board.setId(boardId);
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		boardService.deleteById(boardId);
		System.out.println("admin 수정" + board.toString());
		return "redirect:/admin/adminArticleDetail/" + boardId;
	}
	// 게시글 삭제
	@PostMapping("/delete/{id}")
	public String aritcleDelete(@PathVariable("id") Integer boardId) {
		boardService.deleteById(boardId);
		return "redirect:/admin/adminArticleList";
		
	}
}
