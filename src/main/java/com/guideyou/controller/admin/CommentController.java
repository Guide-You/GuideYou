package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping("/boardDetail")
	public String comIn(CommentDto comIn) {
		User loginUser =  (User)httpSession.getAttribute(Define.PRINCIPAL);
		comIn.setWriterId(loginUser.getId());
		
		System.out.println("loginuserid= " + loginUser.getId());
		System.out.println("loginusernickname= " + loginUser.getNickname());
		System.out.println("getWriter = " + comIn.getWriterId());
		System.out.println("getContent = " + comIn.getContent());
		System.out.println("getCreatedAt= " + comIn.getCreatedAt());
		
		System.out.println("댓글 등록!"+ "되나요");
		commentService.insertComment(comIn);
		return "company/testDetail";
	}
	
	// 댓글 목록
	public String commentList() {
		List<Comment> comList = commentService.commentList();

		return "/company/testDetail"; 
	}
	
	/*
	 * // 댓글 삭제
	 * 
	 * @GetMapping("/delete/{comId}") public String
	 * deleteComment(@PathVariable("comId") Integer comId) {
	 * commentService.deleteComment(comId); return "redirect:/company/testDetail"; }
	 * // 댓글 수정
	 * 
	 * @PostMapping("/baordModify/{comId}") public String
	 * updateComment(@PathVariable("comId") Integer comId, Comment comment, Model
	 * model) {
	 * 
	 * comment.setId(comId); commentService.updateComment(comment); return
	 * "redirect:/company/testDetail/" + comId; }
	 */
}
