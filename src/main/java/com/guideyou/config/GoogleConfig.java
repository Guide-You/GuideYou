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
}