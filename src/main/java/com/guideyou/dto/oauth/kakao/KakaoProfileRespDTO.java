package com.guideyou.dto.oauth.kakao;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.guideyou.dto.oauth.naver.NaverProfileRespDTO;

import lombok.Data;

/**
 * @FileName : KakaoProfileRespDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 19.
 * @작성자 : 최장호
 * @변경이력 : 카카오 프로필 응답 DTO
 * @프로그램 설명 :
 */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoProfileRespDTO {
	private long id;
	private String connectedAt;
	private Properties properties;
	private KakaoAccount kakaoAccount;

	@Data
	public class Properties {
		private String nickname;
		private String profileImage;
		private String thumbnailImage;
	}

	@Data
	@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
	public class KakaoAccount {
		private Profile profile;
		private String name;
		private String email;
		private String phoneNumber;
		private String gender;

		@Data
		public class Profile {
			private String nickname;
			private String thumbnailImageUrl;
			private String profileImageUrl;
		}
	}
	
	public String transPhoneNumber() {
		  String formattedNum = this.kakaoAccount.phoneNumber.replaceAll("\\+82\\s*", "0");
		  
		  return formattedNum;
	}

}
