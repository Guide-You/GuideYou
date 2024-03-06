package com.guideyou.dto.payment;

import java.text.DecimalFormat;

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
// TODO: productSeller -> 추후 닉네임으로 변경
@Data
@ToString
public class OrderDto {
	
	private Integer productId;
	private String productTitle;
	private Integer productSellerId;	// 판매자 ID
	private String sellerNickname;		// 판매자 이름
	private Long productPrice;
	private Integer orderUserId;		// 구매자 ID
	private String thumbnailFileName;
	
	
	
	public String formatProductPrice() {
        if (productPrice != 0L) { // 변경된 타입에 따라 null 대신 0L로 비교
            DecimalFormat df = new DecimalFormat("#,###");
            String formaterNumber = df.format(productPrice);
            return formaterNumber + "원";
        } else {
            return ""; // 빈 문자열 반환
        }
    }
	
	
	
	
	
}
