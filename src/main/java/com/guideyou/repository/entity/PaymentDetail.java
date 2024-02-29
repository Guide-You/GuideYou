package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

/**
  * @FileName : PaymentDetail.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Payment Detail entity
  */
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDetail {
	private Integer paymentDetailId;
	private String merchantUid; 
	private Integer productId;
	private Long productPrice;
	private String paymentStatus; 
	private Timestamp refundDate; 
	private String refundYn;
	private Timestamp createdAt;
}
