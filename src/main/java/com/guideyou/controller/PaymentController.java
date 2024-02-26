package com.guideyou.controller;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.guideyou.dto.ProductDto;
import com.guideyou.dto.payment.OrderDto;
import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.repository.entity.User;
import com.guideyou.service.PaymentService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;
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
	  
	  @Autowired
	  private HttpSession session;

	  @Autowired
	  private PaymentService paymentService;
	  
	   /**
	  * @Method Name : paymentPage
	  * @작성일 : 2024. 2. 20.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 페이지 호출
	  */
	// TODO: 결제 processOrder 이후 payment페이지 이동 -> 해당 method 삭제
	@GetMapping("/payment")
	private String paymentPage() {
		
	    return "/product/payment";
	}
	
	/**
	  * @Method Name : processOrder
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : detail 단일 product 정보 paymentPage로 redirect 할 method
	  */
	// 
	@PostMapping("/processOrder")
	private String processOrder(Model model, OrderDto orderDto) {
		
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		orderDto.setOrderUserId(principal.getId());
		model.addAttribute("order", orderDto);
		
		return "/product/payment";

	}

	
	/**
	  * @Method Name : paySuccess
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : kakaopay 결제 성공 시 넘어 올 jsonData를 받아 db에 insert
	  */
	@PostMapping("/paySuccess")
	private String createPayment(PaymentDto paymentDto) {
		
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		paymentService.createPayment(paymentDto);
		log.info("PaymentController payment dto : "+paymentDto.toString());
		
		return "/user/userPurchasedList";

	}

}
