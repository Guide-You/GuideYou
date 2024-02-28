/**
 * 
 */
package com.guideyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.guideyou.MarkerRequest;

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
	@GetMapping("/1map")
	public String mapPage() {
		return "/testMap";
	}
	
	@PostMapping("/map/save")
	public @ResponseBody String a(@RequestBody MarkerRequest markerRequest) {
		System.out.println("이거 탔잖아?");
		return "성공했다.";
	}
}
