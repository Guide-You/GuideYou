package com.guideyou.dto.payment.portone;

import java.util.LinkedHashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;


/**
  * @FileName : PaymentTokenDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 2. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 포트원 토큰정보를 위한 dto
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentTokenDto {
    public Integer code;
    public Object message;
    public ResponseToken response;
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();
}