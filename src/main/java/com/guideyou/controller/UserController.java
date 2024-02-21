package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/* ------------------------------------------------------------------------------------*/	
	/**
	  * @Method Name : test
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : test중
	  * @return
	  */
	@GetMapping("/testUser")
	public String test() {
		return "user/test_userSignUp";
	}

	@GetMapping("/testUser1")
	@ResponseBody
	public String test1() {
		System.out.println("이거 탔지?");
		return "main";
	}
/* ------------------------------------------------------------------------------------*/	

	/**
	 * @Method Name : loginPage
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 로그인 페이지 요청
	 * @return
	 */
	@GetMapping("/signIn")
	public String loginPage() {
		return "user/test_signIn";
	}
	
	/**
	  * @Method Name : userSignUpPage
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 회원가입 페이지 요청
	  */
	@GetMapping("/userSignUp")
	public String userSignUpPage() {
		return "user/test_userSignUp";
	}


	/**
	 * @Method Name : signUpProc
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 사용자 회원가입 처리
	 * @param signUpDTO
	 */
	public void signUpProc(SignUpDTO signUpDTO) {
		userService.signUpProc(signUpDTO);
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
		SignUpDTO naverUser = userService.signInProcByNaver(code, state);

		User user = userService.readUserByNameAndPhone(naverUser.getName(), naverUser.getPhone());
		if (user == null) {
			// 회원가입
			signUpProc(naverUser);
			User newUser = userService.readUserByNameAndPhone(naverUser.getName(), naverUser.getPhone());
			httpSession.setAttribute(Define.PRINCIPAL, newUser);
			return "redirect:/userSignUp";
		}
		httpSession.setAttribute(Define.PRINCIPAL, naverUser);

		return "main";
	}
	
	/**
	  * @Method Name : kakaoLoginPage
	  * @작성일 : 2024. 2. 19.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 카카오 로그인 api 요청
	  */
	@GetMapping("/login/kakao")
	public String kakaoLoginPage() {
		String kakaoLoginUrl = userService.kakaoLoginUrl();
		return "redirect:" + kakaoLoginUrl;
	}
	
	/**
	  * @Method Name : signInProcByKakao
	  * @작성일 : 2024. 2. 19.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 카카오 로그인 처리
	  */
	@GetMapping("/login/oauth2/code/kakao")
	public String signInProcByKakao (@RequestParam String code) {
		SignUpDTO kakaoUser = userService.signInProcByKakao(code, null);
		
		User user = userService.readUserByNameAndPhone(kakaoUser.getName(), kakaoUser.getPhone());
		if (user == null) {
			// 회원가입
			signUpProc(kakaoUser);
			User newUser = userService.readUserByNameAndPhone(kakaoUser.getName(), kakaoUser.getPhone());
			httpSession.setAttribute(Define.PRINCIPAL, newUser);
			return "redirect:/userSignUp";
		}
		
		
		httpSession.setAttribute(Define.PRINCIPAL, user);
		return "main";
	}
	
	
	/**
	  * @Method Name : googleLoginPage
	  * @작성일 : 2024. 2. 19.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 구글 로그인 api 요청
	  */
	@GetMapping("/login/google")
	public String googleLoginPage() {
		String googleLoginUrl = userService.googleLoginUrl();
		return "redirect:" + googleLoginUrl;
	}
	
	/**
	  * @Method Name : signInProcByGoogle
	  * @작성일 : 2024. 2. 19.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 구글 로그인 처리
	  */
	@GetMapping("/login/oauth2/code/google")
	public String signInProcByGoogle(@RequestParam String code) {
		SignUpDTO googleUser = userService.signInProcByGoogle(code);
		
		User user = userService.readUserByNameAndPhone(googleUser.getName(), googleUser.getPhone());
		if(user == null) {
			// 구글은 전화번호가 필수가 아니므로 이메일로 한번 더 확인
			user = userService.readUserByNameAndEmail(googleUser.getName(), googleUser.getEmail());
			if (user == null) {
				// 회원가입
				signUpProc(googleUser);
				User newUser = userService.readUserByNameAndPhone(googleUser.getName(), googleUser.getPhone());
				httpSession.setAttribute(Define.PRINCIPAL, googleUser);
				return "redirect:/userSignUp";
			}
		}
		
		httpSession.setAttribute(Define.PRINCIPAL, googleUser);
		return "main";
	}
}