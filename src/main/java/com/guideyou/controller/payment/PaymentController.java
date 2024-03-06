package com.guideyou.controller.payment;

import java.io.Console;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.guideyou.dto.payment.OrderDto;
import com.guideyou.dto.payment.PaymentCompleteDto;
import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.payment.RefundDto;
import com.guideyou.dto.payment.portone.PaymentReqDto;
import com.guideyou.dto.payment.portone.PaymentTokenDto;
import com.guideyou.dto.payment.portone.PaymentVerificationDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.entity.User;
import com.guideyou.service.PaymentService;
import com.guideyou.service.ProductService;
import com.guideyou.utils.Define;
import com.guideyou.utils.NullUtils;
import com.mysql.cj.log.Log;

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
	  @Autowired
	  private ProductService productService;
	  
	   /**
	  * @Method Name : paymentPage
	  * @작성일 : 2024. 2. 20.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 페이지 호출
	  */
	// TODO: 결제 processOrder 이후 payment페이지 이동 -> 해당 method 삭제
	@GetMapping("/payment")
	public String paymentPage() {
		
	    return "product/payment";
	}
	
	/**
	  * @Method Name : processOrder
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : detail 단일 product 정보 paymentPage로 redirect 할 method
	  */
	// 
	@GetMapping("/order")
	public String processOrder(Model model, OrderDto orderDto) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
	    if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}
		
		orderDto.setOrderUserId(principal.getId()); // 구매자 id
		model.addAttribute("order", orderDto);	

		System.out.println(orderDto);
		
		return "product/order";

	}

	
	/**
	  * @Method Name : getData
	  * @작성일 : 2024. 3. 2.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 포트원 결제 정보조회 및 토큰 가져오기, db insert
	  */
	@PostMapping("/paySuccess") //ResponseEntity<?>  리턴타입 변경
	public ResponseEntity<?> getData(@RequestBody PaymentDto paymentDto){
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
	    if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}
	    
		log.info("paySuccess in!!");
		log.info("payment DTO : "+paymentDto);
		RestTemplate restTemplate = new RestTemplate();
		
		// 토큰 가져오기
		// Request Header 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		
		// Request Body 설정
		JSONObject requestBody = new JSONObject();
		requestBody.put("imp_key", Define.PAYMENT_IMP_KEY);
		requestBody.put("imp_secret",Define.PAYMENT_IMP_SECRET);
	
		// Header + Body
		HttpEntity entity = new HttpEntity(requestBody.toString(),headers);
		
		// API 호출
		ResponseEntity<PaymentTokenDto> reqToken = restTemplate
				.exchange("https://api.iamport.kr/users/getToken", 
							HttpMethod.POST, 
							entity, 
							PaymentTokenDto.class
						);
	
		String token = reqToken.getBody().getResponse().accessToken;
		
		log.info("토큰 정보 : "+ token);
		
		// 포트원에 결제 정보 조회 
		// Request Header 설정
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", token);
		HttpEntity entity2 = new HttpEntity(headers2);
		
		// API 호출
		ResponseEntity<PaymentReqDto> reqData = restTemplate
				.exchange("https://api.iamport.kr/payments/find/" + paymentDto.getMerchantUid(),
			                HttpMethod.GET, 
			                entity2, 
			                PaymentReqDto.class
			              );
		log.info("reqData : "+ reqData.getBody().getResponse());
		PaymentVerificationDto verificationDto = new PaymentVerificationDto(); 
		// 결제 사후 검증 
		String verificationMerchantUid= reqData.getBody().getResponse().merchantUid;
		log.info("verificationMerchantUid"+verificationMerchantUid);
				
		if (verificationMerchantUid.equals(paymentDto.getMerchantUid())) {
			log.info("여기는 검증까지 완료되어서 payment Dto로 insert 할 정보입니다" , paymentDto);
			//Payment paymentReturn= 
			paymentService.createPayment(paymentDto);
			
			log.info("payment service 성공하고 왔다!");
			
			 return ResponseEntity.ok("success"); 
		} else {
		
		// 검증이 잘못 됐을시 환불 처리
		// Request Header
		HttpHeaders headers3 = new HttpHeaders();
		headers3.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers3.add("Authorization", token);
		
		// Requst Body
		MultiValueMap<String, String> param = new LinkedMultiValueMap();
		param.add("merchant_uid", paymentDto.getMerchantUid());
		
		// 헤더 + Body 결합
		HttpEntity<MultiValueMap<String, String>> entity3 = new HttpEntity<>(param, headers3);
		
		// API 호출
		ResponseEntity<String> refund = restTemplate
				.exchange(
					"https://api.iamport.kr/payments/cancel", 
					HttpMethod.POST,
					entity3,
					String.class
				);
		log.info("refund" ,refund);}
		
		return null; 
	}	

	/**
	  * @Method Name : refund
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 환불
	  */
	@PostMapping("/refund")
	public void refund(@RequestBody RefundDto refundDto) {
		
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
	    if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}
	    
		log.info("refund controller in!");
		log.info("refundDto : "+ refundDto);
		
		// 세션 로그인 정보와 payment에 등록된 userId가 같아야 로직 시작
		Integer userId = principal.getId();
		log.info("merchantUid = "+refundDto.getMerchantUid() + "userId = "+userId);
		int paymentChk = paymentService.findByMerchantUidAndUserId(refundDto.getMerchantUid(), userId);
		
		log.info("paymentChk:" + paymentChk);
		if (paymentChk != 0) {
			
			log.info("paymentChk != null (db에 merchantUid와 userId로 비교해서 값이 있으면) 실행");
			
			// 1. 포트원 결제 정보 조회
			RestTemplate restTemplate = new RestTemplate();
			
			// 토큰 가져오기
			// Request Header 설정
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			
			
			// Request Body 설정
			JSONObject requestBody = new JSONObject();
			requestBody.put("imp_key", Define.PAYMENT_IMP_KEY);
			requestBody.put("imp_secret",Define.PAYMENT_IMP_SECRET);
		
			// Header + Body
			HttpEntity entity = new HttpEntity(requestBody.toString(),headers);
			
			// API 호출
			ResponseEntity<PaymentTokenDto> reqToken = restTemplate
					.exchange("https://api.iamport.kr/users/getToken", 
								HttpMethod.POST, 
								entity, 
								PaymentTokenDto.class
							);
		
			String token = reqToken.getBody().getResponse().accessToken;
			
			log.info("refund 토큰 정보 : "+ token);
			
			// 결제 정보 조회 
			// Request Header 설정
			HttpHeaders headers2 = new HttpHeaders();
			headers2.add("Authorization", token);
			HttpEntity entity2 = new HttpEntity(headers2);
			
			// API 호출
			ResponseEntity<PaymentReqDto> reqData = restTemplate
					.exchange("https://api.iamport.kr/payments/find/" + refundDto.getMerchantUid(),
				                HttpMethod.GET, 
				                entity2, 
				                PaymentReqDto.class
				              );
			log.info("refund 포트원 결제 정보 reqData : "+ reqData.getBody().getResponse());
			
			// 결제 내역 검증
			PaymentVerificationDto verificationDto = new PaymentVerificationDto(); 
			String verificationMerchantUid= reqData.getBody().getResponse().merchantUid;
			log.info(verificationMerchantUid);
			
			// 만약 클라이언트에 merchantUid와 refundDto로 들어온 merchantUid가 같다면
			// 클라이언트 서버에 취소 요청
			if(verificationMerchantUid.equals(refundDto.getMerchantUid())) {
				
				// 2. 아임포트 서버에 취소 요청
				// Request Header
				HttpHeaders headers3 = new HttpHeaders();
				headers3.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
				headers3.add("Authorization", token);
				
				// Request Body
				MultiValueMap<String, String> param = new LinkedMultiValueMap();
				param.add("merchant_uid", refundDto.getMerchantUid());
				
				// 헤더 + Body 결합
				HttpEntity<MultiValueMap<String, String>> entity3 = new HttpEntity<>(param, headers3);
				
				// API 호출
				ResponseEntity<String> refund = restTemplate
						.exchange(
							"https://api.iamport.kr/payments/cancel", 
							HttpMethod.POST,
							entity3,
							String.class
						);
				log.info("refund" ,refund);
				
				// 3. db에 환불 결과 저장
				paymentService.updatePaymentOnRefund(refundDto);
				
			}
			
			// TODO : 환불 클라이언트, DB 모두 완료 -> 이후에 어떻게 처리할건지 고민해보기!
		}
	}
	
	/**
	  * @Method Name : completePage
	  * @작성일 : 2024. 2. 29.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : 결제 완료 후 completePage(단건)
	  */
	// TODO: 다중으로 변경하자!
	@GetMapping("/complete/{merchantUid}")
	public String completePage(@PathVariable("merchantUid") String merchantUid, Model model) {
		
		log.info("completePage start");
		log.info("merchantUid : "+merchantUid);
		
		PaymentCompleteDto complete = paymentService.findAllPaymentInfoByMerchantUid(merchantUid);
		model.addAttribute("complete",complete);
		
		return "product/complete";

	}
	
	
	/**
	  * @Method Name : paymentChk
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : product 구매 시 구매내역 체크 및 본인 product 구매 X , productDetail의 구매 버튼, review 글쓰기 버튼에서 사용
	  */
	@GetMapping("/paymentChk")
	public void paymentChk() {
		// TODO : ProductDetailPage 에서 구매하기 버튼 클릭시 
		// 		productId 조회해서 구매내역있는지 확인 후 구매 이력 알려주기(20240303)
		// 코드 재사용 할거양!
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 세션 로그인 정보와 payment에 등록된 userId가 같아야 로직 시작
		//Integer userId = principal.getId();
		//Payment paymentChk = paymentService.findByMerchantUidAndUserId(refundDto.getMerchantUid(),userId);
		
		
	}

}
;