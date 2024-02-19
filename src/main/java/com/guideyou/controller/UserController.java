package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guideyou.dto.user.SignUpDTO;
import com.guideyou.repository.entity.User;
import com.guideyou.service.UserService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

/**
 * @FileName : UserController.java
 * @Project : GuideYou
 * @Date : 2024. 2. 18.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 로그인 및 사용자 컨트롤러 입니다.
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession httpSession;

	/**
	 * @Method Name : loginPage
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 로그인 페이지 요청
	 * @return
	 */
	@GetMapping("/sign_in")
	public String loginPage() {
		return "user/sign_in";
	}

	/**
	 * @Method Name : signUpProc
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 사용자 회원가입 처리
	 * @param signUpDTO
	 */
	public int signUpProc(SignUpDTO signUpDTO) {
		return userService.signUpProc(signUpDTO);
	}

	/**
	 * @Method Name : naverLoginPage
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 네이버 로그인 api 요청
	 * @return
	 */
	@GetMapping("/login/naver")
	public String naverLoginPage() {
		String naverLoginUrl = userService.naverLoginUrl();
		return "redirect:" + naverLoginUrl;
	}

	/**
	 * @Method Name : signInProcByNaver
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 네이버로 로그인/회원가입 처리
	 * @param code
	 * @param state
	 * @return
	 */
	@GetMapping("/login/oauth2/code/naver")
	public String signInProcByNaver(@RequestParam String code, @RequestParam String state) {
		User user = userService.signInProcByNaver(code, state);

		/*  todo  첫 가입자면 작성하는 화면 요청 
		 * if(result == 1) { comment 작성하는 화면 호출 }
		 * else {메인화면 호출}
		 */
		httpSession.setAttribute(Define.PRINCIPAL, user);
		return "user/user";
	}
}