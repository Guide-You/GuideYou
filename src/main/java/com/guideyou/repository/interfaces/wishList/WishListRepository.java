/**
 * 
 */
package com.guideyou.repository.interfaces.wishList;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.wishList.WishListProductUserDTO;


/**
  * @FileName : WishListRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 24. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : wishList 테이블(장바구니) repository
  */

@Mapper
public interface WishListRepository {
	// userId로 장바구니, 상품정보, 사용자 이름 리스트 가져오는 쿼리
	public List<WishListProductUserDTO> findwishListProductUserByUserId(Integer userId);
	
	

}
