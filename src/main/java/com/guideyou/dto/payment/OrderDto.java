package com.guideyou.dto.payment;

import lombok.Data;
import lombok.ToString;

/**
  * @FileName : OrderDto.java
  * @Project : GuideYou
  * @Date : 2024. 2. 21. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : payment로 전송할 order 정보를 담을 dto
  */
// TODO: userId -> 추후 닉네임으로 변경
@Data
@ToString
public class OrderDto {
	
	private int productId;
	private String productTitle;
	private int productSeller;
	private Long productPrice;
	
}
