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
  * @변경이력 : 2024. 02.29 Payment Detail 생성으로 인한 Entity 수정
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
		private Long totalPrice;
		private String paymentStatus;
		private Timestamp paymentDate;
		private Long refundPrice;
		private String refundCause; 
		private Timestamp refundDate; 
		private String refundYn;
		private Timestamp cancelDate; 
		private Long cancelPrice;
		private Timestamp createdAt;
}
