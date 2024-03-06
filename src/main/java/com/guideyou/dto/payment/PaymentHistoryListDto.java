package com.guideyou.dto.payment;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : PaymentHistoryListDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 5. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제 내역 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentHistoryListDto {
	private String merchantUid;
	private String title;
	private String seller;
	private Integer paymentPrice;
	private Timestamp paymentDate;
}
