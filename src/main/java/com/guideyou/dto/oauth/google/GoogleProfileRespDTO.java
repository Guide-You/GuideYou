/**
 * 
 */
package com.guideyou.dto.oauth.google;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
 * @FileName : GoogleProfileRespDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 19.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 구글 프로필 요청 DTO
 */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class GoogleProfileRespDTO {
	private String id;
	private String email;
	private String name;
	private String picture;
}
