package com.guideyou.dto.payment.portone;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : ResponseToken.java
  * @Project : GuideYou
  * @Date : 2024. 3. 2. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제시 Token 받아 올 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ResponseToken {
	public String accessToken;
	public Integer now;
	public Integer expiredAt;
}
