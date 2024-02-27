package com.guideyou.dto.payment;

import lombok.Data;
import lombok.ToString;

/**
  * @FileName : PaymentResponse.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : kakaopay 결제 정보를 받아 올 DTO
  */
@Data
@ToString
public class PaymentDto {
	// payment table
	private String merchantUid;
	private Integer userId;
	private Long totalPrice;
	private String paymentStatus;	// payment 테이블, 디테일테이블 둘 다 존재 아마 payment 테이블은 환불상태엿는듯
	// payment detail table
	private Integer productId;
	private String productTitle;
}
