package com.guideyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.interfaces.ProductRepository;
import com.guideyou.repository.interfaces.payment.PaymentRepository;
import com.guideyou.utils.Define;

/**
  * @FileName : PaymentService.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : PaymentService
  */
@Service
public class PaymentService {
	
	@Autowired
	private PaymentRepository paymentRepository;
	@Autowired
	private ProductRepository productRepository;

	
	/**
	  * @Method Name : createPayment
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : payment에 insert 한 후 result 값이 1이면 product 테이블의 sold 컬럼 +1
	  */
	@Transactional
	public void createPayment(PaymentDto paymentDto) {
		
		Payment payment = Payment.builder()
				.merchantUid(paymentDto.getMerchantUid())
				.userId(paymentDto.getUserId())
				.productTitle(paymentDto.getProductTitle())
				.productPrice(paymentDto.getProductPrice())
				.paymentStatus(paymentDto.getPaymentStatus())
				.build();
		
		int result = paymentRepository.insert(payment);
		if(result == 1) {
			
			productRepository.updateBySoldCount(paymentDto.getProductId());
		}else {
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_PAYMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	
	
	
	
	
}