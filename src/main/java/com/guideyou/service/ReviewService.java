package com.guideyou.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.review.ReviewDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.entity.Review;
import com.guideyou.repository.interfaces.payment.PaymentRepository;
import com.guideyou.repository.interfaces.review.ReviewRepository;
import com.guideyou.utils.Define;

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
	private ReviewRepository reviewRepository;
	@Autowired
	private PaymentRepository paymentRepository;
	
	/**
	  * @Method Name : createReview
	  * @작성일 : 2024. 2. 25.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : review 등록
	  */
	@Transactional
	public void createReview(Integer userId, ReviewDto reviewDto) {

			// review 등록
			Review review = Review.builder()
				.wUserId(userId)
				.rProductId(reviewDto.getReviewProductId())
				.title(reviewDto.getReviewTitle())
				.content(reviewDto.getReviewContent())
				.score(reviewDto.getReviewScore())
				.build();

			reviewRepository.insert(review);
	}
	
	/**
	  * @Method Name : checkReview
	  * @작성일 : 2024. 2. 27.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : review 작성시 review 내역 확인
	  */
	@Transactional
	public Review findReview(Integer userId, Integer productId) {

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("productId", productId);
		log.info("reviewDto.productId" + productId);
		
		// review 테이블의 w_user_id(작성자)와 r_product_id(리뷰 한 상품) 중복 작성 확인
		Review reviewChk = reviewRepository.findByUserIdAndProductId(map);
		System.out.println("reviewchk ater" + reviewChk);
		
		return reviewChk;
	}
	
	@Transactional
	/**
	  * @Method Name : findPayment
	  * @작성일 : 2024. 2. 27.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 내역 확인(review 작성시 사용)
	  */
	// TODO: PAYMENT로 이동
	public void findPayment(Integer userId, ReviewDto reviewDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("productId", reviewDto.getReviewProductId());
		
		
		
		// TODO: PAYMENT 컬럼 변경 ProductId ->  PAYMENT DETAIL로 이동 => PAYMENT 수정 후 다시!
		// TODO: 얘도 productId 걸러줘야함 map으로 변경
		// payment table user_id == session의 user_id, productId 확인 
		Payment paymentChk = paymentRepository.findByUserId(userId);
		
		if (paymentChk == null ) {
			// TODO : 핸들러 처리 (payment : 결제내역이 없음)
			throw new CustomRestfulException(Define.NOT_FOUNT_PURCHASED_HISTORY, HttpStatus.NOT_FOUND);
		}

	}
}
