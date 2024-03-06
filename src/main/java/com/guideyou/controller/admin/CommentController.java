package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.admin.CommentDto;
import com.guideyou.repository.entity.Comment;
import com.guideyou.repository.entity.User;
import com.guideyou.service.CommentService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

/**
 * @FileName : CommentController.java
 * @Project : GuideYou
 * @Date : 2024. 2. 28.
 * @작성자 : 김수현
 * @변경이력 :
 * @프로그램 설명 :
 */
@Controller
@RequestMapping("/company")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@Autowired
	private HttpSession httpSession;

	// 댓글 입력
	@PostMapping("/saveComment")
	public String comIn(CommentDto comIn) {
		User loginUser = (User) httpSession.getAttribute(Define.PRINCIPAL);
		comIn.setWriterId(loginUser.getId());
		commentService.insertComment(comIn);
		return "redirect:/company/boardDetail/" + comIn.getBContentsId();
	}

	// 댓글 목록
	public String commentList() {
		List<Comment> comList = commentService.commentList();

		return "/company/testDetail";
	}

	// 댓글 삭제

	/**
	  * @Method Name : deleteComment
	  * @작성일 : 2024. 3. 7.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 댓글 삭제 기능 구현
	  * @param comId
	  * @param boardId
	  * @return
	  */
	@GetMapping("/deleteComment/{comId}/{boardId}")
	public String deleteComment(@PathVariable("comId") Integer comId, @PathVariable("boardId") Integer boardId) {
		commentService.deleteComment(comId);
		return "redirect:/company/boardDetail/" + boardId;
	}

	/**
	  * @Method Name : updateComment
	  * @작성일 : 2024. 3. 7.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : ajax 수정 구현
	  * @param bContentsId
	  * @param content
	  * @param commentId
	  * @param writerId
	  * @return
	  */
	// 댓글 수정
	@PostMapping("/updateComment")
	@ResponseBody
	public String updateComment(@RequestParam Integer bContentsId, @RequestParam String content,
			@RequestParam Integer commentId, @RequestParam Integer writerId) {
		Comment comment = new Comment();
		comment.setId(commentId);
		comment.setBContentsId(bContentsId);
		comment.setWriterId(writerId);
		comment.setContent(content);
		commentService.updateComment(comment);
		return "success";
	}

}
