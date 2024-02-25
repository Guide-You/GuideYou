package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.guideyou.dto.review.ReviewDto;
import com.guideyou.repository.entity.User;
import com.guideyou.service.ReviewService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : TestController.java
  * @Project : GuideYou
  * @Date : 2024. 2. 24. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Review Controller
  */
@Controller
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private HttpSession session;
	
	/**
	  * @Method Name : saveReview
	  * @작성일 : 2024. 2. 25.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : plan 구매 고객 review 작성(insert)
	  */
	@GetMapping("/review/save")
	private String saveReview(ReviewDto reviewDto) {
		
		User user = (User) session.getAttribute(Define.PRINCIPAL);
		
		//reviewService.createReview(user, reviewDto);
		
		// TODO: service 호출 실패시 처리(2024.02.26 경진)
		
		return "/user/userPurchasedList";

	}
	

}
