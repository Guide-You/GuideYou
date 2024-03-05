package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.payment.PaymentHistoryListDto;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
import com.guideyou.dto.product.UploadProductsInfoDTO;
import com.guideyou.dto.user.SignUpDTO;
import com.guideyou.dto.user.UserDTO;
import com.guideyou.dto.wishList.WishListDTO;
import com.guideyou.dto.wishList.WishListProductUserDTO;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.entity.user.UserPhotos;
import com.guideyou.service.PaymentService;
import com.guideyou.service.ProductService;
import com.guideyou.service.UserService;
import com.guideyou.service.user.UserPhotosService;
import com.guideyou.service.wishListService.WishListService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
 * @FileName : UserController.java
 * @Project : GuideYou
 * @Date : 2024. 2. 18.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 로그인 및 사용자 컨트롤러 입니다.
 */
@Controller
@Slf4j
public class UserController {

	// service
	@Autowired
	private UserService userService;
	@Autowired
	private WishListService wishListService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserPhotosService userPhotosService; 
	

	@Autowired
	private HttpSession httpSession;
	
	/* -----------------------------------마이페이지 시작---------------------------------------------*/	
	
	/**
	  * @Method Name : logOut
	  * @작성일 : 2024. 2. 26.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 로그아웃 기능 - 메인화면으로 돌아감
	  */
	@GetMapping("/member/logout")
	public String logOut(HttpServletRequest request) {
		httpSession = request.getSession();
		httpSession.removeAttribute(Define.PRINCIPAL);
		httpSession.removeAttribute(Define.PRINCIPAL_PHOTO);
//		httpSession.invalidate();
		return "redirect:/main";
	}
	
