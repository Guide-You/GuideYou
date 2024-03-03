package com.guideyou.service.product.productLocation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guideyou.dto.product.location.ProductLocationSaveRspDTO;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.product.ProductLocation;
import com.guideyou.repository.interfaces.product.ProductLocationRepository;
import com.guideyou.utils.Define;

/**
 * @FileName : ProductLocationService.java
 * @Project : GuideYou
 * @Date : 2024. 2. 29.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 :
 */
@Service
public class ProductLocationService {
	@Autowired
	private ProductLocationRepository locationRepository;

	/**
	 * @Method Name : saveLocationList
	 * @작성일 : 2024. 2. 29.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 지도 리스트 처음 저장시 product_location 다중 insert
	 */
	@Transactional
	public int saveLocationList(List<ProductLocationSaveRspDTO> inputList, Integer productId) {
		int resultCount = 0;
		List<ProductLocationSaveRspDTO> updateList = new ArrayList<>();
		
		for (ProductLocationSaveRspDTO input : inputList) {
			if(input.getId() == null) {
				
				ProductLocation productLocation = ProductLocation.builder().productId(productId).lat(input.getLat())
						.lng(input.getLng()).placeName(input.getPlaceName()).roadAddressName(input.getRoadAddressName())
						.addressName(input.getAddressName()).phone(input.getPhone()).build();

				resultCount += locationRepository.insert(productLocation);
			} 
		}
		
		// insert문 확인
		if (resultCount != inputList.size()) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultCount;
	}

	/**
	 * @Method Name : readLocationList
	 * @작성일 : 2024. 2. 29.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 상품Id로 locationList_tb 조회
	 */
	public List<ProductLocation> readLocationListByProductId(Integer productId) {
		List<ProductLocation> result = locationRepository.findLocationByProductId(productId);
		return result;
	}

	/**
	 * @Method Name : readLocationListByProductIdAndLatLng
	 * @작성일 : 2024. 3. 1.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 상품 Id, 위도,경도 로 location_tb 조회
	 * @param inputLocation
	 * @return
	 */
	public ProductLocation readLocationListByProductIdAndLatLng(ProductLocation inputLocation) {
		Map<String, Object> map = new HashMap<>();
		map.put("productId", inputLocation.getProductId());
		map.put("lat", inputLocation.getLat());
		map.put("lng", inputLocation.getLng());
		ProductLocation resultLocation = locationRepository.findLocationByProductIdAndLatLng(map);

		return locationRepository.findLocationByProductIdAndLatLng(map);
	}
	
	
	/**
	  * @Method Name : updateLocation
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : update 저장 시 추가 - insert, 변경 없으면 날짜 update, 삭제 되었다면 delete
	  * @param updateList
	  * @param productId
	  * @return
	  */
	public int updateLocation(List<ProductLocationSaveRspDTO> updateList, Integer productId) {
		List<Integer> originList = locationRepository.findLocationByProductId(productId).stream().map(ProductLocation::getId).collect(Collectors.toList());

		int resultCount = 0;
		List<ProductLocationSaveRspDTO> updateLocationList = new ArrayList<>();
		
		for (ProductLocationSaveRspDTO update : updateList) {
			if(update.getId() == null) {
				ProductLocation productLocation = ProductLocation.builder().productId(productId).lat(update.getLat())
						.lng(update.getLng()).placeName(update.getPlaceName()).roadAddressName(update.getRoadAddressName())
						.addressName(update.getAddressName()).phone(update.getPhone()).build();

				resultCount += locationRepository.insert(productLocation);
			} else {
				updateLocationList.add(update);
			}
		}
	    
		List<Integer> updateIdList = updateLocationList.stream().map(ProductLocationSaveRspDTO::getId).collect(Collectors.toList());
		
		originList.removeAll(updateIdList);
		
		if(updateIdList.size() > 0) {
			resultCount =+ locationRepository.updateCreatedAtByIdList(updateIdList);
		}
		
	    Map<String, Object> map = new HashMap<>();
		map.put("productId", productId);
		map.put("idList", originList);
	    locationRepository.deleteLocationByIdList(map);
	    return resultCount;
	}
	
	public List<ProductLocation> readLocationByProductId(Integer productId) {
		return locationRepository.findLocationByProductId(productId);
	}
	

}
