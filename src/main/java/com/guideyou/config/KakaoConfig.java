package com.guideyou.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;

/**
 * @FileName : KakaoConfig.java
 * @Project : GuideYou
 * @Date : 2024. 2. 19.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 카카오 로그인 api 세팅 값 객체
 */
@Component
@Getter
public class KakaoConfig {

	@Value("${kakao.client.id}")
	private String kakaoClientId;

	@Value("${kakao.redirect.uri}")
	private String kakaoRedirectUri;

	@Value("${kakao.authorization.uri}")
	private String kakaoAuthorizationUri;

	@Value("${kakao.token.uri}")
	private String kakaoTokenUri;

	@Value("${kakao.grant.type}")
	private String kakaoGrantType;

	@Value("${kakao.content.type}")
	private String kakaoContentType;

	@Value("${kakao.profile.uri}")
	private String kakaoProfileUri;

}