package com.guideyou.dto.oauth.naver;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : NaverProfileDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 18. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 네이버 사용자 프로필 정보 응답 DTO
  */

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class NaverProfileRespDTO {

	private String resultcode;
	private String message;
	private Response response;

	@Data
	public class Response {
		private String id;
		private String nickname;
		private String profileImage;
		private String email;
		private String name;
		private String gender;
		private String mobile;
	}
}