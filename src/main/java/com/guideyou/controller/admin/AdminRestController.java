package com.guideyou.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.guideyou.dto.admin.AdminDto;
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
//	@GetMapping("/admin1/{selectedDateType}")
//	public AdminDto adminPage(@PathVariable String selectedDateType) {
//		System.out.println("사용자가 선택한 값: " + selectedDateType);
//		
//		AdminDto chartInfo = adminService.chartInformationList(selectedDateType);
//		
//		System.out.println("================chartInfo==================");
//		System.out.println(chartInfo);
//		System.out.println("==================================");
//		
//		return chartInfo;
//	}
}
