package com.guideyou.dto.payment.portone;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : PaymentVerificationDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 2. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 검증을 위한 dto
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentVerificationDto {
	public String impUid;
	public String merchantUid;
	public String status;
	

}
