package com.guideyou.dto.product.location;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
 * @FileName : ProductLocationDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 29.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 지도 저장 버튼 클릭시 json형식으로 응답 받는 DTO
 */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductLocationSaveRspDTO {
	private Integer id;
	private double lat;
	private double lng;
	private String placeName;
	private String roadAddressName;
	private String addressName;
	private String phone;
}
