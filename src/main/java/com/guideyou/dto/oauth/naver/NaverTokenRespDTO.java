package com.guideyou.dto.oauth.naver;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
 * @FileName : NaverTokenDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 18.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 네이버 토큰 응답 DTO
 */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class NaverTokenRespDTO {
	private String accessToken;
	private String refreshToken;
	private String tokenType;
	private String expiresIn;
}