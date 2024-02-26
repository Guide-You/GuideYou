package com.guideyou.dto.payment;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : PurchasedProductInfoDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 26. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 구매한 상품 정보 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PurchasedProductInfoDTO {
	private String cityName;			// 구매한 상품의 지역명
    private String productTitle;		// 구매한 상품의 제목
    private Timestamp paymentDate;		// 결제한 날짜
    private Long productImage;		// 구매한 상품의 썸네일 사진
}
