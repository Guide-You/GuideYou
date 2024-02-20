package com.guideyou.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.guideyou.config.GoogleConfig;
import com.guideyou.config.KakaoConfig;
import com.guideyou.config.NaverConfig;
import com.guideyou.dto.oauth.google.GooglePersonRespDTO;
import com.guideyou.dto.oauth.google.GoogleProfileRespDTO;
import com.guideyou.dto.oauth.google.GoogleTokenRespDTO;
import com.guideyou.dto.oauth.kakao.KakaoProfileRespDTO;
import com.guideyou.dto.oauth.kakao.KakaoTokenRespDTO;
import com.guideyou.dto.oauth.naver.NaverProfileRespDTO;
import com.guideyou.dto.oauth.naver.NaverTokenRespDTO;
import com.guideyou.dto.user.SignUpDTO;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.interfaces.user.UserRepository;
import com.guideyou.utils.Define;

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
	// repoistory
	@Autowired
	private UserRepository userRepository;

	// config
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
	public void signUpProc(SignUpDTO signUpDTO) {
		User user = User.builder().id(null).name(signUpDTO.getName()).nickname(signUpDTO.getNickname())
				.gender(signUpDTO.getGender()).email(signUpDTO.getEmail()).phone(signUpDTO.getPhone())
				.comment(signUpDTO.getComment()).createdAt(null).build();

		int result = userRepository.insert(user);

		if (result != 1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		return userRepository.findByNameAndPhone(map);
	}
	
	
	/**
	  * @Method Name : readUserByNameAndEmail
	  * @작성일 : 2024. 2. 20.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 이름과 이메일로 사용자 조회
	  */
	public User readUserByNameAndEmail(String name, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		return userRepository.findByNameAndPhone(map);
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
	public SignUpDTO signInProcByNaver(String code, String state) {
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
		return signUpDTO;
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
	public SignUpDTO signInProcByKakao(String code, String state) {

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
		ResponseEntity<KakaoTokenRespDTO> tokenRspResult = restTemplate.exchange(kakaoConfig.getKakaoTokenUri(),
				HttpMethod.POST, tokenReqMsg, KakaoTokenRespDTO.class);

		// 토큰으로 프로필 접근
		HttpHeaders profielReqHeader = new HttpHeaders();
		profielReqHeader.add("Authorization", "Bearer " + tokenRspResult.getBody().getAccessToken());
		profielReqHeader.add("ContentType", kakaoConfig.getKakaoContentType());

		HttpEntity<MultiValueMap<String, String>> profileReqMsg = new HttpEntity<>(profielReqHeader);

		// 카카오 프로필 정보 가져오기
		ResponseEntity<KakaoProfileRespDTO> profileRspResult = restTemplate.exchange(kakaoConfig.getKakaoProfileUri(),
				HttpMethod.POST, profileReqMsg, KakaoProfileRespDTO.class);

		// 카카오 프로필 정보
		KakaoProfileRespDTO profileResult = profileRspResult.getBody();

		// 회원가입 DTO
		SignUpDTO signUpDTO = SignUpDTO.builder().name(profileResult.getKakaoAccount().getName())
				.nickname(profileResult.getProperties().getNickname())
				.gender(profileResult.getKakaoAccount().getGender()).email(profileResult.getKakaoAccount().getEmail())
				.phone(profileResult.transPhoneNumber()).comment(null).build();

		return signUpDTO;
	}

	/**
	 * @Method Name : googleLoginUrl
	 * @작성일 : 2024. 2. 19.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 구글 로그인 요청 Url
	 */
	public String googleLoginUrl() {
		String googleLoginUrl = String.format("%s?client_id=%s&redirect_uri=%s&response_type=code&scope=%s %s %s %s" , 
				googleConfig.getGoogleAuthorizationUri(),
				googleConfig.getGoogleClientId(),
				googleConfig.getGoogleRedirectUri(),
				googleConfig.getGoogleScopeEmailUrl(),
				googleConfig.getGoogleScopeProfileUrl(),
				googleConfig.getGoogleScopeGenderUrl(),
				googleConfig.getGoogleScopePhonenumbersUrl()
				);
		return googleLoginUrl;
	}

	/**
	  * @Method Name : signInProcByGoogle
	  * @작성일 : 2024. 2. 19.
	  * @작성자 : 최장호
	  * @변경이력 : 
	  * @Method 설명 : 구글을 통한 로그인
	  * @param code
	  * @return
	  */
	public SignUpDTO signInProcByGoogle(String code) {
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, String> tokenReqBody = new LinkedMultiValueMap<>();
		tokenReqBody.add("code", code);
		tokenReqBody.add("client_id", googleConfig.getGoogleClientId());
		tokenReqBody.add("client_secret", googleConfig.getGoogleClientSecret());
		tokenReqBody.add("redirect_uri", googleConfig.getGoogleRedirectUri());
		tokenReqBody.add("grant_type", googleConfig.getGoogleGrantType());

		// 토큰 응답
		ResponseEntity<GoogleTokenRespDTO> tokenRespResult = restTemplate.postForEntity(googleConfig.getGoogleTokenUri(), tokenReqBody,
				GoogleTokenRespDTO.class);
		
		HttpHeaders profileReqHeader = new HttpHeaders();

		profileReqHeader.add("Authorization", "Bearer " + tokenRespResult.getBody().getAccessToken());
		HttpEntity<MultiValueMap<String, String>> googleInfo = new HttpEntity<>(profileReqHeader);
		ResponseEntity<GoogleProfileRespDTO> profileRespResult = restTemplate.exchange(googleConfig.getGoogleProfileUri(),
				HttpMethod.GET, googleInfo, GoogleProfileRespDTO.class);
		
		// 구글 프로필 정보 - 이름, 이메일, 프로필사진
		GoogleProfileRespDTO googleProfileRespDTO = profileRespResult.getBody();
		
		String apiUrl = googleConfig.getGoogleApiPeopleUrl();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + tokenRespResult.getBody().getAccessToken());

        RequestEntity<Void> request = null;
		try {
			request = new RequestEntity<>(headers, HttpMethod.GET, new URI(apiUrl));
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

        ResponseEntity<GooglePersonRespDTO> response = new RestTemplate().exchange(request, GooglePersonRespDTO.class);
        // 구글 추가 정보 - 성별, 전화번호
        GooglePersonRespDTO googlePersonRespDTO = response.getBody();
        
		// 회원가입 DTO
		SignUpDTO signUpDTO = SignUpDTO.builder().name(googleProfileRespDTO.getName())
				.nickname(Define.DEFAULT_NICKNAME)
				.gender(googlePersonRespDTO.getGenders().get(0).getValue())
				.email(googleProfileRespDTO.getEmail())
				// 전화번호가 없으면 Define.GOOGLE_PHONENUMBER로 세팅
				.phone((googlePersonRespDTO.getPhoneNumbers() == null) ?
						Define.DEFAULT_PHONENUMBER : googlePersonRespDTO.getPhoneNumbers().get(0).getValue())
				.comment(null).build();

		// TODO : 이미지 불러오기 해야함 - 최장호 - 240220
		
		return signUpDTO;
	}
}