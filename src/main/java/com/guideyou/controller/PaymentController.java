package com.guideyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.dto.payment.OrderDto;

import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : PaymentController.java
  * @Project : GuideYou
  * @Date : 2024. 2. 20. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제 관련 컨트롤러
  */

@Controller
@Slf4j
public class PaymentController {


	/**
	  * @Method Name : processOrder
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : detail 단일 product 정보 paymentPage로 redirect 할 method
	  */
	// TODO: DTO명 확인(2024.02.21 박경진)
	@PostMapping("/process-order")
	private String processOrder(Model model, OrderDto orderDto) {
		
		model.addAttribute("orderDto", orderDto);
		log.info("PaymentController order dto"+ orderDto);
		
		return "redirect:/payment";

	}
	
	  
	   
	   /**
	  * @Method Name : paymentPage
	  * @작성일 : 2024. 2. 20.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 페이지 호출
	  */
	// TODO: photo 정보 추후 받아 올 예정(2024.02.21 경진) 
	@GetMapping("/payment")
	private String paymentPage() {
	    // TODO: 상품 정보 및 결제 관련 데이터를 모델에 추가하여 결제 페이지로 전달합니다.
	    // 결제 페이지로 이동
	    return "/product/payment";
	}
	

}
