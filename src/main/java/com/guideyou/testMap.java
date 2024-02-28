package com.guideyou;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
  * @FileName : testMap.java
  * @Project : GuideYou
  * @Date : 2024. 2. 27. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 맵 테스트
  */
@Controller
public class testMap {
	
	@GetMapping("/map")
	public String mapPage() {
		return "/test_map";
	}
	
	@GetMapping("/map2")
	public String mapPage2() {
		return "/test_map2";
	}
	@GetMapping("/map3")
	public String mapPage3() {
		return "/test_map3";
	}
	@GetMapping("/map4")
	public String mapPage4() {
		return "/test_map4";
	}
	@GetMapping("/map5")
	public String mapPage5() {
		return "/test_map5";
	}
	@GetMapping("/map6")
	public String mapPage6() {
		return "/test_map6";
	}
	@GetMapping("/map7")
	public String mapPage7() {
		return "/test_map7";
	}
	@GetMapping("/map8")
	public String mapPage8() {
		return "/test_map8";
	}
	@GetMapping("/map9")
	public String mapPage9() {
		return "/test_map9";
	}
	@GetMapping("/map10")
	public String mapPage10() {
		return "/test_map10";
	}
}
