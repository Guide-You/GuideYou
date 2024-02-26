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
	/*@Transactional
	public void createReview(User user, ReviewDto reviewDto) {
		// payment table user_id == session의 user_id 확인 
		Payment payment = paymentRepository.findByUserId(user.getId());

		log.info("review service create pay " + payment);
		
		
		// review 테이블의 w_user_id(작성자)와 r_product_id(리뷰 한 상품) 중복 작성 확인
		Review review = reviewRepository.findByUserIdAndProductId(user.getId(), reviewDto.getRProductId());
		log.info("review service create review " + review);
		
		if (payment == null || review != null) {
			// TODO : 핸들러 처리 (payment :결제내역이 없거나, review 내역이 널이아님(이미 리뷰함)
		}
		
		// review 등록
		review = Review.builder()
			.wUserId(reviewDto.getWUserId())
			.rProductId(reviewDto.getRProductId())
			.content(reviewDto.getContent())
			.score(reviewDto.getScore())
			.build();

		log.info("review service create review " + review);
		
		reviewRepository.insert(review);



	}*/
}