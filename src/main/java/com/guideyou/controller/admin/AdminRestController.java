package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.service.AdminService;

@RestController
public class AdminRestController {
	
	@Autowired
	private AdminService adminService;
	
	/**
	  * @Method Name : adminPage
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 관리자 메인 페이지 요청
	  */
	@GetMapping("/admin1/{selectedValue}")
	public List<ProductDto> adminPage(@PathVariable String selectedValue) {
		System.out.println("사용자가 선택한 값: " + selectedValue);
		
		if (selectedValue == null) {
			selectedValue = "1";
		}
		System.out.println("사용자가 선택한 값: " + selectedValue);
		// 24.02.29 인기 상품 정보 조회
		List<ProductDto> findProductInfo = adminService.selectProductList(selectedValue);
		System.out.println("================findProductInfo==================");
		System.out.println(findProductInfo);
		System.out.println("==================================");
		
		return findProductInfo;
	}
}
