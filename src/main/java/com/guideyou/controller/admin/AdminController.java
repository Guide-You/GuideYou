package com.guideyou.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.guideyou.dto.admin.AdminDto;
import com.guideyou.dto.admin.BoardDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.service.AdminService;
import org.springframework.web.bind.annotation.RequestParam;


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
	public String adminPage(Model model, @RequestParam(required = false, defaultValue = "1") int dateType) {
		
		// 24.02.29 최신 게시물 조회		
		 List<ProductDto> productList = null;
		    
		    switch (dateType) {
		        case 1: // 오늘
		            productList = adminService.findLatestPostsD();
		            break;
		        case 2: // 이번 달
		            productList = adminService.findLatestPostsM();
		            break;
		        case 3: // 올해
		            productList = adminService.findLatestPostsY();
		            break;
		        default:
		            productList = adminService.findLatestPostsD(); // 기본값은 오늘로 설정
		            break;
		    }
		    
		    model.addAttribute("productList", productList);
		
		
		
		// 24.02.29 인기 상품 정보 조회		
		List<ProductDto> productList2 = null;
		
		 switch (dateType) {
	        case 1: // 오늘
	            productList2 = adminService.findProductInfoD();
	            break;
	        case 2: // 이번 달
	            productList2 = adminService.findProductInfoM();
	            break;
	        case 3: // 올해
	            productList2 = adminService.findProductInfoY();
	            break;
	        default:
	            productList2 = adminService.findProductInfoD(); // 기본값은 오늘로 설정
	            break;
	    }
		
		model.addAttribute("productList2", productList2);
		
		
		// 24.03.03 판매 된 상품 개수 조회
		AdminDto productList3 = null;
		
		switch (dateType) {
	        case 1: // 오늘
	            productList3 = adminService.selectPaymentInfoD();
	            break;
	        case 2: // 이번 달
	            productList3 = adminService.selectPaymentInfoM();
	            break;
	        case 3: // 올해
	            productList3 = adminService.selectPaymentInfoY();
	            break;
	        default:
	            productList3 = adminService.selectPaymentInfoD(); // 기본값은 오늘로 설정
	            break;
			}
		
		model.addAttribute("productList3", productList3);
		
		
		// 24.03.03 판매 된 상품 총액 조회
		AdminDto productList4 = null;
		
		switch (dateType) {
	        case 1: // 오늘
	        	productList4 = adminService.selectTotalPriceInfoD();
	            break;
	        case 2: // 이번 달
	        	productList4 = adminService.selectTotalPriceInfoM();
	            break;
	        case 3: // 올해
	        	productList4 = adminService.selectTotalPriceInfoY();
	            break;
	        default:
	        	productList4 = adminService.selectTotalPriceInfoD(); // 기본값은 오늘로 설정
	            break;
			}
		
		model.addAttribute("productList4", productList4);
		
		
		// 24.03.03 가입자 수 조회
		AdminDto productList5 = null;
		
		switch (dateType) {
	        case 1: // 오늘
	        	productList5 = adminService.selectTotalUserInfoD();
	            break;
	        case 2: // 이번 달
	        	productList5 = adminService.selectTotalUserInfoM();
	            break;
	        case 3: // 올해
	        	productList5 = adminService.selectTotalUserInfoY();
	            break;
	        default:
	        	productList5 = adminService.selectTotalUserInfoD(); // 기본값은 오늘로 설정
	            break;
			}
		
		model.addAttribute("productList5", productList5);
		
		
		
		// 24.03.03 게시글 조회
		List<BoardDto> productList6 = null;
		
		switch (dateType) {
	        case 1: // 오늘
	        	productList6 = adminService.selectBoardListD();
	            break;
	        case 2: // 이번 달
	        	productList6 = adminService.selectBoardListM();
	            break;
	        case 3: // 올해
	        	productList6 = adminService.selectBoardListY();
	            break;
	        default:
	        	productList6 = adminService.selectBoardListD(); // 기본값은 오늘로 설정
	            break;
			}
		
		model.addAttribute("productList6", productList6);
		

		// 24.03.03 날짜 검색 기능
				List<ProductDto> selectDateType = adminService.selectProductList();
				model.addAttribute("selectDateType", selectDateType);
		return "/admin/adminIndex";
	}
			
}
