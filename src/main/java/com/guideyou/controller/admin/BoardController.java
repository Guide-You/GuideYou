package com.guideyou.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.admin.BoardDto;
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
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 1. 화면 띄우기
	@GetMapping("/test")
	public String boardPage() {
		System.out.println("이건 get방식의 test가 호출되면 이 글자가 보여요");
		return "/company/testInsert";
	}
	// 2. 화면에서 자바로 데이터값 받아오기
	@PostMapping("/company/testInsert")
	public String inputData(BoardDto inputData) {
		inputData.setType("test"); 
		inputData.getWriter();
		inputData.getTitle();
		inputData.getContent();
		
		System.out.println("정답입니다!" + "객체.toString 하시면 됩니다.");
		boardService.insert(inputData);
		
		return "redirect:/company/testList";
			
	}
	@GetMapping("/company/testInsert")
	@ResponseBody
	public String insert(BoardDto board){
//		return "redirect:/company/testList";
		return "인서트 잘 됐어요!";
	}

}
	
