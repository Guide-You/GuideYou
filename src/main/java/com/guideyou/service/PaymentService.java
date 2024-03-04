package com.guideyou.service;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
import com.guideyou.dto.payment.RefundDto;
import com.guideyou.dto.review.ReviewDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.entity.PaymentDetail;
import com.guideyou.repository.interfaces.payment.PaymentDetailRepository;
import com.guideyou.repository.interfaces.payment.PaymentRepository;
import com.guideyou.repository.interfaces.product.ProductRepository;
import com.guideyou.utils.Define;

import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : PaymentService.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : PaymentService
  */
@Service
@Slf4j
public class PaymentService {
	@Autowired
	private PaymentRepository paymentRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private PaymentDetailRepository paymentDetailRepository;

	
	/**
	  * @Method Name : createPayment
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 박경진
	  * @변경이력 : 2024.02.29 payment 테이블 paymentDetail 테이블 추가로 인한 로직 변경
	  * @Method 설명 : 단일 결제, insert 후 product soldCount +1
	  */
	@Transactional
	public void createPayment(PaymentDto paymentDto) {
	//public Payment createPayment(PaymentDto paymentDto) {	// entity반환해보기
		
		log.info("servicePaymentDto : "+paymentDto.toString());
		Payment payment = Payment.builder()
				.merchantUid(paymentDto.getMerchantUid())
				.userId(paymentDto.getUserId())
				.totalPrice(paymentDto.getTotalPrice())
				.paymentStatus(paymentDto.getPaymentStatus())
				.build();
		
		log.info("servicepayment Entity : "+payment.toString());
		
		int paymentResult = paymentRepository.insertPayment(payment);
		

		
		
		PaymentDetail paymentDetail = PaymentDetail.builder()
				.merchantUid(paymentDto.getMerchantUid())
				.productId(paymentDto.getProductId())
				.productPrice(paymentDto.getTotalPrice())	// 단일 결제, payment의 totalPrice와 동일
				.paymentStatus(paymentDto.getPaymentStatus())
				.build();
		int paymentDetailResult = paymentDetailRepository.insertPaymentDetail(paymentDetail);
		log.info("payment result : "+ paymentResult);
		log.info("payment detail result : "+ paymentDetailResult);
		
		if(paymentResult == 1 && paymentDetailResult == 1) {
			log.info("serviceResult == 1 실행");
			productRepository.updateBySoldCount(paymentDto.getProductId());
			
			log.info("service에서 count +1 까지 완료 했어염 그럼 다시 컨트롤러로 슈슝!");
			//return payment;	// return값 추가해본다
			
		}else {
			log.info("serviceResult != 1 exception");
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_PAYMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/**
	  * @Method Name : getPurchasedProductInfoList
	  * @작성일 : 2024. 2. 26.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 구매한 상품 정보 리스트
	  */
	public List<PurchasedProductInfoDTO> getPurchasedProductInfoList(Integer userId) {
		List<PurchasedProductInfoDTO> purchasedProductInfoList = paymentRepository.getPurchasedProductInfoList(userId);
		return purchasedProductInfoList;
	}

	/**
	  * @Method Name : updatePaymentOnRefund
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 :환불로 인한 payment 및 paymentDetail 테이블 업데이트 
	  */
	@Transactional
	public void updatePaymentOnRefund(RefundDto refundDto) {
		
		try {
			// 만약 update실패시 로직 처리도 해야함
				log.info("update refund info start");
				paymentRepository.updatePaymentOnRefund(refundDto);
				productRepository.updateByCancelSoldCount(refundDto.getMerchantUid());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}


	/**
	  * @Method Name : findByMerchantUidAndUserId
	  * @작성일 : 2024. 3. 4.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 환불을 위해 MerchantUid와 UserId로 DB 검색 
	  */
	@Transactional
	public Payment findByMerchantUidAndUserId(String merchantUid, Integer userId) {
		log.info("payment 테이블 조회 merchantId"+merchantUid);
		log.info("User Id : " + userId);
		
		Payment payment = paymentRepository.findByMerchantUidAndUserId(merchantUid, userId);
		
		log.info("service payment : "+payment);
		
		return payment;
	}
	

	

	
}