	/**
	  * @Method Name : uploadListPage
	  * @작성일 : 2024. 2. 24.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 사용자 작성한 상품 목록 페이지
	  * @return
	  */
	@GetMapping("/member/uploadList")
	public String uploadListPage(PageReq pageReq, Model model) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(4); // 페이지 당 보여줄 개수
		}
		PageRes<UploadProductsInfoDTO> pageRes = productService.getUploadProductsInfoByUserId(pageReq, loginUser.getId());

		model.addAttribute("uploadProductsInfoList", pageRes.getContent());
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());
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
	@GetMapping("/member/purchasedList")
	public String purchasedListPage(PageReq pageReq, Model model) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(4); // 페이지 당 보여줄 개수
		}
		
		PageRes<PurchasedProductInfoDTO> pageRes = paymentService.getPurchasedProductInfoList(pageReq, loginUser.getId());

		model.addAttribute("purchasedProductInfoList", pageRes.getContent());
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());
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
	public String cartListPage(PageReq pageReq, Model model) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(4); // 페이지 당 보여줄 개수
		}
		
		PageRes<WishListProductUserDTO> pageRes = wishListService.findwishListProductUserByUserId(pageReq, loginUser.getId());
		model.addAttribute("wishListProductUserDTOList", pageRes.getContent());
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());
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
	public String profileUpdateProc(UserDTO userDTO, MultipartFile file) {
		User profileUpdateUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		profileUpdateUser.setNickname(userDTO.getNickname());
		profileUpdateUser.setPhone(userDTO.getPhone());
		
		int photoResult = userPhotosService.saveUserPhotos(profileUpdateUser, file);
		httpSession.removeAttribute(Define.PRINCIPAL_PHOTO);
		UserPhotos userPhotos = userPhotosService.readByUserId(profileUpdateUser.getId());
		httpSession.setAttribute(Define.PRINCIPAL_PHOTO, userPhotos);
		
		// 유저 업데이트 서비스 생성
		int result = userService.updateUserProfile(profileUpdateUser, userDTO);
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
	public @ResponseBody String checkDuplicateNickname(@RequestParam String nickname, @RequestParam Integer userId) {
		User user = userService.readUserByNickname(nickname);
		String result;
		if(user == null) {
			result = "Y";
		}
		else if(user.getId() == userId) {
			result = "Y";
		} else {
			result = "N";
		}
		return result;
	}

	/* ---------------------------------마이페이지 종료-----------------------------------------------*/	
	
	/**
	  * @Method Name : signUpProc
	  * @작성일 : 2024. 2. 21.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 회원가입 처리 메서드입니다.
	  * @return
	  */
	@PostMapping("/member/signUp")
	public String signUpProc(UserDTO userDTO, MultipartFile file) {
		User signUpUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		// 유저 업데이트 서비스 생성
		int photoResult = userPhotosService.saveUserPhotos(signUpUser, file);
		httpSession.removeAttribute(Define.PRINCIPAL_PHOTO);
		UserPhotos userPhotos = userPhotosService.readByUserId(signUpUser.getId());
		httpSession.setAttribute(Define.PRINCIPAL_PHOTO, userPhotos);
		int result = userService.updateUserProfile(signUpUser, userDTO);
		
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
		
		UserPhotos userPhotos = userPhotosService.readByUserId(user.getId());
		if(userPhotos == null) {
			userPhotos = new UserPhotos();
			userPhotos.setProfilePhoto(Define.DEFAULT_PHOTO_PATH);
			userPhotos.setUploadFileName(Define.DEFAULT_PHOTO);
		}
		httpSession.setAttribute(Define.PRINCIPAL_PHOTO, userPhotos);
		System.out.println("최장호 : " +httpSession.getAttribute(Define.PRINCIPAL_PHOTO).toString());
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
		
		UserPhotos userPhotos = userPhotosService.readByUserId(user.getId());
		if(userPhotos == null) {
			userPhotos = new UserPhotos();
			userPhotos.setProfilePhoto(Define.DEFAULT_PHOTO_PATH);
			userPhotos.setUploadFileName(Define.DEFAULT_PHOTO);
		}
		httpSession.setAttribute(Define.PRINCIPAL_PHOTO, userPhotos);
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
		UserPhotos userPhotos = userPhotosService.readByUserId(user.getId());
		if(userPhotos == null) {
			userPhotos = new UserPhotos();
			userPhotos.setProfilePhoto(Define.DEFAULT_PHOTO_PATH);
			userPhotos.setUploadFileName(Define.DEFAULT_PHOTO);
		}
		httpSession.setAttribute(Define.PRINCIPAL_PHOTO, userPhotos);
		httpSession.setAttribute(Define.PRINCIPAL, user);
		return "redirect:/main";
	}
	
	/**
	  * @Method Name : insertWishList
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 상품에서 wishList(하트) 클릭 시 호출 됨
	  */
	@GetMapping("/saveWishList")
	@ResponseBody
	public int insertWishList(@RequestParam Integer userId, @RequestParam Integer productId) {
		WishListDTO input = new WishListDTO();
		input.setUserId(userId);
		input.setProductId(productId);
		int result = wishListService.insert(input);
		return result;
	}
	
	/**
	  * @Method Name : deleteWishList
	  * @작성일 : 2024. 3. 5.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 상품에서 wishList(하트) 클릭 시 호출 됨
	  */
	@GetMapping("/deleteWishList")
	@ResponseBody
	public int deleteWishList(@RequestParam Integer userId, @RequestParam Integer productId) {
		WishListDTO input = new WishListDTO();
		input.setUserId(userId);
		input.setProductId(productId);
		int result = wishListService.delete(input);
		return result;
	}
	



	/**
	  * @Method Name : paymentHistoryListPage
	  * @작성일 : 2024. 3. 3.
	  * @작성자 : 박경진
	  * @변경이력 : 
	  * @Method 설명 : myPage PaymentHistoryListPage 출력
	  */
	@GetMapping("/member/paymentHistoryList")
	public String paymentHistoryListPage(PageReq pageReq, Model model) {
		User loginUser = (User)httpSession.getAttribute(Define.PRINCIPAL);
		log.info(""+loginUser);
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}
		log.info("controller if 1");

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(4); // 페이지 당 보여줄 개수
		}
		log.info("controller if 2");
		
		PageRes<PaymentHistoryListDto> pageRes = paymentService.getPaymentHistoryList(pageReq, loginUser.getId());

		log.info("controller if pageRes" + pageRes);
		
		model.addAttribute("PaymentHistoryList", pageRes.getContent());
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());
		return "user/userPaymentHistoryList";
	}
	
	
	
}