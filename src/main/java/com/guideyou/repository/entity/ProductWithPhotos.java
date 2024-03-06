package com.guideyou.repository.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductWithPhotos {
	private Integer id;
	private Integer userId;
	private Integer cityCodeId;
	private String title;
	private String content;
	private Long price;
	private Integer soldCount;
	private Integer wishCount;
	private Integer viewCount;
	private Timestamp createdAt;
	
	
	
	
	/**
	  * @Method Name : fomatPrice
	  * @작성일 : 2024. 3. 6.
	  * @작성자 : 장명근
	  * @변경이력 : 
	  * @Method 설명 : price 포맷
	  */
	public String fomatPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formaterNumber = df.format(price);
		return formaterNumber + "원";
	}
}
