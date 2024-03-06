/**
 * 
 */
package com.guideyou.service.wishListService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
import com.guideyou.dto.wishList.WishListDTO;
import com.guideyou.dto.wishList.WishListProductUserDTO;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.wishList.WishList;
import com.guideyou.repository.interfaces.wishList.WishListRepository;
import com.guideyou.utils.Define;

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
	
	/**
	  * @Method Name : insert
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : insert
	  */
	@Transactional
	public int insert(WishListDTO input) {
		WishList wishList = WishList.builder()
				.userId(input.getUserId())
				.productId(input.getProductId())
				.build();
		int result = wishListRepository.insert(wishList);
		if(result == 0) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	/**
	  * @Method Name : delete
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : productId 와 userId 받아서 삭제 delete
	  */
	@Transactional
	public int delete(WishListDTO input) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", input.getUserId());
		map.put("productId", input.getProductId());
		WishList findWish = wishListRepository.findwishByProductIdAndUserId(map);
		if(findWish == null) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		int result = wishListRepository.delete(findWish.getId());
		if(result == 0) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	/**
	  * @Method Name : deleteById
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : id로 wishList 삭제
	  */
	@Transactional
	public int deleteById(Integer id) {
		return wishListRepository.delete(id);
	}
	
	/**
	  * @Method Name : readWishListByUserIdAndProductId
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 상품 이름과 사용자 ID로 장바구니 조회
	  */
	public WishList readWishListByUserIdAndProductId (Integer userId, Integer productId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("productId", productId);
		WishList findWish = wishListRepository.findwishByProductIdAndUserId(map);
		return findWish;
	}
}
