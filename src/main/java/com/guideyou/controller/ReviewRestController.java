package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guideyou.dto.review.ReviewDto;
import com.guideyou.repository.entity.Review;
import com.guideyou.repository.entity.User;
import com.guideyou.service.ReviewService;
import com.guideyou.utils.Define;
import com.oracle.wls.shaded.org.apache.bcel.generic.I2F;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : ReviewRestController.java
  * @Project : GuideYou
  * @Date : 2024. 2. 27. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 :
  */

@RestController
@Slf4j
public class ReviewRestController {

	@Autowired
	HttpSession session;
	@Autowired
	private ReviewService reviewService;
	
	/**
	  * @Method Name : checkReview
	  * @작성일 : 2024. 2. 27.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : review 작성 내역 확인
	  */
	@PostMapping("/checkReview")
	public ResponseEntity<?> checkReview(@RequestBody ReviewDto reviewDto) {
		try {
			System.out.println("controller checkreview review DTO" +reviewDto);
			User user = (User) session.getAttribute(Define.PRINCIPAL);
			int userId = user.getId();
			
			log.info("reviewRestController reviewDTO.reviewproductId : "+ reviewDto.getReviewProductId());
			Review reviewResult = reviewService.findReview(userId, reviewDto.getReviewProductId());
			
			boolean a = reviewResult == null ? true : false;
			log.info("확인용 : " + a);
			if(a == false) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
	}
}
