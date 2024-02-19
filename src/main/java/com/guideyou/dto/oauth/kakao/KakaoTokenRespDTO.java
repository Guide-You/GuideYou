package com.guideyou.dto.oauth.kakao;


import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : KakaoTokenRespDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 19. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 카카오 토큰 응답 DTO
  */
@Data
// json 형식에 코딩 컨벤션의 스네이크 케이스를 카멜 노이션으로 변경하기
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoTokenRespDTO {
	private String accessToken; // 사용자 액세스 토큰 값
	private String tokenType; // 토큰 타입, bearer로 고정
	private String refreshToken; // 사용자 리프레시 토큰 값
	private Integer expiresIn; // 액세스 토큰과 ID 토큰의 만료 시간(초
	private String scope; // (필수 X) 인증된 사용자의 정보 조회 권한 범위
	private Integer refreshTokenExpiresIn; // 리프레시 토큰 만료 시간(초)
	private String idToken; // (필수 X) OpenID Connect 확장 기능을 통해 발급되는 ID 토큰, Base64 인코딩 된 사용자 인증 정보 포함
}
