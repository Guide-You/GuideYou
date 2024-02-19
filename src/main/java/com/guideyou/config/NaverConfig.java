package com.guideyou.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;

/**
  * @FileName : NaverConfig.java
  * @Project : GuideYou
  * @Date : 2024. 2. 18. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 네이버 로그인 api 세팅 값 객체
  */
@Component
@Getter
public class NaverConfig {

    @Value("${naver.client.id}")
    private String naverClientId;

    @Value("${naver.client.secret}")
    private String naverClientSecret;

    @Value("${naver.redirect.uri}")
    private String naverRedirectUri;

    @Value("${naver.authorization.uri}")
    private String naverAuthorizationUri;

    @Value("${naver.token.uri}")
    private String naverTokenUri;

    @Value("${naver.token.grant-type}")
    private String naverTokenGrantType;

    @Value("${naver.profile.uri}")
    private String naverProfileUri;

}