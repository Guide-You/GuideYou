package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	/**
	  * @Method Name : adminPage
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : 관리자 메인 페이지 요청
	  */
	@GetMapping("/admin")
	public String adminPage(Model model) {
		
		
		// 24.02.29 최신 게시물 조회
		List<ProductDto> findInfo = adminService.findLatestPosts();
		model.addAttribute("findInfo", findInfo);
		
		// 24.02.29 인기 상품 정보 조회
		List<ProductDto> findProductInfo = adminService.findProductInfo();
		model.addAttribute("findProductInfo", findProductInfo);
		
		// 24.03.03 날짜 검색 기능
//		List<ProductDto> selectDateType = adminService.selectProductList(selectedValue);
//		model.addAttribute("selectDateType", selectDateType);
		
		// 24.03.03 판매 된 상품 개수 조회
		AdminDto selectPayment = adminService.selectPaymentInfo();
		model.addAttribute("selectPayment", selectPayment);
		
		// 24.03.03 판매 된 상품 총액 조회
		AdminDto selectTotalPrice = adminService.selectTotalPriceInfo();
		model.addAttribute("selectTotalPrice", selectTotalPrice);
		
		// 24.03.03 가입자 수 조회
		AdminDto selectTotalUser = adminService.selectTotalUserInfo();
		model.addAttribute("selectTotalUser", selectTotalUser);
		
		// 24.03.03 게시글 조회
		List<BoardDto> selectBoardList = adminService.selectBoardList();
		model.addAttribute("selectBoardList", selectBoardList);
		

		
		return "/admin/adminIndex";
	}
}
