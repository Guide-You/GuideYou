package com.guideyou.dto.payment.portone;

import java.util.LinkedHashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.guideyou.dto.payment.PaymentDto;

import lombok.Data;

/**
  * @FileName : PaymentReqDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 2. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 포트원에 결제 정보 조회를 위한 dto
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentReqDto {
    public Integer code;
    public String message;
    public PaymentVerificationDto response;
    public Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();
}
