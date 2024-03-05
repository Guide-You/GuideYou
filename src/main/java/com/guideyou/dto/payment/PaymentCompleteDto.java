package com.guideyou.dto.payment;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.ToString;

/**
  * @FileName : PaymentCompleteDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 5. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제 완료 된 payment 정보 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
@ToString
public class PaymentCompleteDto {
	private Integer productId;
	private String merchantUid;
	private Timestamp paymentDate;
	private Integer productPrice;
	private String productPhoto;
	private String productTitle;
	private Integer totalPrice;
	private String seller;
}
