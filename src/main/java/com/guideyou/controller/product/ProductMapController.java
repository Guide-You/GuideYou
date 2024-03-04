/**
 * 
 */
package com.guideyou.controller.product;

import java.lang.reflect.Type;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.guideyou.dto.product.location.ProductLocationSaveRspDTO;
import com.guideyou.repository.entity.product.ProductLocation;
import com.guideyou.service.product.productLocation.ProductLocationService;

/**
  * @FileName : ProductMapController.java
  * @Project : GuideYou
  * @Date : 2024. 3. 3. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 상품의 지도 controller
  */
@Controller
public class ProductMapController {
	
	// service
	@Autowired
	private ProductLocationService productLocationService;
	
	
	
	/**
	  * @Method Name : mapPage
	  * @작성일 : 2024. 3. 1.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 지도에 마커 추가하는 페이지
	  * @return
	  */
	@GetMapping("/map/insert")
	public String mapPage() {
		return "/product/map/insertMap";
	}

	/**
	 * @Method Name : saveMarkers
	 * @작성일 : 2024. 2. 29.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 저장 버튼 클릭시 찍은 마커 저장되는 메소드
	 */
	@PostMapping("/map/save")
	@ResponseBody
	public List<ProductLocationSaveRspDTO> saveMarkers(@RequestBody String markers, @RequestParam Integer productId) {
		Gson gson = new Gson();
		Type type = new TypeToken<List<ProductLocationSaveRspDTO>>() {}.getType();
		List<ProductLocationSaveRspDTO> locationList = gson.fromJson(markers.toString(), type);
		productLocationService.saveLocationList(locationList, productId);
		return locationList;
	}
	
	/**
	  * @Method Name : readMapPage
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 저장된 지도 보여주는 페이지
	  */
	@GetMapping("/map/read")
	public String readMapPage(){
		return "/product/map/readMap";
	}
	
	/**
	  * @Method Name : readMapProc
	  * @작성일 : 2024. 3. 1.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : ajax_상품ID로 loaction_tb 조회해서 마커 추가하는 메서드
	  * @return
	  */
	@GetMapping("/map/readMap")
	@ResponseBody
		public List<ProductLocation> readMapProc(@RequestParam Integer productId){
		List<ProductLocation> productLocationList =  productLocationService.readLocationListByProductId(productId);
		
		return productLocationList;
	}
	
	/**
	  * @Method Name : updateMapPage
	  * @작성일 : 2024. 3. 1.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 지도 수정 화면 페이지
	  * @return
	  */
	@GetMapping("/map/update")
	public String updateMapPage() {
		return "/product/map/updateMap";
	}
	
	/**
	  * @Method Name : updateMarkers
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param markers
	  * @param productId
	  * @return
	  */
	@PostMapping("/map/update")
	@ResponseBody
	public List<ProductLocationSaveRspDTO> updateMarkers(@RequestBody String markers, @RequestParam Integer productId) {
		Gson gson = new Gson();
		Type type = new TypeToken<List<ProductLocationSaveRspDTO>>() {}.getType();
		List<ProductLocationSaveRspDTO> locationList = gson.fromJson(markers.toString(), type);
		productLocationService.updateLocation(locationList, productId);
		return locationList;
	}
}
