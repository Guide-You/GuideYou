/**
 * 
 */
package com.guideyou.dto.oauth.google;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : GoogleTokenRespDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 19. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 구글 토큰 응답 DTO
  */

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class GoogleTokenRespDTO {
	private String accessToken;
	private int expiresIn;
	private String scope;
	private String tokenType;
	private String idToken;
}
