/**
 * 
 */
package com.guideyou.service.wishListService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.wishList.WishListProductUserDTO;
import com.guideyou.repository.interfaces.wishList.WishListRepository;

/**
  * @FileName : WishListService.java
  * @Project : GuideYou
  * @Date : 2024. 2. 25. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 장바구니 service
  */
@Service
public class WishListService {
	@Autowired
	private WishListRepository wishListRepository;
	
	/**
	  * @Method Name : findwishListProductUserByUserId
	  * @작성일 : 2024. 2. 25.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : userId로 장바구니 리스트 페이지 정보 가져오기
	  * @param userId
	  * @return
	  */
	public List<WishListProductUserDTO> findwishListProductUserByUserId(Integer userId) {
		List<WishListProductUserDTO> WishListProductUserDTOList = wishListRepository.findwishListProductUserByUserId(userId);
		return WishListProductUserDTOList;
	}
}