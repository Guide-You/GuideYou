/**
 * 
 */
package com.guideyou.controller;

import java.lang.reflect.Type;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.guideyou.dto.product.location.ProductLocationSaveRspDTO;
import com.guideyou.repository.entity.product.ProductLocation;
import com.guideyou.service.product.productLocation.ProductLocationService;

/**
 * @FileName : testMapController.java
 * @Project : GuideYou
 * @Date : 2024. 2. 27.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 :
 */
@Controller
public class testMapController {
	
	// service
	@Autowired
	private ProductLocationService productLocationService;
	
	
	
	@GetMapping("/1map")
	public String mapPage() {
		return "/testMap";
	}

	/**
	 * @Method Name : saveMarkers
	 * @작성일 : 2024. 2. 29.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 :
	 */
	@PostMapping("/map/save")
	public @ResponseBody List<ProductLocationSaveRspDTO> saveMarkers(@RequestBody String markers) {
		Gson gson = new Gson();
		Type type = new TypeToken<List<ProductLocationSaveRspDTO>>() {
		}.getType();
		List<ProductLocationSaveRspDTO> locationList = gson.fromJson(markers.toString(), type);
		productLocationService.saveLocationList(locationList);
		return locationList;
	}
	
	/**
	  * @Method Name : readMapPage
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : db에서 맵
	  */
	@GetMapping("/map/read")
	public String readMapPage(Model model){
		Integer productId = 1;
		List<ProductLocation> productLocationList =  productLocationService.readLocationList(productId);
		
		model.addAttribute("locationInfoList", productLocationList);
		return "/readMap";
	}
	
	@GetMapping("/map/readMap")
	@ResponseBody
	public List<ProductLocation> readMapProc(){
		Integer productId = 1;
		List<ProductLocation> productLocationList =  productLocationService.readLocationList(productId);
		
		return productLocationList;
	}
}
