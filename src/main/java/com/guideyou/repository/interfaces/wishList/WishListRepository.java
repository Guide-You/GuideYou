/**
 * 
 */
package com.guideyou.repository.interfaces.wishList;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.wishList.WishListProductUserDTO;
import com.guideyou.repository.entity.wishList.WishList;


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
	public List<WishListProductUserDTO> findwishListProductUserByUserId(Map<String, Object> params);
	
	public WishList findwishByProductIdAndUserId(Map<String, Object> params);

	public Long getWishListListTotalCount (Integer userId);
	
	public int insert(WishList wishList);

	public int delete(Integer id);

}
