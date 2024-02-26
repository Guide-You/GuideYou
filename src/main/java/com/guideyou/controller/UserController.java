package com.guideyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.user.SignUpDTO;
import com.guideyou.dto.user.UserDTO;
import com.guideyou.dto.wishList.WishListProductUserDTO;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.User;
import com.guideyou.service.UserService;
import com.guideyou.service.wishListService.WishListService;
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
	private WishListService wishListService;
	
	

	@Autowired
	private HttpSession httpSession;
	
	/* ------------------------------------------------------------------------------------*/	
	
	/**
	  * @Method Name : uploadListPage
	  * @작성일 : 2024. 2. 24.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 작성한 상품 목록 페이지
	  * @return
	  */
	@GetMapping("/uploadList")
	public String uploadListPage() {
		return "user/userUploadList";
	}
	
	/**
	  * @Method Name : purchasedListPage
	  * @작성일 : 2024. 2. 24.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 구매한 목록 페이지
	  * @return
	  */
	@GetMapping("/perchasedList")
	public String purchasedListPage() {
		return "user/userPurchasedList";
	}
	
	/**
	  * @Method Name : cartListPage
	  * @작성일 : 2024. 2. 24.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 찜 목록 페이지
	  * @return
	  */
	@GetMapping("/member/cartList")
	public String cartListPage(Model model) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		List<WishListProductUserDTO> wishListProductUserDTOList = wishListService.findwishListProductUserByUserId(loginUser.getId());
		model.addAttribute("wishListProductUserDTOList", wishListProductUserDTOList);
		return "user/userCartList";
	}
	
	/**
	  * @Method Name : profilePage
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 프로필 화면 요청
	  */
	@GetMapping("/member/profile")
	public String profilePage() {
		return "user/userProfile";
	}

	/**
	  * @Method Name : profileUpdateProc
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 프로필 수정 처리
	  * @return
	  */
	@PostMapping("/member/profile")
	public String profileUpdateProc(UserDTO userDTO) {
		User profileUpdateUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		profileUpdateUser.setNickname(userDTO.getNickname());
		profileUpdateUser.setPhone(userDTO.getPhone());
		// 유저 업데이트 서비스 생성
		int result = userService.updateUserProfile(profileUpdateUser, userDTO);
		
		if(result != 1) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/member/profile";
	}
	
	/**
	  * @Method Name : checkDuplicateNickname
	  * @작성일 : 2024. 2. 22.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 nickname 중복체크
	  * @param nickname
	  * @return
	  */
	@PostMapping("/member/checkNickname")
	public @ResponseBody String checkDuplicateNickname(@RequestParam String nickname) {
		User user = userService.readUserByNickname(nickname);
		return (user == null) ? "Y" : "N";
	}
	
	/**
	  * @Method Name : signUpProc
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 회원가입 처리 메서드입니다.
	  * @return
	  */
	@PostMapping("/member/signUp")
	public String signUpProc(UserDTO userDTO) {
		User signUpUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		// 유저 업데이트 서비스 생성
		int result = userService.updateUserProfile(signUpUser, userDTO);
		
		if(result != 1) {
			throw new CustomRestfulException(Define.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/main";
	}
	
	/**
	 * @Method Name : userSignUpPage
	 * @작성일 : 2024. 2. 21.
	 * @작성자 : 최장호
	 * @변경이력 : 
	 * @Method 설명 : 최초 소셜 로그인한 사용자 회원가입 페이지 요청
	 */
	@GetMapping("/member/signUp")
	public String userSignUpPage() {
		return "user/userSignUp";
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
			userService.signUpProc(naverUser);
			User newUser = userService.readUserByNameAndPhone(naverUser.getName(), naverUser.getPhone());
			httpSession.setAttribute(Define.PRINCIPAL, newUser);
			return "redirect:/member/signUp";
		}
		httpSession.setAttribute(Define.PRINCIPAL, user);

		return "redirect:/main";
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
			userService.signUpProc(kakaoUser);
			User newUser = userService.readUserByNameAndPhone(kakaoUser.getName(), kakaoUser.getPhone());
			httpSession.setAttribute(Define.PRINCIPAL, newUser);
			return "redirect:/member/signUp";
		}
		
		
		httpSession.setAttribute(Define.PRINCIPAL, user);
		return "redirect:/main";
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
				userService.signUpProc(googleUser);
				User newUser = userService.readUserByNameAndPhone(googleUser.getName(), googleUser.getPhone());
				httpSession.setAttribute(Define.PRINCIPAL, newUser);
				return "redirect:/member/signUp";
			}
		}
		
		httpSession.setAttribute(Define.PRINCIPAL, user);
		return "redirect:/main";
	}
}