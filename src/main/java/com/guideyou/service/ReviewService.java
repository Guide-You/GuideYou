package com.guideyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.review.ReviewDto;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.entity.Review;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.interfaces.payment.PaymentRepository;
import com.guideyou.repository.interfaces.review.ReviewRepository;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : ReviewService.java
  * @Project : GuideYou
  * @Date : 2024. 2. 25. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Review Service
  */
@Service
@Slf4j
public class ReviewService {

	@Autowired
	private HttpSession session;	
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private PaymentRepository paymentRepository;
	
	/**
	  * @Method Name : createReview
	  * @작성일 : 2024. 2. 25.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 내역과 review 내역 확인 후 review 등록
	  */
	@Transactional
	public void createReview(Integer userId,Integer productId, ReviewDto reviewDto) {
		// payment table user_id == session의 user_id 확인 
		Integer paymentChk = paymentRepository.findByUserId(userId);

		log.info("review service payment check " + paymentChk);
		
		
		// review 테이블의 w_user_id(작성자)와 r_product_id(리뷰 한 상품) 중복 작성 확인
		Integer reviewChk = reviewRepository.findByUserIdAndProductId(userId, productId);
		//log.info("review service create review " + review);
		
		if (paymentChk == null) {
			// TODO : 핸들러 처리 (payment : 결제내역이 없음)
			log.info("payment null입니다");
		} else if(reviewChk != null) {
			
			// TODO : 핸들러 처리 (review : 이미 리뷰함) ajax처리해서 프론트로 처리
			log.info("review가 이미 있습니다");
			
		} 

		// review 등록
		Review review = Review.builder()
			.wUserId(reviewDto.getWUserId())
			.rProductId(reviewDto.getRProductId())
			.content(reviewDto.getContent())
			.score(reviewDto.getScore())
			.build();

		reviewRepository.insert(review);
		
		// TODO : product 테이블 review count ++
		
		
		log.info("review service create review " + review);
		



	}
}
