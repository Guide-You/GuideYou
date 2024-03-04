/**
 * 
 */
package com.guideyou.service.wishListService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
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
	public PageRes<WishListProductUserDTO> findwishListProductUserByUserId(PageReq pageReq, Integer userId) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = wishListRepository.getWishListListTotalCount(userId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("offset", offset);
		map.put("size", size);
		
		List<WishListProductUserDTO> WishListProductUserDTOList = wishListRepository.findwishListProductUserByUserId(map);
		
		PageRes<WishListProductUserDTO> pageRes = new PageRes<>(WishListProductUserDTOList, page, totalElements, size);

		return pageRes;
	}
}
