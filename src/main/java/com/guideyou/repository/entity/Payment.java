package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
  * @FileName : Payment.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : Payment Entity
  */
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Payment {
	
		private Integer paymentId;
		private String merchantUid; 
		private Integer userId; 
		private Integer productId;
		private String productTitle;
		private Long productPrice;
		private String paymentStatus;
		private Timestamp paymentDate;
		private Timestamp cancelDate; 
		private Long refundPrice;
		private String refundCause; 
		private Timestamp refundDate; 
		private String refundYn;
		private Timestamp createdAt;
}
