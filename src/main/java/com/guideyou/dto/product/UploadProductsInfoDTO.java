/**
 * 
 */
package com.guideyou.dto.product;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
 * @FileName : UploadProductsInfoDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 26.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 사용자가 업로드한 상품 정보 DTO
 */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UploadProductsInfoDTO {
	private Integer productId;
	private String cityName;
	private String productPhotoPath;
	private String title;
	private String shortIntroContent;
	private Long productPrice;
	private Timestamp uploadTime;
}
