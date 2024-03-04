package com.guideyou.dto.payment;

import lombok.Data;
import lombok.ToString;

/**
  * @FileName : RefundDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 3. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 환불 DTO
  */
@Data
@ToString
public class RefundDto {
	private String merchantUid;
	private Long refundPrice;
	private String cancelReason;
	
}
