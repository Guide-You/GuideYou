/**
 * 
 */
package com.guideyou.repository.entity.wishList;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : WishList.java
  * @Project : GuideYou
  * @Date : 2024. 2. 24. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : wish_list (장바구니) 테이블 entity 
  */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WishList {
	private Integer id;				// pk값
	private Integer userId; 		// 로그인한 사용자 ID
	private Integer productId; 		// 장바구니에 담은 상품ID
	private Timestamp createdAt ; 	// 생성 시간
}
