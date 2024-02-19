package com.guideyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.guideyou.config.GoogleConfig;
import com.guideyou.config.KakaoConfig;
import com.guideyou.config.NaverConfig;
import com.guideyou.dto.oauth.kakao.KakaoProfileRespDTO;
import com.guideyou.dto.oauth.kakao.KakaoTokenRespDTO;
import com.guideyou.dto.oauth.naver.NaverProfileRespDTO;
import com.guideyou.dto.oauth.naver.NaverTokenRespDTO;
import com.guideyou.dto.user.SignUpDTO;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.interfaces.user.UserRepository;

/**
 * @FileName : UserService.java
 * @Project : GuideYou
 * @Date : 2024. 2. 18.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : UserService
 */
@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private NaverConfig naverConfig;
	@Autowired
	private GoogleConfig googleConfig;
	@Autowired
	private KakaoConfig kakaoConfig;

	/**
	 * @Method Name : signUpProc
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 사용자 회원가입 처리
	 * @param signUpDTO
	 * @return
	 */
	public int signUpProc(SignUpDTO signUpDTO) {
		User user = User.builder().id(null).name(signUpDTO.getName()).nickname(signUpDTO.getNickname())
				.gender(signUpDTO.getGender()).email(signUpDTO.getEmail()).phone(signUpDTO.getPhone())
				.comment(signUpDTO.getComment()).createdAt(null).build();

		int result = userRepository.insert(user);

		if (result == 1) {
			return result;
		} else {
			// todo 익셉션 개발되면 넣어야함
			// throw new Exception();
			return 0;
		}
	}

	/**
	 * @Method Name : naverLoginUrl
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 네이버 로그인 요청 URL
	 * @return
	 */
	public String naverLoginUrl() {
		String naverLoginUrl = String.format("%s?response_type=code&client_id=%s&state=STATE_STRING&redirect_uri=%s",
				naverConfig.getNaverAuthorizationUri(), naverConfig.getNaverClientId(),
				naverConfig.getNaverRedirectUri());
		return naverLoginUrl;
	}

	/**
	 * @Method Name : signInProcByNaver
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 네이버를 통한 로그인
	 * @param code
	 * @param state
	 * @return
	 */
	public User signInProcByNaver(String code, String state) {
		RestTemplate restTemplate = new RestTemplate();

		// 토큰 요청 url
		String navertokenUrl = String.format("%s?grant_type=%s&client_id=%s&client_secret=%s&code=%s&state=%s",
				naverConfig.getNaverTokenUri(), naverConfig.getNaverTokenGrantType(), naverConfig.getNaverClientId(),
				naverConfig.getNaverClientSecret(), code, state);

		// 토큰 요청 헤더
		HttpHeaders tokenReqHeaders = new HttpHeaders();
		HttpEntity<MultiValueMap<String, String>> tokenReqMsg = new HttpEntity<>(tokenReqHeaders);

		// 프로필 정보 가져오기 위한 토큰 응답 결과
		ResponseEntity<NaverTokenRespDTO> tokenRespResult = restTemplate.exchange(navertokenUrl, HttpMethod.POST,
				tokenReqMsg, NaverTokenRespDTO.class);

		// 프로필 정보 가져오기 위한 access토큰 값
		String accessToken = tokenRespResult.getBody().getAccessToken();

		// 프로필 요청 헤더
		HttpHeaders profileReqHeaders = new HttpHeaders();
		profileReqHeaders.add("Authorization", "Bearer " + accessToken);

		HttpEntity<MultiValueMap<String, String>> profileReqMsg = new HttpEntity<>(profileReqHeaders);

		ResponseEntity<NaverProfileRespDTO> profileRespResult = restTemplate.exchange(naverConfig.getNaverProfileUri(),
				HttpMethod.POST, profileReqMsg, NaverProfileRespDTO.class);

		// 네이버에서 받아온 사용자 프로필 정보
		NaverProfileRespDTO profileResult = profileRespResult.getBody();
		
		SignUpDTO signUpDTO = SignUpDTO.builder().name(profileResult.getResponse().getName())
				.nickname(profileResult.getResponse().getNickname()).gender(profileResult.getResponse().getGender())
				.email(profileResult.getResponse().getEmail()).phone(profileResult.getResponse().getMobile())
				.comment(null).build();

		// 네이버 사용자 정보로 db조회
		User user = readUserByNameAndPhone(signUpDTO.getName(), signUpDTO.getPhone());
		if (user == null) {
			// 회원가입
			signUpProc(signUpDTO);
			User newUser = readUserByNameAndPhone(signUpDTO.getName(), signUpDTO.getPhone());
			return newUser;
		}

		return user;
	}

	/**
	 * @Method Name : readUserByNameAndPhone
	 * @작성일 : 2024. 2. 18.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 이름과 전화번호로 사용자 조회
	 * @param name
	 * @param phone
	 * @return
	 */
	public User readUserByNameAndPhone(String name, String phone) {
		return userRepository.findByNameAndPhone(name, phone);
	}

	/**
	 * @Method Name : kakaoLoginUrl
	 * @작성일 : 2024. 2. 19.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 카카오 로그인 요청 URL
	 */
	public String kakaoLoginUrl() {
		String kakaoLoginUrl = String.format("%s?response_type=code&client_id=%s&redirect_uri=%s",
				kakaoConfig.getKakaoAuthorizationUri(), kakaoConfig.getKakaoClientId(),
				kakaoConfig.getKakaoRedirectUri());
		return kakaoLoginUrl;
	}

	/**
	 * @Method Name : signInProcByKakao
	 * @작성일 : 2024. 2. 19.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 카카오를 통한 로그인
	 */
	public User signInProcByKakao(String code, String state) {

		RestTemplate restTemplate = new RestTemplate();
		// 헤더 구성
		HttpHeaders tokenReqHeader = new HttpHeaders();
		tokenReqHeader.add("Content-Type", kakaoConfig.getKakaoContentType());
		// body 구성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", kakaoConfig.getKakaoGrantType());
		params.add("client_id", kakaoConfig.getKakaoClientId());
		params.add("redirect_uri", kakaoConfig.getKakaoRedirectUri());
		params.add("code", code);

		// 헤더 + body 결합
		HttpEntity<MultiValueMap<String, String>> tokenReqMsg = new HttpEntity<>(params, tokenReqHeader);

		// 토큰 응답 결과
		ResponseEntity<KakaoTokenRespDTO> tokenRspResult = restTemplate.exchange(kakaoConfig.getKakaoTokenUri(), HttpMethod.POST,
				tokenReqMsg, KakaoTokenRespDTO.class);
		
		// 토큰으로 프로필 접근
		HttpHeaders profielReqHeader = new HttpHeaders();
		profielReqHeader.add("Authorization", "Bearer " + tokenRspResult.getBody().getAccessToken());
		profielReqHeader.add("ContentType", kakaoConfig.getKakaoContentType());
		
		
		HttpEntity<MultiValueMap<String, String>> profileReqMsg = new HttpEntity<>(profielReqHeader);
		
		// 카카오 프로필 정보 가져오기
		ResponseEntity<KakaoProfileRespDTO> profileRspResult 
		= restTemplate.exchange(kakaoConfig.getKakaoProfileUri(), HttpMethod.POST, profileReqMsg, KakaoProfileRespDTO.class);
		
		// 카카오 프로필 정보
		KakaoProfileRespDTO profileResult = profileRspResult.getBody();
		
		// 회원가입 DTO
		SignUpDTO signUpDTO = SignUpDTO.builder()
				.name(profileResult.getKakaoAccount().getName())
				.nickname(profileResult.getProperties().getNickname())
				.gender(profileResult.getKakaoAccount().getGender())
				.email(profileResult.getKakaoAccount().getEmail())
				.phone(profileResult.getKakaoAccount().getPhoneNumber())
				.comment(null).build();

		// 카카오 사용자 정보로 db조회
		User user = readUserByNameAndPhone(signUpDTO.getName(), signUpDTO.getPhone());
		if (user == null) {
			// 회원가입
			signUpProc(signUpDTO);
			User newUser = readUserByNameAndPhone(signUpDTO.getName(), signUpDTO.getPhone());
			return newUser;
		}

		return user;
	}

	/**
	 * @Method Name : googleLoginUrl
	 * @작성일 : 2024. 2. 19.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 :
	 */
	public String googleLoginUrl() {
		String url = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + googleConfig.getGoogleClientId()
				+ "&redirect_uri=" + googleConfig.getGoogleRedirectUri()
				+ "&response_type=code&scope=email%20profile%20openid&access_type=offline";

		String naverLoginUrl = String.format("%s?response_type=code&client_id=%s&state=STATE_STRING&redirect_uri=%s",
				naverConfig.getNaverAuthorizationUri(), naverConfig.getNaverClientId(),
				naverConfig.getNaverRedirectUri());
		return naverLoginUrl;
	}

}