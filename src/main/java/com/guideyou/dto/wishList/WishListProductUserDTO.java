/**
 * 
 */
package com.guideyou.dto.wishList;

import java.text.DecimalFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : WishListProductUserDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 25. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 장바구니 페이지 dto - 상품 정보, 상품 판매자 이름을 가진다.
  */

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class WishListProductUserDTO {
    private Integer userId;				// 로그인한 사용자 ID
    private Integer productId;			// 상품 ID
    private Integer wishListId;				// wishList Id
    private String productTitle;		// 상품 제목
    private Long productPrice;			// 상품 가격
    private String writerNickname;			// 상품 작성자 이름
    private String authorId;			// 상품 작성자 Id
    private String productImage;		// 상품 이미지
    
	public String formatPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formatNumber = df.format(productPrice);
		return formatNumber + "원";
	}
}
