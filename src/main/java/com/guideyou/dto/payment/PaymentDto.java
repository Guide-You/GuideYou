package com.guideyou.dto.payment;

import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

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
	private String merchantUid;
	private int userId;
	private int productId;
	private String productTitle;
	private Long productPrice;
	private String paymentStatus;
	

}
