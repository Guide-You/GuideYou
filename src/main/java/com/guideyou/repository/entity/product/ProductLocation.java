package com.guideyou.repository.entity.product;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : ProductLocation.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 상품 정보 entity
  */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductLocation {
	private Integer id;
	private Integer productId;
	private double lat;
	private double lng;
	private String placeName;
	private String roadAddressName;
	private String addressName;
	private String phone;
	private Timestamp createdAt;
}
