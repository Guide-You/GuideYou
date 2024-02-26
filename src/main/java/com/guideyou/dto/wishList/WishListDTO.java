/**
 * 
 */
package com.guideyou.dto.wishList;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : WishListDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 24. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : wish_list 테이블 기본 dto
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class WishListDTO {
	private Integer id;				// pk값
	private Integer userId; 		// 로그인한 사용자 ID
	private Integer productId; 		// 장바구니에 담은 상품ID
	private Timestamp createdAt ; 	// 생성 시간
}
