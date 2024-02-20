package com.guideyou.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;

/**
  * @FileName : GoogleConfig.java
  * @Project : GuideYou
  * @Date : 2024. 2. 19. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 구글 로그인 api 세팅 값 객체
  */
@Component
@Getter
public class GoogleConfig {

	@Value("${google.authorization.uri}")
	private String googleAuthorizationUri;

	@Value("${google.client.id}")
    private String googleClientId;

    @Value("${google.client.secret}")
    private String googleClientSecret;

    @Value("${google.redirect.uri}")
    private String googleRedirectUri;

    @Value("${google.token.uri}")
    private String googleTokenUri;

    @Value("${google.resource.uri}")
    private String googleResourceUri;

    @Value("${google.profile.uri}")
    private String googleProfileUri;

    @Value("${google.grant.type}")
    private String googleGrantType;

    @Value("${google.scope.email}")
    private String googleScopeEmailUrl;
    
    @Value("${google.scope.profile}")
    private String googleScopeProfileUrl;
    
    @Value("${google.scope.gender}")
    private String googleScopeGenderUrl;
    
    @Value("${google.scope.phonenumbers}")
    private String googleScopePhonenumbersUrl;

    @Value("${google.api.people}")
    private String googleApiPeopleUrl;
}