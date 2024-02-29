package com.guideyou.service.product.productLocation;

import java.util.ArrayList;
import java.util.List;

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
	  * @Method 설명 : 지도 리스트 저장 시 product_location 다중 insert
	  */
	@Transactional
	public int saveLocationList(List<ProductLocationSaveRspDTO> inputList) {
		List<ProductLocation> resultList = new ArrayList<>();
		for(ProductLocationSaveRspDTO input : inputList) {
			ProductLocation productLocation = ProductLocation.builder()
					.lat(input.getLat())
					.lng(input.getLng())
					.placeName(input.getPlaceName())
					.roadAddressName(input.getRoadAddressName())
					.addressName(input.getAddressName())
					.phone(input.getPhone())
					.build();
			resultList.add(productLocation);
		}
		int resultCount = 0;
		for(ProductLocation result : resultList) {
			result.setProductId(1); // TODO : 삭제해야함!
			System.out.println("최장호 : " + result.toString());
			 resultCount += locationRepository.insert(result);
		}
		// insert문 확인
		if(resultCount != resultList.size()) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultCount;
	}

	/**
	  * @Method Name : readLocationList
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 :
	  */
	public List<ProductLocation> readLocationList(Integer productId) {
		 List<ProductLocation> result = locationRepository.findLocationByProductId(productId);
		return result;
	}
	
}
